/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The detail view controller showing a custon mosaic-style UICollectionViewLayout.
*/

import UIKit
import Photos

class ViewController: UICollectionViewController {

    var assets = [PHAsset]()
    

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
        return 50_000
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MosaicCell.identifer, for: indexPath) as? MosaicCell
            else { preconditionFailure("Failed to load collection view cell") }
//
//        if !assets.isEmpty {
//            let assetIndex = indexPath.item % assets.count
//            let asset = assets[assetIndex]
//            let assetIdentifier = asset.localIdentifier
//
//            cell.assetIdentifier = assetIdentifier
//
//            PHImageManager.default().requestImage(for: asset, targetSize: cell.frame.size,
//                                                  contentMode: .aspectFill, options: nil) { (image, hashable)  in
//                                                    if let loadedImage = image, let cellIdentifier = cell.assetIdentifier {
//
//                                                        // Verify that the cell still has the same asset identifier,
//                                                        // so the image in a reused cell is not overwritten.
//                                                        if cellIdentifier == assetIdentifier {
//                                                            cell.imageView.image = loadedImage
//                                                        }
//                                                    }
//            }
//        }
        
        cell.imageView.image = UIImage(named: "launch_img")
        
        return cell
    }


}

