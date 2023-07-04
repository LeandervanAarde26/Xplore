import SwiftUI
import Firebase
import FirebaseFirestoreSwift

class PostViewModel: ObservableObject {
    private var db = Firestore.firestore()
    @ObservedObject private var viewModel = ImageUploadViewModel(storageManager: StorageManager())
    private var postColl = DatabaseKeys.Countries.postCollection
    @Published var posts : [ViewPostModel] = []
    
    func addUserPost(userId: String, postImage: URL?, postDescription: String, postCountry: String) {
        do {
            guard let imageURL = postImage else {
                print("Error: Invalid image URL")
                return
            }

            viewModel.uploadImage(fromURL: imageURL) { (uri, error) in
                if let error = error {
                    print("Error: \(error)")
                } else if let uri = uri {
                    // Handle the uploaded image URI here
                    print("Uploaded image URI:", uri)
                    let docRef = self.db.collection(self.postColl).document()
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
    
    func getAllPosts(){
        let userRef = self.db.collection("users")
       
        self.db.collection(self.postColl).getDocuments{(querySnapshot, error ) in
            
            guard let docs = querySnapshot?.documents else{
                return
            }

            self.posts = docs.compactMap { queryDocumentSnapshot in
                do {
                    print(queryDocumentSnapshot.data())
                    for (key, value) in queryDocumentSnapshot.data() {
                        if key == "userId" {
                            if let userID = value as? String {
                                print("userID: \(userID)")
                                userRef.document(userID).getDocument { document, error in
                                    if let document = document, document.exists {
                                        if let user = try? document.data(as: User.self) {
                                            print("User: \(user)")
                                            let postImage = queryDocumentSnapshot.data()["postImage"] as? String
                                            let postCountry = queryDocumentSnapshot.data()["postCountry"] as? String
                                            let postDescription = queryDocumentSnapshot.data()["postDescription"] as? String
                                            let newPost = ViewPostModel(user: user, image: postImage, country: postCountry, description: postDescription)
                                            self.posts.append(newPost)
                                        }
                                    } else {
                                        print("User document not found")
                                    }
                                }
                            }
                        }
                    }
                    print("ALL POSTS, \(self.posts)")
                    return try queryDocumentSnapshot.data(as: ViewPostModel.self)
                } catch {
                    print("Error decoding document: \(error)")
                    return nil
                }
            }
        }
    }
}
