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
    
    var body: some View {
        VStack(){
            HStack(spacing: 20){
                TextField(placeholder, text: $textInput)
                    .background(.white)
                
                Image(systemName: failed == "false" ? "xmark.circle.fill" : failed == "true" ? "checkmark.circle.fill" : "")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 20)
                        .foregroundColor( failed == "false" ? Color.red : failed == "true" ? Color.green : Color.gray)
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
        TextFieldComp(textInput: .constant(""), failed: .constant("true"), placeholder: .constant("placeholder"), errorMessage: .constant("error message"))
    }
}
