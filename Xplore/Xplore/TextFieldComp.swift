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
    
    @State var Icon: String = ""
    
    var body: some View {
        VStack(){
            HStack(spacing: 20){
                TextField("Placeholder", text: $textInput)
                    .background(.white)
                
                if failed == "true" {
                    Icon = "xmark.circle.fill"
                } else if failed == "false" {
                    Icon = "checkmark.circle.fill"
                } else if failed == "" {
                    Icon = ""
                }
                
                if !failed.isEmpty {
                    Image(systemName: Icon)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 20)
                        .foregroundColor(Color.red)
                        .opacity(0.5)
                }

                
            }.padding(.bottom, 10).padding(.horizontal, 10)
            Divider()
                .frame(height: 0.5)
             .background(Color("AppGray"))
        }.frame(width: 340, alignment: .topLeading)
    }
}

struct TextFieldComp_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldComp(textInput: .constant(""), failed: .constant("true"))
    }
}
