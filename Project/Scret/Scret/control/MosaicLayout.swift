
import UIKit

enum MosaicSegmentStyle {
    case fullWidth
    case thirds
    case twoThirdsOneThird
    case oneThirdTwoThirds
}

class MosaicLayout: UICollectionViewLayout {

    var contentBounds = CGRect.zero
    var cachedAttributes = [UICollectionViewLayoutAttributes]()
    
    /// - Tag: PrepareMosaicLayout
    override func prepare() {
        super.prepare()
        
        guard let collectionView = collectionView else { return }

        // Reset cached information.
        cachedAttributes.removeAll()
        contentBounds = CGRect(origin: .zero, size: collectionView.bounds.size)
        
        // For every item in the collection view:
        //  - Prepare the attributes.
        //  - Store attributes in the cachedAttributes array.
        //  - Combine contentBounds with attributes.frame.
        let count = collectionView.numberOfItems(inSection: 0)
        
        var currentIndex = 0
        var segment: MosaicSegmentStyle = .thirds
        var lastFrame: CGRect = .zero
        
        let cvWidth = collectionView.bounds.size.width
        
        while currentIndex < count + 1 {
            var segmentFrame = CGRect(x: 0, y: lastFrame.maxY, width: cvWidth, height: cvWidth)
            
            var segmentRects = [CGRect]()
            switch segment {
            case .fullWidth:
                segmentRects = [segmentFrame]
                
            case .thirds:
                segmentFrame = CGRect(x: 0, y: lastFrame.maxY, width: cvWidth, height: cvWidth / 3)
                let horizontalSlices = segmentFrame.dividedThreeEqually(from: .minXEdge)
                segmentRects = [horizontalSlices.first, horizontalSlices.second, horizontalSlices.third]
    
            case .twoThirdsOneThird:
                segmentFrame = CGRect(x: 0, y: lastFrame.maxY, width: cvWidth, height: cvWidth * 2 / 3)
                let horizontalSlices = segmentFrame.dividedIntegral(fraction: (2.0 / 3.0), from: .minXEdge)
                let verticalSlices = horizontalSlices.second.dividedIntegral(fraction: 0.5, from: .minYEdge)
                segmentRects = [horizontalSlices.first, verticalSlices.first, verticalSlices.second]
                
            case .oneThirdTwoThirds:
                segmentFrame = CGRect(x: 0, y: lastFrame.maxY, width: cvWidth, height: cvWidth * 2 / 3)
                let horizontalSlices = segmentFrame.dividedIntegral(fraction: (1.0 / 3.0), from: .minXEdge)
                let verticalSlices = horizontalSlices.first.dividedIntegral(fraction: 0.5, from: .minYEdge)
                segmentRects = [verticalSlices.first, verticalSlices.second, horizontalSlices.second]
            }
            
            // Create and cache layout attributes for calculated frames.
            for rect in segmentRects {
                let attributes = UICollectionViewLayoutAttributes(forCellWith: IndexPath(item: currentIndex, section: 0))
                attributes.frame = rect
                
                cachedAttributes.append(attributes)
                contentBounds = contentBounds.union(lastFrame)
                
                currentIndex += 1
                lastFrame = rect
            }

            // Determine the next segment style.
        
             switch count - currentIndex {
             case 1:
                 segment = .fullWidth
             default:
                 switch segment {
                 case .fullWidth:
                     segment = .thirds
                 case .thirds:
                     segment = .twoThirdsOneThird
                 case .twoThirdsOneThird:
                     segment = .oneThirdTwoThirds
                 case .oneThirdTwoThirds:
                     segment = .thirds
                 }
             }

            
//            segment = .thirds
        }
        
    }
    

    /// - Tag: CollectionViewContentSize
    override var collectionViewContentSize: CGSize {
        return contentBounds.size
    }
    
    /// - Tag: ShouldInvalidateLayout
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        guard let collectionView = collectionView else { return false }
        return !newBounds.size.equalTo(collectionView.bounds.size)
    }
    
    /// - Tag: LayoutAttributesForItem
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cachedAttributes[indexPath.item]
    }
    
    /// - Tag: LayoutAttributesForElements
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var attributesArray = [UICollectionViewLayoutAttributes]()
        
        // Find any cell that sits within the query rect.
        guard let lastIndex = cachedAttributes.indices.last,
              let firstMatchIndex = binSearch(rect, start: 0, end: lastIndex) else { return attributesArray }
        
        // Starting from the match, loop up and down through the array until all the attributes
        // have been added within the query rect.
        for attributes in cachedAttributes[..<firstMatchIndex].reversed() {
            guard attributes.frame.maxY >= rect.minY else { break }
            attributesArray.append(attributes)
        }
        
        for attributes in cachedAttributes[firstMatchIndex...] {
            guard attributes.frame.minY <= rect.maxY else { break }
            attributesArray.append(attributes)
        }
        
        return attributesArray
    }
    
    // Perform a binary search on the cached attributes array.
    func binSearch(_ rect: CGRect, start: Int, end: Int) -> Int? {
        if end < start { return nil }
        
        let mid = (start + end) / 2
        let attr = cachedAttributes[mid]
        
        if attr.frame.intersects(rect) {
            return mid
        } else {
            if attr.frame.maxY < rect.minY {
                return binSearch(rect, start: (mid + 1), end: end)
            } else {
                return binSearch(rect, start: start, end: (mid - 1))
            }
        }
    }

}



extension CGRect {
    func dividedIntegral(fraction: CGFloat, from fromEdge: CGRectEdge) -> (first: CGRect, second: CGRect) {
        let dimension: CGFloat
        
        switch fromEdge {
        case .minXEdge, .maxXEdge:
            dimension = self.size.width
        case .minYEdge, .maxYEdge:
            dimension = self.size.height
        }
        
        let distance = (dimension * fraction).rounded(.up)
        let slices = self.divided(atDistance: distance, from: fromEdge)
        
//        /// - Edge Checking
//        switch fromEdge {
//        case .minXEdge, .maxXEdge:
//            slices.remainder.origin.x += 1
//            slices.remainder.size.width -= 1
//        case .minYEdge, .maxYEdge:
//            slices.remainder.origin.y += 1
//            slices.remainder.size.height -= 1
//        }
        
        return (first: slices.slice, second: slices.remainder)
    }
    
    func dividedThreeEqually(from fromEdge: CGRectEdge) -> (first: CGRect, second: CGRect, third: CGRect) {
        let dimension: CGFloat
            
        dimension = self.size.width
          
        let distance = (dimension / 3.0).rounded(.up)
        let slices = self.divided(atDistance: distance, from: fromEdge)
        
        let firstSlice = slices.slice
        let remainderSlice = slices.remainder
        
        let newSlices = remainderSlice.divided(atDistance: distance, from: fromEdge)
        
        return (first: firstSlice, second: newSlices.slice, third: newSlices.remainder)
//        /// - Edge Checking
//        switch fromEdge {
//        case .minXEdge, .maxXEdge:
//            slices.remainder.origin.x += 1
//            slices.remainder.size.width -= 1
//        case .minYEdge, .maxYEdge:
//            slices.remainder.origin.y += 1
//            slices.remainder.size.height -= 1
//        }
        

    }
    
}

extension UIColor {
    static let appBackgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
}