//
//  RegisterView.swift
//  Xplore
//
//  Created by Reinhardt de Beer on 2023/06/28.
//

import SwiftUI



struct RegisterView: View {
    
    @StateObject private var RegModel = InputRegData()
    @StateObject private var ErrModel = InputErrors()

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
                    TextFieldComp(textInput: $RegModel.Username,
                                  failed: $ErrModel.ErrIcon,
                                  placeholder: .constant("username"),
                                  errorMessage: $ErrModel.usernameError)
                    TextFieldComp(textInput: $RegModel.Email,
                                  failed: $ErrModel.ErrIcon,
                                  placeholder: .constant("email"),
                                  errorMessage: $ErrModel.emailError)
                    TextFieldComp(textInput: $RegModel.Password,
                                  failed: $ErrModel.ErrIcon,
                                  placeholder: .constant("password"),
                                  errorMessage: $ErrModel.passwordError)
                    TextFieldComp(textInput: $RegModel.ConPassword,
                                  failed: $ErrModel.ErrIcon,
                                  placeholder: .constant("confirm password"),
                                  errorMessage: $ErrModel.passwordConError)
                }
                
                Text(ErrModel.PageError)
                    .foregroundColor(Color.red)
                    .padding( 15)
                
                Button(){}label: {
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
