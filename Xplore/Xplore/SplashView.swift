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
//        Outer Container Stack
        VStack() {

            TopMap()
            
            try SVG.make(with: "Test")
            
           
            
            Image("Icon")
                .interpolation(.none)
                .resizable()
                .scaledToFit()
                .padding(100)
                
            
            BottomMap()
        }
        .frame(maxWidth: .infinity)
    }
}
