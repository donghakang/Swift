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
    
    let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
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
        return 100
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        if (indexPath.row % 2 == 0) {
            cell.backgroundColor = .green
        } else {
            cell.backgroundColor = .cyan
        }
        
        // Configure the cell
        return cell
    }
}



extension CollectionViewController : UICollectionViewDelegateFlowLayout {
    
    

    
    func collectionView(_ collectionView: UICollectionView,
                          layout collectionViewLayout: UICollectionViewLayout,
                          sizeForItemAt indexPath: IndexPath) -> CGSize {
        //2
        
        
        var newSize: CGSize = CGSize.zero
        newSize.height = 100;



        if(indexPath.item % 4 == 0 || indexPath.item % 4 == 3)
        {
            // Size : 1/4th of screen
            newSize.width = view.frame.width * 0.23;
        }
        else
        {
            // Size : 3/4th of screen
            newSize.width = view.frame.width * 0.72;

        }
        return newSize;
//        return CGSize(width: width, height: height)
        
        
//        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
//        let availableWidth = view.frame.width - paddingSpace
//        let widthPerItem = availableWidth / itemsPerRow

//        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
//    //3
//      func collectionView(_ collectionView: UICollectionView,
//                          layout collectionViewLayout: UICollectionViewLayout,
//                          insetForSectionAt section: Int) -> UIEdgeInsets {
//        return sectionInsets
//      }
//
      // 4
//      func collectionView(_ collectionView: UICollectionView,
//                          layout collectionViewLayout: UICollectionViewLayout,
//                          minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 10
//      }
}
