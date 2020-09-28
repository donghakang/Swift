//
//  SecondViewController.swift
//  Scret
//
//  Created by Dongha Kang on 2020/09/20.
//  Copyright © 2020 Dongha Kang. All rights reserved.
//

import UIKit
import Photos

class SecondViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    
    var assets = [PHAsset]()
    var imageArray = [UIImage]()
    
    var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageSetup()
        setupCollectionView()
        
    
        addGesture()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if collectionView!.numberOfItems(inSection: 0) > 0 {
            collectionView!.scrollToItem(at: IndexPath(item: 0, section: 0), at: .top, animated: false)
        }
    }

    
    

    // MARK: Gesture Recognition
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

    
    
    
    // setup
    func setupCollectionView() {
        // Setup the mosaic collection view.
        let mosaicLayout = MosaicLayout()
        
        
        collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: mosaicLayout)
        collectionView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView?.alwaysBounceVertical = true
        collectionView?.indicatorStyle = .white
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.register(MosaicCell.self, forCellWithReuseIdentifier: MosaicCell.identifer)
        
        collectionView?.register(LetterCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: LetterCollectionReusableView.identifier)
        

        self.view.addSubview(collectionView!)
        
        
    }   
    
    
    

    
    
    
    
    
    
    
    
    // MARK: UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MosaicCell.identifer, for: indexPath) as? MosaicCell
                    else { preconditionFailure("Failed to load collection view cell") }
        
        
        cell.imageView.image = imageArray[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: LetterCollectionReusableView.identifier, for: indexPath) as! LetterCollectionReusableView
        
        header.configure()
        
        return header
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 100)
    }

    
    
    
    
    // MARK: Images
    func imageSetup() {
        print(imageArray.count)
        for i in 0..<1 {
            imageArray.append(UIImage(named: "M/" + String(i))!)
        }
    }
    
    
    

}

