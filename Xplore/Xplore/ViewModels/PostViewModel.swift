import SwiftUI
import Firebase
import FirebaseFirestoreSwift

class PostViewModel: ObservableObject {
    private var db = Firestore.firestore()
    @StateObject private var viewModel = ImageUploadViewModel(storageManager: storageManager())
    
    func addUserPost(userId: String, postImage: URL?, postDescription: String, postCountry: String) async throws {
        do {
        
            guard let imageURL = postImage else {
                print("Error: Invalid image URL")
                return
            }

            let image = try await viewModel.uploadImage(fromURL: imageURL)

            
            print("post here, \(image)")
            
//            let post = addPost(userId: userId, postImage: (), postDescription: postDescription, postCountry: postCountry)

//            let docRef = db.collection("Posts").document()

//            let postData: [String: Any] = [
//                "userId": userId,
//                "postImage": postImage,
//                "postDescription": postDescription,
//                "postCountry": postCountry
//            ]

//            docRef.setData(postData) { error in
//                if let error = error {
//                    print("Error while posting document: \(error)")
//                } else {
//                    print("Document has been added")
//                }
//            }
        }
        
        
        
    }
}
