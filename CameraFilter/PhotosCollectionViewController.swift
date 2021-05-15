//
//  PhotosCollectionViewController.swift
//  CameraFilter
//
//  Created by minho on 2021/05/15.
//

import Photos
import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    private var images: [PHAsset] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        populatePhotos()
    }

    private func populatePhotos() {
        PHPhotoLibrary.requestAuthorization({ [weak self] status in
            if status == .authorized {
                // access photo library
                let assets = PHAsset.fetchAssets(with: PHAssetMediaType.image, options: nil)
                assets.enumerateObjects { object, _, _ in
                    self?.images.append(object)
                }
                self?.images.reverse()
                print(self?.images)
//                self?.collectionView.reloadData()
            }
        })
    }
}
