import PhotosUI
import SwiftUI
struct PhotoPicker: View {
    @State private var model = PhotoPickermodel()
    @Binding var imageUrl: URL?
    @StateObject private var imghelper = imageHelper()
    @StateObject private var firebaseStoage = StorageManager()
    @State private var imgUri: URL?
        var body: some View {
            VStack {
                AvatarImageView(image: model.avatarImage)
                Spacer()
                PhotoSelectionView(avatarItem: $model.avatarItem, selectedImageURL: $imageUrl)
            }
            .onChange(of: model.avatarItem) { _ in
                Task {
                    if let data = try? await model.avatarItem?.loadTransferable(type: Data.self) {
                        if let uiImage = UIImage(data: data) {
                            model.avatarImage = Image(uiImage: uiImage)
                            if let imageURL = await imghelper.saveImageToTemporaryDirectory(image: uiImage) {
                                imageUrl = imageURL
                            }
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
        PhotoPicker(imageUrl: .constant(nil))
    }
}
