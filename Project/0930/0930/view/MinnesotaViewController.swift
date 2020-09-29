//
//  MinnesotaViewController.swift
//  0930
//
//  Created by Dongha Kang on 2020/09/28.
//

import UIKit

struct LetterData {
    var title: String
    var letter: String
    var startColor: UIColor
    var endColor: UIColor
}

class MinnesotaViewController: UICollectionViewController {

    // DATA
    var imageArray = [UIImage]()
    let data: LetterData = LetterData(title: "미네소타",
                                      letter: "안녕하세요",
                                      startColor: UIColor(red: 26.0/255.0, green: 35.0/255.0, blue: 126.0/255.0, alpha: 1),
                                      endColor: UIColor(red: 106.0/255.0, green: 27.0/255.0, blue: 154.0/255.0, alpha: 1))
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageSetup()
        setup()
        
        addGesture()
    }
    
    
    private func setup() {
        let mosaicLayout = TRMosaicLayout()
        
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: mosaicLayout)
        self.view.addSubview(collectionView!)
        
        mosaicLayout.delegate = self
        collectionView.register(LetterCollectionViewCell.self, forCellWithReuseIdentifier: LetterCollectionViewCell.identifier)
//        LetterCollectionViewCell.startColor = UIColor(red: 26.0/255.0, green: 35.0/255.0, blue: 126.0/255.0, alpha: 1)
//        LetterCollectionViewCell.endColor = UIColor(red: 106.0/255.0, green: 27.0/255.0, blue: 154.0/255.0, alpha: 1)
        
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
    
        
        // layout
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        collectionView?.backgroundColor = .white

        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        
    }

}



// MARK: View Controller Cell Items,
extension MinnesotaViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if (indexPath.item == imageArray.count - 1) {
            
            let letterCell = collectionView.dequeueReusableCell(withReuseIdentifier: LetterCollectionViewCell.identifier, for: indexPath) as! LetterCollectionViewCell
            
            letterCell.data = data
            
            return letterCell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
            
            cell.imageView.image = imageArray[indexPath.item]
            return cell
        }
    }
}



// MARK: View Controller Layout
extension MinnesotaViewController: TRMosaicLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, mosaicCellSizeTypeAtIndexPath indexPath: IndexPath) -> TRMosaicCellType {

        if indexPath.item == imageArray.count - 1 {
            return TRMosaicCellType.full
        } else {
            return indexPath.item % 3 == 0 ? TRMosaicCellType.big : TRMosaicCellType.small
        }
    }
    
    func collectionView(_ collectionView:UICollectionView, layout collectionViewLayout: TRMosaicLayout, insetAtSection:Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func heightForSmallMosaicCell() -> CGFloat {
        return collectionView.frame.size.width / 3
    }
}

// MARK: Images
extension MinnesotaViewController {
    
    func imageSetup() {
        print(imageArray.count)
        for i in 0..<40 {
            imageArray.append(UIImage(named: "M/" + String(i))!)
        }
    }
    
}


// MARK: Gesture Recognizer
extension MinnesotaViewController {
    func addGesture() {
        let backSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeHandler(sender:)))
        backSwipeGesture.direction = .right
        let downSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeHandler(sender:)))
        downSwipeGesture.direction = .down
        self.view.addGestureRecognizer(backSwipeGesture)
        self.view.addGestureRecognizer(downSwipeGesture)
        
    }

    @objc func swipeHandler(sender: UISwipeGestureRecognizer) {
        if sender.state == .ended {
            if sender.direction == .right {
                _ = navigationController?.popViewController(animated: true)
            }
        }
    }
}




// MARK: Extra Stuff
extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(
           red:   .random(),
           green: .random(),
           blue:  .random(),
           alpha: 1.0
        )
    }
}
