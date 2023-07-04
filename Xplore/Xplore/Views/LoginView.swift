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
    @EnvironmentObject var userVM: UserStateViewModel
    
    func Login() async {
        
        errModel.emailError = ""
        errModel.passwordError = ""
        
        if logModel.Email.isEmpty {
            errModel.emailError = "Please enter your email"
        }
        
        if logModel.Password.isEmpty {
            errModel.passwordError = "Please enter your password"
        }
        
        if logModel.Password.isEmpty || logModel.Email.isEmpty {
            return
        }
        
        await userVM.Login(email: logModel.Email, password: logModel.Password)
        
        if userVM.errorMessage == "The email address is badly formatted." {
            logModel.Email = "Invalid email address"
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
        if userVM.isBusy {
            ProgressView()
        } else {
            
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
                                      errorMessage: $errModel.emailError,
                                      type: .constant("email"))
                        TextFieldComp(textInput: $logModel.Password,
                                      failed: $errModel.errIcon,
                                      placeholder: .constant("password"),
                                      errorMessage: $errModel.passwordError,
                                      type: .constant("pass"))
                    }
                    
                    Spacer()
                    
                    Text(userVM.errorMessage)
                        .foregroundColor(Color.red)
                        .padding(10)
                    
                    Button(){
                        Task {
                            await Login()
                        }
                    } label: {
                        Text("Login")
                            .bold()
                            .foregroundStyle(.white)
                            .frame(width: 250, alignment: .center)
                            .padding(.horizontal, 35)
                            .padding(.vertical, 14)
                            .background(Color(red: 0.48, green: 0.53, blue: 0.95))
                            .cornerRadius(10)
                            .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 4)
                            .padding()
                    }

                    
                    Button() {
                        userVM.isLoginView = false
                    } label: {
                        Text("Don't have an account?")
                            .foregroundColor(.blue)
                    }
                    
//                    NavigationLink() {
//                        RegisterView()
//                    } label: {
//                       
//                    }
                }
                
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
