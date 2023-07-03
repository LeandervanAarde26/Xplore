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

class StorageManager: ObservableObject{
    let storage = Storage.storage()
    let timestamp = Date().timeIntervalSince1970

    public func uploadImage(image: UIImage, completion: @escaping (URL?, Error?) -> Void){
        let storageRef = storage.reference().child("images/image_\(timestamp).jpg")
        let imageData = image.jpegData(compressionQuality: 0.8)
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpg"
        if let data = imageData {
                storageRef.putData(data, metadata: metadata) { (metadata, error) in
                    storageRef.downloadURL { (url, error) in
                        if let error = error {
                            print("Error retrieving download URL: ", error)
                            completion(nil, error)
                            return
                        }

                        if let downloadURL = url {
                            print("Download URL: ", downloadURL)
                            completion(downloadURL, nil)
                        }
                    }
                }
        }
    }
}
