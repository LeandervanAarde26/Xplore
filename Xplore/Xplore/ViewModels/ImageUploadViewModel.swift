//
//  ImageUploadViewModel.swift
//  Xplore
//
//  Created by Leander Van Aarde on 29/06/2023.
//

import Foundation
import UIKit

class ImageUploadViewModel: ObservableObject {
    private let storageManager: StorageManager
    @Published var imgUri: URL?
    
    init(storageManager: StorageManager) {
        self.storageManager = storageManager
    }
    
    func uploadImage(fromURL imageURL: URL?, completion: @escaping (URL?, Error?) -> Void) {
        guard let imageURL = imageURL else {
            print("No image")
            completion(nil, nil)
            return
        }
        
        guard let image = UIImage(contentsOfFile: imageURL.path) else {
            print("Invalid image.")
            completion(nil, nil)
            return
        }
        
        storageManager.uploadImage(image: image) { [weak self] (uri, error) in
            if let error = error {
                print("Error uploading image:", error)
                completion(nil, error)
            }
            
            if let uri = uri {
                DispatchQueue.main.async {
                    self?.imgUri = uri
                    completion(uri, nil)
                }
            }
        }
    }
}
