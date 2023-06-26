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
                Image("shadow")
                    .offset(x: 115, y: -20)
                    
        
                Image("yellow-pin")
                    .offset(x: -60, y: bouncePin ? 10 : 20)
                    .animation(Animation.easeInOut(duration: 1.0).repeatForever())
                Image("shadow")
                    .offset(x: -35, y: 50)
            
                Image("light-blue-pin")
                    .offset(x: 0, y: bouncePin ? -30 : -40)
                    .animation(Animation.easeInOut(duration: 1.0).repeatForever())
                Image("shadow")
                    .offset(x: 25, y: 10)
                
                Image("dark-blue-pin")
                    .offset(x: 140, y: bouncePin ? 30 : 20)
                    .animation(Animation.easeInOut(duration: 1.0).repeatForever())
                Image("shadow")
                    .offset(x: 165, y: 60)
            
            }
            Spacer()
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
