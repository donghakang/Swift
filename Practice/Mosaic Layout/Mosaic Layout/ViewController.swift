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


// MARK: View Controller Cell Items,
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



// MARK: View Controller Layout
extension ViewController: TRMosaicLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, mosaicCellSizeTypeAtIndexPath indexPath: IndexPath) -> TRMosaicCellType {

        if indexPath.item == 9 {
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
