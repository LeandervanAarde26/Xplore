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
    @State private var avatarImage: Image? = Image("DefaultPhotoPicker")
    @State private var isShowingImagePicker = false

        var body: some View {
            VStack {
  
                VStack{
                    if let avatarImage = avatarImage {
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
                
                Spacer()
                
                PhotosPicker("Select avatar", selection: $avatarItem, matching: .images)
                    .tint(.accentColor)
                    .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height / 3)
//                .controlSize(.large)
                .buttonStyle(.borderedProminent)
        

            }
            
            .onChange(of: avatarItem) { _ in
                            Task {
                                if let data = try? await avatarItem?.loadTransferable(type: Data.self) {
                                    if let uiImage = UIImage(data: data) {
                                        avatarImage = Image(uiImage: uiImage)
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
