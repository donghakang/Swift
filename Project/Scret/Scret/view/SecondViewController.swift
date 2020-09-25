//
//  SecondViewController.swift
//  Scret
//
//  Created by Dongha Kang on 2020/09/20.
//  Copyright © 2020 Dongha Kang. All rights reserved.
//

import UIKit
import Photos

class SecondViewController: UICollectionViewController {
    
    var assets = [PHAsset]()
    
    var imageArray = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup the mosaic collection view.
        let mosaicLayout = MosaicLayout()
        collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: mosaicLayout)
        collectionView.backgroundColor = UIColor.appBackgroundColor
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.alwaysBounceVertical = true
        collectionView.indicatorStyle = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MosaicCell.self, forCellWithReuseIdentifier: MosaicCell.identifer)

        self.view.addSubview(collectionView)
        
        imageSetup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if collectionView.numberOfItems(inSection: 0) > 0 {
            collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .top, animated: false)
        }
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Always show 50K cells so scrolling performance can be tested.
        print(imageArray.count)
        return imageArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MosaicCell.identifer, for: indexPath) as? MosaicCell
            else { preconditionFailure("Failed to load collection view cell") }
        
    
        cell.imageView.image = imageArray[indexPath.item]
        
        return cell
    }
    
    
    // MARK: Images
    func imageSetup() {
        for i in 0..<11 {
            imageArray.append(UIImage(named: "BA/" + String(i))!)

        }
    }
    

}

