//
//  FilterService.swift
//  CameraFilter
//
//  Created by minho on 2021/05/18.
//

import UIKit
import CoreImage

class FilterService {
    private var context: CIContext

    init() {
        self.context = CIContext()
    }

    func applyFilter(to inputImage: UIImage, completion: @escaping ((UIImage) -> ())) {
        let filter = CIFilter(name: "CICMYKHalftone")!
        filter.setValue(0.5, forKey: kCIInputWidthKey)

        if let sourceImage = CIImage(image: inputImage) {
            filter.setValue(sourceImage, forKey: kCIInputImageKey)

            if let cgImage: CGImage = self.context.createCGImage(filter.outputImage!, from: filter.outputImage!.extent) {
                let processImage = UIImage(cgImage: cgImage, scale: inputImage.scale, orientation: inputImage.imageOrientation)
                completion(processImage)
            }
        }
    }
}
