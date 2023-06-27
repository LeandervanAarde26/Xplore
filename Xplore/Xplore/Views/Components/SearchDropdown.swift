//
//  SearchDropdown.swift
//  Xplore
//
//  Created by Leander van Aarde on 2023/06/27.
//

import SwiftUI

struct SearchDropdown: View {
    var names = ["One", "Two", "Three", "Four"]
    var body: some View {
        VStack(){
            Text("Hello")
        }
        .background(Color.red)
        .frame(
            minWidth: .infinity,
        maxWidth: .infinity,
        minHeight: 20,
        maxHeight: 200)
    }
}

struct SearchDropdown_Previews: PreviewProvider {
    static var previews: some View {
        SearchDropdown()
    }
}
