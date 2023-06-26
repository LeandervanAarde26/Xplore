//
//  LoginView.swift
//  Xplore
//
//  Created by Reinhardt de Beer on 2023/06/26.
//

import SwiftUI

struct LoginView: View {
    
    @State var Error = ""

    var body: some View {
        VStack(){
//            Image(<#T##name: String##String#>)
            Text("Logo placeholder").padding(20)
            Image("map")
            HStack(spacing: 60){
                Image("purple-pin").resizable().scaledToFit().frame(width: 25)
                Text("Login").font(.system(size: 28, weight: .bold)).foregroundColor(Color(red: 0, green: 0.19, blue: 0.53))
            }.padding(.top, 40)
        
            
            Spacer()
            VStackLayout(spacing: 40){
                TextFieldComp(textInput: .constant(""), failed: .constant("true"))
                TextFieldComp(textInput: .constant(""), failed: .constant("false"))
            }
            Spacer()
            Text(Error)
                .foregroundColor(Color.red)
                .padding( 15)
            Button(){}label: {
                Text("Login").bold()
            }
                .foregroundStyle(.white)
                .frame(width: 250, alignment: .center)
                .padding(.horizontal, 35)
                .padding(.vertical, 14)
                .background(Color(red: 0.48, green: 0.53, blue: 0.95))
                .clipShape(Capsule())
            
            Spacer()
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
