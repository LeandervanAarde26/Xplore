//
//  SearchInput.swift
//  Xplore
//
//  Created by Leander van Aarde on 2023/06/26.
//

import SwiftUI

struct SearchInput: View {
    
    @State var searchText = ""
    @Binding var text : String
    @Binding var isSearching: Bool
    
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color(.systemGray2))
            TextField(
                "Search Country",
                text: $text
            )
            .onTapGesture {
                        isSearching = true
                    }
                    .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)) { _ in
                        isSearching = false
                    }
            .frame(height: 48)
            .padding(.horizontal, 15)
            
            Image(systemName: "mic.fill")
                .foregroundColor(Color(.systemGray2))
        }
        .padding(.horizontal, 6)
        .cornerRadius(8)
        .background(Color(.systemGray6).clipShape(RoundedRectangle(cornerRadius:12)))
        
    }	
}

struct SearchInput_Previews: PreviewProvider {
    static var previews: some View {
        SearchInput(text: .constant(""), isSearching: .constant(false))
    }
}


