//
//  BostonViewController.swift
//  0930
//
//  Created by Dongha Kang on 2020/09/28.
//

import UIKit
import AVFoundation


class BostonViewController: UICollectionViewController {

    // DATA
    var imageArray = [UIImage]()
    let data: LetterData = LetterData(title: "보스턴",
                                      letter: "인간은 거짓말에 익숙한 동물들이고, 우리는 그 동물적인 감각으로 생존하고 삶을 나아가지.\n\n근데 거짓말 같은 일은 그렇게 나쁘게 해석되지 않아. 분명히 거짓말은 안좋은거라고 배우고, 하면 안되는거 같은데. 거짓말 같다 라는 말은 참 긍정적으로 쓰이지..\n\n개소리였고 이 거짓말 같은 삶, 비현실적인 여행, 바로 보스턴. \n\n너와의 보스턴 여행은 믿기지가 않았어, 지금도 안 믿겨. 굉장히 거짓말 같고 지금 생각해도 너무나도 비현실적으로 아름다웠어.\n\n여행을 싫어하는 나에게 여행이란 것이 얼마나 값비싼 경험인지를 알게 해줬고, 이 계기로 너와 더 가까워 진 것은 물론, 서로를 더 더욱더 의지 할 수 있는 계기가 된거 같아.\n\n나는 아직도 보스턴 여행 사진들을 보면 가슴이 떨리고 기분이 좋아지는데, 너도겠지?\n\n오늘 생일도, 그리고 앞으로의 인생도, 이 정도로 떨릴 수는 없겠지만, 너가 앞으로도 흥미 진진한 여행 같은 삶을 살았으면 좋겠다.",
                                      startColor: UIColor(red: 19.0/255.0, green: 84.0/255.0, blue: 122.0/255.0, alpha: 1),
                                      endColor: UIColor(red: 128.0/255.0, green: 208.0/255.0, blue: 199.0/255.0, alpha: 1))
    
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
        isSecond = true
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
extension BostonViewController {
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
extension BostonViewController: TRMosaicLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, mosaicCellSizeTypeAtIndexPath indexPath: IndexPath) -> TRMosaicCellType {

        if indexPath.item < 6 {
            return indexPath.item % 3 == 0 ? TRMosaicCellType.big : TRMosaicCellType.small
        } else {
            if indexPath.item == 6 {
                return TRMosaicCellType.one
            } else if indexPath.item == imageArray.count - 2 {
                return TRMosaicCellType.one
            } else if indexPath.item == imageArray.count - 1 {
                return TRMosaicCellType.full
            } else {
                return indexPath.item % 3 == 1 ? TRMosaicCellType.big : TRMosaicCellType.small
            }
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
extension BostonViewController {
    
    func imageSetup() {
        print(imageArray.count)
        for i in 0...20 {
            imageArray.append(UIImage(named: "B/" + String(i))!)
        }
        imageArray.shuffle()
    }
    
}


// MARK: Gesture Recognizer
extension BostonViewController {
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




extension BostonViewController {
    func setupAudio() {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "apunk", ofType: ".mp3")!))
            audioPlayer.prepareToPlay()
            audioPlayer.play()
            audioPlayer.volume = 1.0
            
        } catch {
            print(error)
        }
    }
}


