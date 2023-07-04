//  UserStateViewModel.swift
//  Xplore
//
//  Created by Vian du Plessis on 2023/06/30.

import Foundation
import Firebase
import FirebaseFirestoreSwift
import FirebaseFirestore

class UserStateViewModel: ObservableObject {
    @Published var isLoggedIn: Bool = false
    @Published var isBusy: Bool = false
    @Published var errorMessage: String = ""
    @Published var isLoginView = true
    @Published var userDetails: User?
    
    private var db = Firestore.firestore()
    
    func signOutUser() {
        do {
            try Auth.auth().signOut()
            
            isBusy = false
            isLoggedIn = false
            isLoginView = true
        } catch {
            print("Error signing out: %@", error.localizedDescription)
        }
    }

    func getUserDetails() {
        let userId = getUserId()

        db.collection("users").document(userId).getDocument { [weak self] document, error in
            guard let self = self else { return }
            
            if let document = document, document.exists {
                if let userData = try? document.data(as: User.self) {
                    self.userDetails = userData
                } else {
                    print(error?.localizedDescription ?? "Problem with decoding document")
                }
            }
        }
    }

    func getUserId() -> String {
        return Auth.auth().currentUser?.uid ?? "No user id found"
    }
    
    func checkAuth() {
        if Auth.auth().currentUser?.uid != nil {
            isLoggedIn = true
        } else {
            isLoggedIn = false
        }
    }
    
    func createUserDB(username: String, email: String, profileURL: String, userId: String) {
        var data: [String: Any] = [:]
        
        data["username"] = username
        data["email"] = email
        data["posts"] = []
        data["profileURL"] = profileURL
        
        db.collection("users").document(userId).setData(data) { error in
            if let error = error {
                print("Error creating user document: \(error)")
            } else {
                print("Document was added successfully")
            }
        }
    }
    
    func Register(email: String, password: String, username: String, profileURL: String) async {
        self.isBusy = true
        
        do {
            let authDataResult = try await
            Auth.auth().createUser(withEmail: email, password: password)
            let user = authDataResult.user
            
            createUserDB(username: username, email: email, profileURL: profileURL, userId: user.uid)
            
            self.isBusy = false
            self.isLoggedIn = true
        } catch {
            print("There was an issue when trying to sign up: \(error)")
            
            self.isBusy = false
            self.errorMessage = error.localizedDescription
        }
    }
    
    func Login(email: String, password: String) async {
        DispatchQueue.main.async {
            self.isBusy = true
        }
        
        do {
            try await  Auth.auth().signIn(withEmail: email, password: password)
            
            DispatchQueue.main.async {
                self.isBusy = false
                self.isLoggedIn = true
            }
          
        } catch {
            print("There was an issue when trying to sign in: \(error)")
            
            self.isBusy = false
            self.errorMessage = error.localizedDescription
        }
    }
}
