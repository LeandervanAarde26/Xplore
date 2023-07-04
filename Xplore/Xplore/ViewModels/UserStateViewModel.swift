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
    
    private var db = Firestore.firestore()
    
    func signOutUser() async {
        do {
            let signOutResult = try await Auth.auth().signOut()
            
            DispatchQueue.main.async {
                print("Logged out")
                self.isBusy = false
                self.isLoggedIn = false
                self.isLoginView = true
            }
            print("You signed out")
        } catch {
            print("Error signing out: %@", error.localizedDescription)
        }
    }
    
    func getUserDetails(userId: String) {
        print("This is the user id")
        print(userId)
        let docRef = db.collection("users").document(userId)

        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                print("Document data: \(dataDescription)")
            } else {
                print("Document does not exist")
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
        
//        db.collection("users").addDocument(data: data) { error in
//            if let error = error {
//                print("Error adding document: \(error)")
//            } else {
//                print("Document added successfully")
//            }
//        }
    }
    
    func Register(email: String, password: String, username: String, profileURL: String) async {
        DispatchQueue.main.async {
            self.isBusy = true
        }
        
        do {
            let authDataResult = try await
            Auth.auth().createUser(withEmail: email, password: password)
            let user = authDataResult.user
            
            print("Signed up as user \(user.uid), with email: \(user.email ?? "")")
            
            createUserDB(username: username, email: email, profileURL: profileURL, userId: user.uid)
            
            DispatchQueue.main.async {
                self.isBusy = false
                self.isLoggedIn = true
            }
        } catch {
            print("There was an issue when trying to sign up: \(error)")
            
            DispatchQueue.main.async {
                self.isBusy = false
                self.errorMessage = error.localizedDescription
            }
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
