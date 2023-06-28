//
//  LoginView.swift
//  Xplore
//
//  Created by Reinhardt de Beer on 2023/06/26.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject private var LogModel = InputLogData()
    @StateObject private var ErrModel = InputErrors()
    
    func Login() {
        //example code
        if !LogModel.Email.isEmpty {
            //Prints value from input
            print(LogModel.Email)
            
        } else {
            //sets page error
            ErrModel.PageError = "Email is empty"
            
        }
        
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
                    TextFieldComp(textInput: $LogModel.Email,
                                  failed: .constant("true"),
                                  placeholder: .constant("email"),
                                  errorMessage: $ErrModel.emailError)
                    TextFieldComp(textInput: $LogModel.Password,
                                  failed: .constant("false"),
                                  placeholder: .constant("password"),
                                  errorMessage: $ErrModel.passwordError)
                }
                
                Spacer()
                
                Text(ErrModel.PageError)
                    .foregroundColor(Color.red)
                    .padding(10)
                
                Button(){Login()} label: {
                    Text("Login").bold()
                } .foregroundStyle(.white)
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
                        Text("Don't have an account?").foregroundColor(.blue)
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
