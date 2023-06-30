//
//  ImageUploadViewModel.swift
//  Xplore
//
//  Created by Leander Van Aarde on 29/06/2023.
//

import Foundation
import UIKit

class ImageUploadViewModel: ObservableObject{
    private let storageManager: storageManager
    @Published var imgUri: URL?
    
    init(storageManager: storageManager){
        self.storageManager = storageManager
    }
    func uploadImage(fromURL imageURL: URL?){
        guard let imageURL = imageURL else{
            print("No image")
            return
        }
        
        guard let image = UIImage(contentsOfFile: imageURL.path) else {
            print("Invalid image.")
            return
        }
        
        storageManager.uploadImage(image: image) {(uri, error) in
            if let error = error {
                print("Error uploading image:", error)
            }
            if let uri = uri {
                DispatchQueue.main.async {
                    self.imgUri = uri
                    print("Uploaded image URI:", uri)
                }
            }
        }
    }
}
