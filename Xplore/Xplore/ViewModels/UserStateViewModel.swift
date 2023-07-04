//  UserStateViewModel.swift
//  Xplore
//
//  Created by Vian du Plessis on 2023/06/30.

import Foundation
import Firebase
import FirebaseFirestoreSwift
import FirebaseFirestore
import SwiftUI

class UserStateViewModel: ObservableObject {
    @Published var isLoggedIn: Bool = false
    @Published var isBusy: Bool = false
    @Published var errorMessage: String = ""
    @Published var isLoginView = true
    @ObservedObject private var viewModel = ImageUploadViewModel(storageManager: StorageManager())
    @Published var userDetails: User?
    
    private var db = Firestore.firestore()
    
    func signOutUser() {
        do {
            try Auth.auth().signOut()
            
            self.isBusy = false
            self.isLoggedIn = false
            self.isLoginView = true
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
        
        db.collection("users").document(userId).setData(data)
    }
    
    func Register(email: String, conPassword: String, password: String, username: String, profileURL: URL?) async {
        if !conPassword.isEmpty && conPassword == password {
            DispatchQueue.main.async {
                self.isBusy = true
            }
            
            do {
                let authDataResult = try await
                Auth.auth().createUser(withEmail: email, password: password)
                let user = authDataResult.user
                
                print("Signed up as user \(user.uid), with email: \(user.email ?? "")")
                
                viewModel.uploadImage(fromURL: profileURL) { (uri, error) in
                    if let error = error {
                        print("Error: \(error)")
                    } else if let uri = uri {
                        // Handle the uploaded image URI here
                        print("Uploaded image URI:", uri)
                        self.createUserDB(username: username, email: email, profileURL: uri.absoluteString, userId: user.uid)
                        
                        DispatchQueue.main.async {
                            self.isBusy = false
                            self.isLoggedIn = true
                        }
                    }
                }
                
            } catch {
                print("There was an issue when trying to sign up: \(error)")
                
                DispatchQueue.main.async {
                    self.isBusy = false
                    self.errorMessage = error.localizedDescription
                }
            }
        } else {
            self.errorMessage = "Passwords don't match"
        }
    }
    
    func Login(email: String, password: String) async {
        
        DispatchQueue.main.async {
            self.isBusy = true
        }
            do {
                let authDataResult = try await  Auth.auth().signIn(withEmail: email, password: password)
                let user = authDataResult.user
                
                print("Signed in as user \(user.uid), with email: \(user.email ?? "")")
                DispatchQueue.main.async {
                    self.isBusy = false
                    self.isLoggedIn = true
                }
            } catch {
                print("There was an issue when trying to sign in: \(error)")
                
                DispatchQueue.main.async {
                    self.isBusy = false
                    self.errorMessage = error.localizedDescription
                }
            }
    }
}
