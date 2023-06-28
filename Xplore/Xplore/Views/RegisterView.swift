//
//  RegisterView.swift
//  Xplore
//
//  Created by Reinhardt de Beer on 2023/06/28.
//

import SwiftUI



struct RegisterView: View {
    
    @StateObject private var regModel = InputRegData()
    @StateObject private var errModel = InputErrors()
    
    func Register() {
        //Model usage example code
        if !regModel.Email.isEmpty {
            //Value from email input
            print(regModel.Email)
            
        } else {
            //sets page error
            //Check InputModels model for other available errors
            errModel.pageError = "Fields can't be empty"
            errModel.emailError = "Email is empty"
            
        }
    }

    var body: some View {
        ScrollView(){
            VStack(spacing: 20){
                Image("Icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 140, alignment: .center)
                    .padding(15)
                
                HStack(spacing: 60){
                    Image("purple-pin")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25)
                    Text("Start your journey")
                        .font(.system(.title, weight: .bold))
                        .foregroundColor(Color(red: 0, green: 0.19, blue: 0.53))
                }.padding(10)
                
                Divider()
                
                Spacer()
                
                VStack(spacing: 20){
                    PhotoPicker().frame(height: 320)
                    TextFieldComp(textInput: $regModel.Username,
                                  failed: $errModel.errIcon,
                                  placeholder: .constant("username"),
                                  errorMessage: $errModel.usernameError)
                    TextFieldComp(textInput: $regModel.Email,
                                  failed: $errModel.errIcon,
                                  placeholder: .constant("email"),
                                  errorMessage: $errModel.emailError)
                    TextFieldComp(textInput: $regModel.Password,
                                  failed: $errModel.errIcon,
                                  placeholder: .constant("password"),
                                  errorMessage: $errModel.passwordError)
                    TextFieldComp(textInput: $regModel.ConPassword,
                                  failed: $errModel.errIcon,
                                  placeholder: .constant("confirm password"),
                                  errorMessage: $errModel.passwordConError)
                }
                
                Text(errModel.pageError)
                    .foregroundColor(Color.red)
                    .padding( 15)
                
                Button(){
                    Register()
                }label: {
                    Text("Register").bold()
                }
                    .foregroundStyle(.white)
                    .frame(width: 250, alignment: .center)
                    .padding(.horizontal, 35)
                    .padding(.vertical, 14)
                    .background(Color(red: 0.48, green: 0.53, blue: 0.95))
                    .cornerRadius(10)
                    .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 4)
                
                Spacer()
                
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
