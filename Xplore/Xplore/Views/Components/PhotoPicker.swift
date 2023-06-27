//
//  PhotoPicker.swift
//  Xplore
//
//  Created by Leander van Aarde on 2023/06/27.
//
import PhotosUI
import SwiftUI

struct PhotoPicker: View {
    @State private var avatarItem: PhotosPickerItem?
    @State private var avatarImage: Image? = Image("SAFLAG")
    var body: some View {
        VStack() {
            if let avatarImage {
                avatarImage
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .scaledToFill()
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        minHeight: 0,
                        maxHeight: 100
                    )
                   
            }
            Spacer().padding(.vertical, 2).background(Color.blue)
            PhotosPicker("Select avatar", selection: $avatarItem, matching: .images)
        }
        .padding(.horizontal, 20)
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: 200
        )
        .onChange(of: avatarItem) { _ in
            Task {
                if let data = try? await avatarItem?.loadTransferable(type: Data.self) {
                    if let uiImage = UIImage(data: data) {
                        avatarImage =
                        Image(uiImage: uiImage)
                        return
                    }
                }
                print("Failed")
            }
        }
    }
}

struct PhotoPicker_Previews: PreviewProvider {
    static var previews: some View {
        PhotoPicker()
    }
}
