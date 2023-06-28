//
//  PhotoPicker.swift
//  Xplore
//
//  Created by Leander van Aarde on 2023/06/27.
//
import PhotosUI
import SwiftUI
struct PhotoPicker: View {
    @State private var model = PhotoPickermodel()

        var body: some View {
            VStack {
                AvatarImageView(image: model.avatarImage)
                Spacer()
                PhotoSelectionView(avatarItem: $model.avatarItem)
            }
            .onChange(of: model.avatarItem) { _ in
                            Task {
                                if let data = try? await model.avatarItem?.loadTransferable(type: Data.self) {
                                    if let uiImage = UIImage(data: data) {
                                        model.avatarImage = Image(uiImage: uiImage)
                                        return
                                    }
                                }
                                print("Failed")
                            }
                        }
            .padding()
            .frame(maxHeight: UIScreen.main.bounds.height / 3)
        }
    }
struct PhotoPicker_Previews: PreviewProvider {
    static var previews: some View {
        PhotoPicker()
    }
}
