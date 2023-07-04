//
//  InputErrors.swift
//  Xplore
//
//  Created by Reinhardt de Beer on 2023/06/28.
//

import Foundation

class InputErrors: ObservableObject {
    @Published var emailError: String = ""
    @Published var passwordError: String = ""
    @Published var errIcon: String = ""
    @Published var passwordConError: String = ""
    @Published var usernameError: String = ""
    @Published var pageError: String = ""
}

class InputRegData: ObservableObject {
    @Published var Profile: String = ""
    @Published var Username: String = ""
    @Published var Email: String = ""
    @Published var Password: String = ""
    @Published var ConPassword: String = ""
}

class InputLogData: ObservableObject {
    @Published var Password: String = ""
    @Published var Email: String = ""
}
