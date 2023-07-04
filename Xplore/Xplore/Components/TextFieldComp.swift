//
//  TextFieldComp.swift
//  Xplore
//
//  Created by Reinhardt de Beer on 2023/06/26.
//

import SwiftUI

struct TextFieldComp: View {
    @Binding var textInput: String
    @Binding var failed: String
    @Binding var placeholder: String
    @Binding var errorMessage: String
    @Binding var type: String
    
    var body: some View {
        VStack(){
            HStack(spacing: 20){
                
            switch type {
                case "email":
                    TextField(placeholder, text: $textInput)
                        .background(Color.white)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                case "pass":
                    SecureField(placeholder, text: $textInput)
                        .background(Color.white)
                        .autocapitalization(.none)
                default:
                    TextField(placeholder, text: $textInput)
                        .background(Color.white)
                        .keyboardType(.default)
                        .autocapitalization(.none)
                }
                
                Image(systemName: !errorMessage.isEmpty ?
                      "xmark.circle.fill" : errorMessage.isEmpty ?
                      "" : "checkmark.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 20)
                        .foregroundColor(
                            !errorMessage.isEmpty ?
                            Color.red : errorMessage.isEmpty ?
                            Color.green : Color.gray)
                        .opacity(0.5)
                
            }.padding(.bottom, 5)
                .padding(.horizontal, 10)
            
            Divider()
                .frame(height: 0.5)
             .background(Color("AppGray"))
            
            Text(errorMessage)
                .frame(width: 320, alignment: .leading)
                .font(.footnote)
                .foregroundColor(Color.red)
                .opacity(0.5)
            
        }.frame(width: 340, alignment: .topLeading)
    }
}

struct TextFieldComp_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldComp(textInput: .constant(""),
                      failed: .constant("true"),
                      placeholder: .constant("placeholder"),
                      errorMessage: .constant(""),
                      type: .constant("pass"))
        }
}
