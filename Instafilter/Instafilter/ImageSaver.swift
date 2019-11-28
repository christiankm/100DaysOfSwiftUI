//
//  ImageSaver.swift
//  Instafilter
//
//  Created by Christian Mitteldorf on 28/11/2019.
//  Copyright © 2019 mitteldorf. All rights reserved.
//

import Foundation
import UIKit

class ImageSaver: NSObject {

    var onSuccess: (() -> Void)?
    var onError: ((Error) -> Void)?

    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveError), nil)
    }

    @objc func saveError(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            onError?(error)
        } else {
            onSuccess?()
        }
    }
}
