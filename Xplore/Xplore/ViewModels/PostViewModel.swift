import SwiftUI
import Firebase
import FirebaseFirestoreSwift

class PostViewModel: ObservableObject {
    private var db = Firestore.firestore()
    @StateObject private var viewModel = ImageUploadViewModel(storageManager: StorageManager())
    
    
    func addUserPost(userId: String, postImage: URL?, postDescription: String, postCountry: String) async throws {
        do {
            guard let imageURL = postImage else {
                print("Error: Invalid image URL")
                return
            }

            try await viewModel.uploadImage(fromURL: imageURL) { (uri, error) in
                if let error = error {
                    print("Error: \(error)")
                } else if let uri = uri {
                    // Handle the uploaded image URI here
                    print("Uploaded image URI:", uri)
                    let docRef = self.db.collection("Posts").document()
                    let postData: [String: Any] = [
                        "userId": userId,
                        "postImage": uri.absoluteString,
                        "postDescription": postDescription,
                        "postCountry": postCountry
                    ]
                    docRef.setData(postData) { error in
                        if let error = error {
                            print("Error while posting document: \(error)")
                        } else {
                            print("Document has been added")
                        }
                    }
                }
            }
        }
    }
}
