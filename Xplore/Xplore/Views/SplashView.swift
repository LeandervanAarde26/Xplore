//
//  SplashView.swift
//  Xplore
//
//  Created by Vian du Plessis on 2023/06/26.
//

import Foundation
import SwiftUI
import SwiftSVG

struct splashView: View {
    
    var body: some View {
        VStack() {
            TopMap()
            
            VStack() {
                Image("Icon")
                    .resizable()
                    .scaledToFit()
                    .padding(50)
            }
            .frame(maxWidth: .infinity)
           
            BottomMap()
        }
        .frame(maxWidth: .infinity)
    }
}
