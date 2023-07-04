//
//  FirestoreManager.swift
//  Xplore
//
//  Created by Leander Van Aarde on 29/06/2023.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift
import FirebaseFirestore

class FirestoreManager: ObservableObject {
    private var db = Firestore.firestore()
    
    func createUserDB(username: String, email: String, profileURL: String) {
        var data: [String: Any] = [:]
        
        data["username"] = username
        data["email"] = email
        data["posts"] = []
        data["profileURL"] = profileURL
        
        db.collection("users").addDocument(data: data) { error in
            if let error = error {
                print("Error adding document: \(error)")
            } else {
                print("Document added successfully")
            }
        }
    }
}
