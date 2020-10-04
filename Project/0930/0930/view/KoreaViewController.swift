//
//  KoreaViewController.swift
//  0930
//
//  Created by Dongha Kang on 2020/09/28.
//

import UIKit
import AVFoundation

class KoreaViewController: UICollectionViewController {

    // DATA
    var imageArray = [UIImage]()
    let data: LetterData = LetterData(title: "한국",
                                      letter: "새로운 시작, 적응 기간, 낯선 환경, 하지만 아름다운 이 바쁨\n\n서로 각자의 위치에서 열심히 살고 서로를 응원해줄 수 있는 장소.\n\n우리 정말 걱정 많이했었어, 새로운 환경에 적응해야하는 너와, 비록 새로운 것은 아닐지라도 10년만에 복귀하는 나와. \n\n힘들고 거칠거라는 거 알고도 서로 얼굴만 보면 바보같은 행동하고, 즐거워하고. 내가 원했던 삶이 이런거는 아닐까 싶어.\n\n헬조선에서 적응하는거 힘들었을텐데 끝까지 노력하고 힘이 되줘서 너무 고맙고 기특하고. 취업 뽀셔버린거 솔직히 개멋있고.\n\n어쩌면 대한민국은 우리의 미래가 그려질 시끄럽고, 바쁜, 그런 복잡하지만 매력있는 도화지가 아닐까?",
                                      startColor: UIColor(red: 204.0/255.0, green: 43.0/255.0, blue: 94.0/255.0, alpha: 1),
                                      endColor: UIColor(red: 117.0/255.0, green: 58.0/255.0, blue: 136.0/255.0, alpha: 1))
    
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
        isFourth = true
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
extension KoreaViewController {
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
extension KoreaViewController: TRMosaicLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, mosaicCellSizeTypeAtIndexPath indexPath: IndexPath) -> TRMosaicCellType {

        if indexPath.item == imageArray.count - 1 {
            return TRMosaicCellType.full
        } else if (indexPath.item == 3 || indexPath.item == 4 || indexPath.item == 5) {
            return TRMosaicCellType.one
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
extension KoreaViewController {
    
    func imageSetup() {
        print(imageArray.count)
        for i in 0...12 {
            imageArray.append(UIImage(named: "K/" + String(i))!)
        }
        imageArray.shuffle()
    }
    
}


// MARK: Gesture Recognizer
extension KoreaViewController {
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





extension KoreaViewController {
    func setupAudio() {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "tomboy", ofType: ".mp3")!))
            audioPlayer.prepareToPlay()
            audioPlayer.play()
            audioPlayer.volume = 1.0
            
        } catch {
            print(error)
        }
    }
}


