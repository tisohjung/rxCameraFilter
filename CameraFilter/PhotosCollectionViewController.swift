//
//  PhotosCollectionViewController.swift
//  CameraFilter
//
//  Created by minho on 2021/05/15.
//

import Photos
import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        populatePhotos()
    }

    private func populatePhotos() {
        PHPhotoLibrary.requestAuthorization({ status in
            if status == .authorized {
                // access photo library
            }
        })
    }
}
