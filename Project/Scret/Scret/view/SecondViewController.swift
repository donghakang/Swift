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
    
    
    @IBOutlet var imageCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        
        addGesture()
    }

//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        if collectionView.numberOfItems(inSection: 0) > 0 {
//            collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .top, animated: false)
//        }
//    }

    
    

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
        
        imageCollectionView.frame = self.view.bounds
        imageCollectionView.collectionViewLayout = mosaicLayout
//        collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: mosaicLayout)
        imageCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        imageCollectionView.alwaysBounceVertical = true
        imageCollectionView.indicatorStyle = .white
        imageCollectionView.delegate = self
        imageCollectionView.dataSource = self
        imageCollectionView.register(MosaicCell.self, forCellWithReuseIdentifier: MosaicCell.identifer)

        self.view.addSubview(imageCollectionView)
        
        imageSetup()
    }
    
    
    func setupTextView() {
        let textview = UITextView()
        textview.translatesAutoresizingMaskIntoConstraints = false
        textview.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        textview.heightAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true // Y 사이즈
        textview.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true  // X 사이즈
           
        textview.text = "HELLO WORLD"
        textview.backgroundColor = .cyan
        
        self.view.addSubview(textview)
    }
    
    
    
    
    
    
    
    
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Always show 50K cells so scrolling performance can be tested.
        return imageArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MosaicCell.identifer, for: indexPath) as? MosaicCell
            else { preconditionFailure("Failed to load collection view cell") }
        
    
        cell.imageView.image = imageArray[indexPath.item]
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let letterView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "myLetter", for: indexPath) as! LetterView
        
        letterView.backgroundColor = .cyan
        
        letterView.gradationImageView.backgroundColor = .systemPink
        letterView.letterView.backgroundColor = .red
        return letterView
    }
    
    // MARK: Images
    func imageSetup() {
        print(imageArray.count)
        for i in 0..<41 {
            imageArray.append(UIImage(named: "M/" + String(i))!)
        }
    }
    
    
    

}

