//
//  LoginView.swift
//  Xplore
//
//  Created by Reinhardt de Beer on 2023/06/26.
//

import SwiftUI
import Firebase

struct LoginView: View {
    
    @StateObject private var logModel = InputLogData()
    @StateObject private var errModel = InputErrors()
    
    func Login() {
        
        Auth.auth().signIn(withEmail: logModel.Email, password: logModel.Password) { (res, err ) in
            if err != nil {
                print(err?.localizedDescription ?? "")
            } else {
                print("You have successfully logged in")
            }
        }
//        //Model usage example code
//        if !logModel.Email.isEmpty {
//            //Value from email input
//            print(logModel.Email)
//            
//        } else {
//            //sets page error
//            //Check InputModels model for other available errors
//            errModel.pageError = "Password or email is incorrect"
//            errModel.emailError = "Email is empty"
//            
//        }
    }

    var body: some View {
        NavigationView(){
            VStack(){
                Image("Icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 140, alignment: .center)
                    .padding(15)
            
                TopMap()
                    .frame(height:220)
                
                HStack(spacing: 60){
                    Image("purple-pin")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25)
                    Text("Login")
                        .font(.system(.title, weight: .bold))
                        .foregroundColor(Color(red: 0, green: 0.19, blue: 0.53))
                }
//                .padding(.top, 40)
                
                Spacer()
                
                VStackLayout(spacing: 40){
                    TextFieldComp(textInput: $logModel.Email,
                                  failed: $errModel.errIcon,
                                  placeholder: .constant("email"),
                                  errorMessage: $errModel.emailError)
                    TextFieldComp(textInput: $logModel.Password,
                                  failed: $errModel.errIcon,
                                  placeholder: .constant("password"),
                                  errorMessage: $errModel.passwordError)
                }
                
                Spacer()
                
                Text(errModel.pageError)
                    .foregroundColor(Color.red)
                    .padding(10)
                
                Button(){
                    Login()
                } label: {
                    Text("Login").bold()
                }
                .foregroundStyle(.white)
                .frame(width: 250, alignment: .center)
                .padding(.horizontal, 35)
                .padding(.vertical, 14)
                .background(Color(red: 0.48, green: 0.53, blue: 0.95))
                .cornerRadius(10)
                .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 4)
                .padding()
                
                NavigationLink() {
                    RegisterView()
                } label: {
                    Text("Don't have an account?")
                        .foregroundColor(.blue)
                }
            }
        
            Spacer()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
