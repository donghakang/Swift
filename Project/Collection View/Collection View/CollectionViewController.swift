//
//  CollectionViewController.swift
//  Collection View
//
//  Created by Dongha Kang on 2020/09/22.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController {

//    let countryNames : [String] = ["USA", "Korea", "China", "Japan", "England", "New Zealand", "Vietnam"]
    
    let itemsPerRow: CGFloat = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }
}



extension CollectionViewController {
    
    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // 아이템 섹션 갯수
        return 100
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 아이템 갯수
//        return Int(itemsPerRow)
        return 3
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        let randomColor:UIColor = .random
        cell.backgroundColor = randomColor
//        cell.backgroundColor = .red
        
        // Configure the cell
        return cell
    }
    
    
}



extension CollectionViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width / 3.0, height: view.frame.width / 3.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0.0
//    }
//
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}


extension UIColor {
    static var random: UIColor {
        return .init(hue: .random(in: 0...1), saturation: 1, brightness: 1, alpha: 1)
    }
}

//
//
//func collectionView(_ collectionView: UICollectionView,
//                      layout collectionViewLayout: UICollectionViewLayout,
//                      sizeForItemAt indexPath: IndexPath) -> CGSize {
//    var newSize: CGSize = CGSize.zero
//    newSize.height = 100;
//
//
//
//    if(indexPath.item % 4 == 0 || indexPath.item % 4 == 3)
//    {
//        // Size : 1/4th of screen
//        newSize.width = view.frame.width * 0.23;
//    }
//    else
//    {
//        // Size : 3/4th of screen
//        newSize.width = view.frame.width * 0.72;
//
//    }
//    return newSize;
//}
//
////3
//  func collectionView(_ collectionView: UICollectionView,
//                      layout collectionViewLayout: UICollectionViewLayout,
//                      insetForSectionAt section: Int) -> UIEdgeInsets {
//    return UIEdgeInsets.zero
//  }
//
//  // 4
////      func collectionView(_ collectionView: UICollectionView,
////                          layout collectionViewLayout: UICollectionViewLayout,
////                          minimumLineSpacingForSectionAt section: Int) -> CGFloat {
////        return 10
////      }
