//
//  PhotoSelectionView.swift
//  Xplore
//
//  Created by Leander van Aarde on 2023/06/28.
//
//import PhotosUI
import SwiftUI
import _PhotosUI_SwiftUI

struct PhotoSelectionView: View {
    @Binding var avatarItem: PhotosPickerItem?

    var body: some View {
        PhotosPicker("Select avatar", selection: $avatarItem, matching: .images)
            .tint(.accentColor)
            .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height / 3)
            .buttonStyle(.borderedProminent)
    }
}

struct PhotoSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoSelectionView(avatarItem: .constant(nil))
    }
}
