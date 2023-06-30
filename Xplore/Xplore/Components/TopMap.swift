//
//  TopMap.swift
//  Xplore
//
//  Created by Vian du Plessis on 2023/06/26.
//

import SwiftUI

struct TopMap: View {
    @State var bouncePin = false
    
    var body: some View {
        VStack() {
            ZStack() {
                Image("map")
                
                Image("purple-pin")
                    .offset(x: 90, y: bouncePin ? -70 : -60)
                    .animation(Animation.easeInOut(duration: 1.0).repeatForever())
        
                Image("yellow-pin")
                    .offset(x: -60, y: bouncePin ? 10 : 20)
                    .animation(Animation.easeInOut(duration: 1.0).repeatForever())
            
                Image("light-blue-pin")
                    .offset(x: 0, y: bouncePin ? -30 : -40)
                    .animation(Animation.easeInOut(duration: 1.0).repeatForever())
                
                Image("dark-blue-pin")
                    .offset(x: 140, y: bouncePin ? 30 : 20)
                    .animation(Animation.easeInOut(duration: 1.0).repeatForever())
            }
        }
        .onAppear {
            bouncePin = true
        }
        .padding(.top)
    }
}

struct TopMap_Previews: PreviewProvider {
    static var previews: some View {
        TopMap()
    }
}
