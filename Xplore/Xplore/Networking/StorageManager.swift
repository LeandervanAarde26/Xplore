//
//  StorageManager.swift
//  Xplore
//
//  Created by Leander Van Aarde on 29/06/2023.
//

import Foundation
import Firebase
import FirebaseStorage
import UIKit

class storageManager: ObservableObject{
    let storage = Storage.storage()
    let timestamp = Date().timeIntervalSince1970
    
    public func uploadImage(image: UIImage){
        let storageRef = storage.reference().child("images/image_\(timestamp).jpg")
        let imageData = image.jpegData(compressionQuality: 0.8)
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpg"
        if let data = imageData {
                storageRef.putData(data, metadata: metadata) { (metadata, error) in
                        if let error = error {
                                print("Error while uploading file: ", error)
                        }

                        if let metadata = metadata {
                                print("Metadata: ", metadata)
                        }
                }
        }
    }
}
