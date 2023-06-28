//
//  Enum.swift
//  Xplore
//
//  Created by Leander Van Aarde on 28/06/2023.
//

import Foundation
import UIKit


class imageHelper : ObservableObject {
    func saveImageToTemporaryDirectory(image: UIImage) async -> URL? {
        do {
            let temporaryDirectory = FileManager.default.temporaryDirectory
            let timestamp = Date().timeIntervalSince1970
            let fileName = "image_\(timestamp).jpg"
            let imageURL = temporaryDirectory.appendingPathComponent(fileName)
            let imageData = image.jpegData(compressionQuality: 0.8)
            try imageData?.write(to: imageURL)
            return imageURL
        } catch {
            print("Error saving image to temporary directory: \(error)")
            return nil
        }
    }
}
