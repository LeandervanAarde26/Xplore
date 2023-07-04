//
//  Favorites.swift
//  Xplore
//
//  Created by Leander Van Aarde on 04/07/2023.
//
import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class Favorites: ObservableObject{
    @Published var favorites = [Country]()
    private var db = Firestore.firestore()
    private var userVm = UserStateViewModel()
    
    func fetchData(){
        let userId = userVm.getUserId();
        db.collection("countries").whereField("favourited", arrayContains: userId)
            .getDocuments { (querySnapshot, error) in
                
                guard let documents = querySnapshot?.documents else {
                    print("no documents could be found")
                    return
                }
                
                self.favorites = documents.compactMap { queryDocumentSnapshot in
                    do {
                        return try queryDocumentSnapshot.data(as: Country.self)
                    } catch {
                        print("Error decoding document: (error)")
                        return nil
                }
            }
        }
    }
    
    
    func removeFromFavorites(uid: String) {
        let userId = userVm.getUserId()
        
        db.collection("countries").document(uid).updateData([
            "favourited": FieldValue.arrayRemove([userId])
        ]) { error in
            if let error = error {
                print("Error removing from favorites: \(error)")
            } else {
                print("Successfully removed from favorites")
            }
        }
    }}
