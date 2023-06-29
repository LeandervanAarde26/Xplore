//
//  FirestoreManager.swift
//  Xplore
//
//  Created by Leander Van Aarde on 29/06/2023.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

class PostViewModel: ObservableObject {
    private var db = Firestore.firestore()
    func addUserPost(userId: String, postImage: String, postDescription: String, postCountry: String){
        let post = addPost(userId: userId, postImage: postImage, postDescription: postDescription, postCountry: postCountry)
        
        let docRef = db.collection("Posts").document("document")
        
        docRef.setData(["name" : "Document"]){ error in
            if let error = error {
                print ("Error while posting document \(error)")
            } else{
                print("Document has been added")
            }
        }
    }
}
