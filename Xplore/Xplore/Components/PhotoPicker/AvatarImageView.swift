//
//  AvatarImageView.swift
//  Xplore
//
//  Created by Leander van Aarde on 2023/06/28.
//

import SwiftUI

struct AvatarImageView: View {
    var image : Image?
    var body: some View {
        Group{
            if let avatarImage = image {
                avatarImage
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height / 3)
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.gray)
                    .frame(maxHeight: UIScreen.main.bounds.height / 5)
                    .padding()
            }

        }
        .background(Color.white)
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray, lineWidth: 1)
        )
    }
}

struct AvatarImageView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarImageView()
    }
}
