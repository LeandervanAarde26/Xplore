//
//  BottomMap.swift
//  Xplore
//
//  Created by Vian du Plessis on 2023/06/26.
//

import SwiftUI

struct BottomMap: View {
    @State var bouncePin = false
    @State private var scale: CGFloat = 1.0
    
    var body: some View {
        VStack() {
            Spacer()
            ZStack() {
                Image("map")
                    .rotationEffect(.degrees(180))
                
                Image("purple-pin")
                    .offset(x: 90, y: -70)
                    .scaleEffect(scale)
                    .animation(Animation.easeInOut(duration: 1.0).repeatForever(), value: scale)
        
                Image("yellow-pin")
                    .offset(x: -60, y: 20)
                    .scaleEffect(scale)
                    .animation(Animation.easeInOut(duration: 1.0).repeatForever(), value: scale)
            
                Image("light-blue-pin")
                    .offset(x: 0, y: -40)
                    .scaleEffect(scale)
                    .animation(Animation.easeInOut(duration: 1.0).repeatForever(), value: scale)
                
                Image("dark-blue-pin")
                    .offset(x: 140, y: 20)
                    .scaleEffect(scale)
                    .animation(Animation.easeInOut(duration: 1.0).repeatForever(), value: scale)
            }
        }
        .padding(.bottom)
        .onAppear {
            scale = 1.1
        }
    }
}

struct BottomMap_Previews: PreviewProvider {
    static var previews: some View {
        BottomMap()
    }
}
