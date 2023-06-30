//
//  UserStateViewModel.swift
//  Xplore
//
//  Created by Vian du Plessis on 2023/06/30.
//

import Foundation
import Firebase



class UserStateViewModel: ObservableObject {
    @Published var isLoggedIn: Bool = false
    @Published var isBusy: Bool = false
    
    func Login(email: String, password: String) {
        isBusy = true
        Auth.auth().signIn(withEmail: email, password: password) { [self] (res, err) in
            if err != nil {
                isLoggedIn = false
                print(err?.localizedDescription ?? "")
            } else {
                isLoggedIn = true
                print("You have successfully logged in")
            }
        }
    }
}
