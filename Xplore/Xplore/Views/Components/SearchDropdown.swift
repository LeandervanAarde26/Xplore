//
//  SearchDropdown.swift
//  Xplore
//
//  Created by Leander van Aarde on 2023/06/27.
//

import SwiftUI

struct SearchDropdown: View {
    struct Person: Identifiable {
            let id: UUID
            let name: String
        }
    let names: [Person] = [
            Person(id: UUID(), name: "John"),
            Person(id: UUID(), name: "Jane"),
            Person(id: UUID(), name: "Alice"),
            Person(id: UUID(), name: "Vian"),
            Person(id: UUID(), name: "Reinhardt"),
            Person(id: UUID(), name: "Leander")
        ]
    
    var body: some View {
        VStack(){
            List(names) { name in
                HStack {
                    Image("SAFLAG")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(
                            minWidth: 0,
                            maxWidth: 40,
                            minHeight: 0,
                            maxHeight: 70
                        )
                        .frame(width: 40, height: 40) // Adjust the width and height of the image as needed
                    Spacer()
                    Text(name.name)
                    Spacer()
                }
            }
            .listStyle(PlainListStyle()) // Optional:
            .background(Color.clear)
        }
        .background(Color.clear)
        .frame(
        minWidth: 0,
        maxWidth: .infinity,
        minHeight: 20,
        maxHeight: 500)
    }
}

struct SearchDropdown_Previews: PreviewProvider {
    static var previews: some View {
        SearchDropdown()
    }
}
