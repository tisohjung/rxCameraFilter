//
//  ViewController.swift
//  CameraFilter
//
//  Created by minho on 2021/05/15.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    @IBOutlet weak var applyFilterButton: UIButton!
    @IBOutlet weak var photoImageView: UIImageView!
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("Prepare")
        guard let navVC = segue.destination as? UINavigationController,
              let photosVC = navVC.viewControllers.first as? PhotosCollectionViewController else {
            fatalError("Segue destination not found")
        }

        photosVC.selectedPhoto.subscribe(onNext: { [weak self] photo in
            DispatchQueue.main.async {
                self?.updateUI(with: photo)
            }
        }).disposed(by: disposeBag)
    }

    private func updateUI(with image: UIImage) {
        self.photoImageView.image = image
        self.applyFilterButton.isHidden = false
    }
}

