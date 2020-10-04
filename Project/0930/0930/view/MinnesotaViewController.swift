//
//  MinnesotaViewController.swift
//  0930
//
//  Created by Dongha Kang on 2020/09/28.
//

import UIKit
import AVFoundation

class MinnesotaViewController: UICollectionViewController {

    // DATA
    var imageArray = [UIImage]()
    let data: LetterData = LetterData(title: "미네소타",
                                      letter: "우리의 시작, 우리가 감정을 서로 공유한곳, 미네소타.\n우리의 첫 여행지 이자, 우리의 첫 만남 장소\n\n처음 서먹서먹 서로의 이름을 공유하던 그 순간, 같이 무대를 준비했던 그 순간, 예중이 친구라며, 스텁 근처라며, 센사 회장이라며 잠깐 스쳤던 그 순간\n\n내가 힘들었을때 우연히 다가왔던 그 순간, 카페를 갔던 그 순간... \n\n공부가 안되서 강아지를 보러간 그 순간, 같이 아르바이트를 했던 그 순간, 같이 취업 준비를 했던 그 순간, 코로나/폭동 여파를 서로 의지해가면서 확찐자가 된 그 순간, 확찐자뿐 만 아니라, 같이 없으면 허전하고 위험한 것 같고 서로 으쌰으쌰 응원했던 그 순간, 아무리 코로나가 심하더라도 같이 산책했던 그 순간\n\n미네소타는 지옥같았지만, 마지막 학기는 너와 함께여서 재밌었어. \n\n다시 돌이켜 생각해보면 정말 아름다운 지옥이었어.\n\n고마워",
                                      startColor: UIColor(red: 26.0/255.0, green: 35.0/255.0, blue: 126.0/255.0, alpha: 1),
                                      endColor: UIColor(red: 106.0/255.0, green: 27.0/255.0, blue: 154.0/255.0, alpha: 1))
    
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
        isThird = true
        audioPlayer.setVolume(0, fadeDuration: 3)
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
        } else if (indexPath.item == 0) {
            return TRMosaicCellType.one
        } else {
            return indexPath.item % 3 == 1 ? TRMosaicCellType.big : TRMosaicCellType.small
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
        
        for i in 0...40 {
            imageArray.append(UIImage(named: "M/" + String(i))!)
        }
        imageArray.shuffle()
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




extension MinnesotaViewController {
    func setupAudio() {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "minnesota", ofType: ".mp3")!))
            audioPlayer.prepareToPlay()
            audioPlayer.play()
            audioPlayer.volume = 1.0
            
        } catch {
            print(error)
        }
    }
}


