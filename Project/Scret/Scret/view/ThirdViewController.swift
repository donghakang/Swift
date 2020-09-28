//
//  ThirdViewController.swift
//  Scret
//
//  Created by Dongha Kang on 2020/09/20.
//  Copyright © 2020 Dongha Kang. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    
    var collectionView: UICollectionView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: self.view.frame.width/2.2, height: self.view.frame.width/2.2)
        
        let mosaicLayout = MosaicLayout()
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: mosaicLayout)
        
        collectionView?.backgroundColor = .white
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        collectionView?.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        
        collectionView?.register(LetterCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: LetterCollectionReusableView.identifier)
        
        view.addSubview(collectionView!)
        
        
    
    }

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView?.frame = view.bounds
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath)
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: LetterCollectionReusableView.identifier, for: indexPath) as! LetterCollectionReusableView
        
        header.configure()
        
        return header
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width
                      , height: 100)
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
}
