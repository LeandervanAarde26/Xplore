//
//  BottomMap.swift
//  Xplore
//
//  Created by Vian du Plessis on 2023/06/26.
//

import SwiftUI

struct BottomMap: View {
    @State var bouncePin = false
    var body: some View {
        VStack() {
            Spacer()
            ZStack() {
                Image("map")
                    .rotationEffect(.degrees(180))
                
                Image("purple-pin")
                    .offset(x: 80, y: bouncePin ? -70 : -60)
                    .animation(Animation.easeInOut(duration: 1.0).repeatForever())
                    
                Image("yellow-pin")
                    .offset(x: -60, y: bouncePin ? 10 : 20)
                    .animation(Animation.easeInOut(duration: 1.0).repeatForever())
            
                Image("light-blue-pin")
                    .offset(x: 0, y: bouncePin ? -30 : -40)
                    .animation(Animation.easeInOut(duration: 1.0).repeatForever())
                
                Image("dark-blue-pin")
                    .offset(x: 115, y: bouncePin ? 10 : 0)
                    .animation(Animation.easeInOut(duration: 1.0).repeatForever())
            }

        }
        .onAppear {
            bouncePin = true
        }
        .padding(.bottom)
    }
}

struct BottomMap_Previews: PreviewProvider {
    static var previews: some View {
        BottomMap()
    }
}
