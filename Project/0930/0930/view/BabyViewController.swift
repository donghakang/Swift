//
//  BabyViewController.swift
//  0930
//
//  Created by Dongha Kang on 2020/09/28.
//

import UIKit
import AVFoundation


class BabyViewController: UICollectionViewController {

    // DATA
    var imageArray = [UIImage]()
    let data: LetterData = LetterData(title: "푸린이,",
                                      letter: "간혹 너의 옛날 사진들을 보면서 어렸을때 너를 알았었더라면 너는 나에게 어떤 기억으로 남을까 라는 생각을 하곤해 \n\n포동포동하니 잘 먹는 어린이였을까..? \n\n너의 부모님이 말씀하신대로 말을 엄청 잘듣는 재미없는 착한 친구였을까..? \n아니면 내가 농담처럼 말하는 정말로 재미있는 정신없는 장난꾸러기 였을까 ..? \n\n 확실한거는 어린 시절에서 지금까지 온 24년 동안 너는 너무많이 이뻐지고 성숙해지고 성장했고, 힘든 시절 즐거운 시절 다 겪었다는거. \n\n 너의 인생 24년 오늘은 축복 받아 마땅한 날이라는거",
                                      startColor: UIColor(red: 254/255, green: 173/255, blue: 166/255, alpha: 1),
                                      endColor: UIColor(red: 254/255, green: 100/255.0, blue: 87/255.0, alpha: 1))
                                      
    
    var audioPlayer = AVAudioPlayer()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.isNavigationBarHidden = true
        imageSetup()
        setup()
        setupAudio()
        addGesture()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        isFirst = true
        audioPlayer.setVolume(0, fadeDuration: 3)
    }
    
    private func setup() {
        let mosaicLayout = TRMosaicLayout()
        
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: mosaicLayout)
        self.view.addSubview(collectionView!)
        
        mosaicLayout.delegate = self
        collectionView.register(LetterCollectionViewCell.self, forCellWithReuseIdentifier: LetterCollectionViewCell.identifier)
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
    
        
        // layout
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: -44),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -34),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        collectionView?.backgroundColor = .white

        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        
    }

}



// MARK: View Controller Cell Items,
extension BabyViewController {
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
extension BabyViewController: TRMosaicLayoutDelegate {
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
extension BabyViewController {
    
    func imageSetup() {
        for i in 0...15 {
            imageArray.append(UIImage(named: "BA/" + String(i))!)
        }
        imageArray.shuffle()
    }
    
}


// MARK: Gesture Recognizer
extension BabyViewController {
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




extension BabyViewController {
    func setupAudio() {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "juice", ofType: ".mp3")!))
            audioPlayer.prepareToPlay()
            audioPlayer.play()
            audioPlayer.volume = 1.0
            
        } catch {
            print(error)
        }
    }
}


