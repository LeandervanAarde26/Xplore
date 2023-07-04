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
    @State private var selectedImageURL: URL? = nil
    
    @EnvironmentObject var userVM: UserStateViewModel
    
    func Register() async {
        errModel.emailError = ""
        errModel.passwordError = ""
        
        if regModel.Email.isEmpty {
            errModel.emailError = "Please enter your email"
        }
        
        if regModel.Password.isEmpty {
            errModel.passwordError = "Please enter your password"
        }
        
        if regModel.Password.isEmpty || regModel.Password.isEmpty {
            return
        }
        
        await userVM.Register(email: regModel.Email,
                              password: regModel.Password,
                              username: regModel.Username,
                              profileURL: selectedImageURL ?? URL(string: "https://example.com/default_image.png")!)

        }

    var body: some View {
        if userVM.isBusy {
            ProgressView()
        } else {
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
                        PhotoPicker(imageUrl: $selectedImageURL)
                        TextFieldComp(textInput: $regModel.Username,
                                      failed: $errModel.errIcon,
                                      placeholder: .constant("username"),
                                      errorMessage: $errModel.usernameError,
                                      type: .constant(""))
                        TextFieldComp(textInput: $regModel.Email,
                                      failed: $errModel.errIcon,
                                      placeholder: .constant("email"),
                                      errorMessage: $errModel.emailError,
                                      type: .constant("email"))
                        TextFieldComp(textInput: $regModel.Password,
                                      failed: $errModel.errIcon,
                                      placeholder: .constant("password"),
                                      errorMessage: $errModel.passwordError,
                                      type: .constant("pass"))
                        TextFieldComp(textInput: $regModel.ConPassword,
                                      failed: $errModel.errIcon,
                                      placeholder: .constant("confirm password"),
                                      errorMessage: $errModel.passwordConError,
                                      type: .constant("pass"))
                    }
                    
                    Text(errModel.pageError)
                        .foregroundColor(Color.red)
                        .padding( 15)
                    
                    Button(){
                        Task {
                            await Register()
                        }
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
                    
                    Button() {
                        userVM.isLoginView = true
                    } label: {
                        Text("Already have an account?")
                            .foregroundColor(.blue)
                    }
                    
                    Spacer()
                    
                }
            }
            .onAppear() {
                userVM.isLoginView = false
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
