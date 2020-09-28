//
//  ViewController.swift
//  Mosaic Layout
//
//  Created by Dongha Kang on 2020/09/28.
//

import UIKit


class ViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let mosaicLayout = TRMosaicLayout()
        self.collectionView?.collectionViewLayout = mosaicLayout
        mosaicLayout.delegate = self
        
    
        collectionView?.backgroundColor = .white
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        
        collectionView.register(FooterCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterCollectionReusableView.identifier)
        view.addSubview(collectionView!)
    }
}

extension ViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath)
        
        cell.backgroundColor = .random()
        return cell
    }
}



extension ViewController: TRMosaicLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, mosaicCellSizeTypeAtIndexPath indexPath: IndexPath) -> TRMosaicCellType {
//        
//        if indexPath.item == 0 {
//            return TRMosaicCellType.one
//        } else if (10 - indexPath.item < 3) {
//            if (10 - indexPath.item == 0) {
//                return indexPath.item % 3 == 1 ? TRMosaicCellType.big : TRMosaicCellType.small
//            } else {
//                return TRMosaicCellType.one
//            }
//        } else {
//            return indexPath.item % 3 == 1 ? TRMosaicCellType.big : TRMosaicCellType.small
//        }
//        
        return indexPath.item % 3 == 0 ? TRMosaicCellType.big : TRMosaicCellType.small
    }
    
    func collectionView(_ collectionView:UICollectionView, layout collectionViewLayout: TRMosaicLayout, insetAtSection:Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func heightForSmallMosaicCell() -> CGFloat {
        return 150
    }
}

// MARK: footer
extension ViewController : UICollectionViewDelegateFlowLayout {
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: FooterCollectionReusableView.identifier, for: indexPath) as! FooterCollectionReusableView
        
        footer.configure()
        
        return footer
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 300)
    }
}


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
