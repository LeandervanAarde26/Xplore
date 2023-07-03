//
//  FavouritesViewModel.swift
//  Xplore
//
//  Created by Reinhardt de Beer on 2023/07/03.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import FirebaseFirestore

class FavouritesViewModel: ObservableObject {
    
    @Published var Favourited: Bool = false
    
    private var db = Firestore.firestore()
    
    func FavouriteCountry(uid: String, countryId: String) {
        
        let fav = FavouriteModel(userId: uid)
        
        do {
            
        try db.collection("countries").document(countryId).setData(["favourited": [uid]], merge: true)
            
            print(countryId)
            
        }
        
        catch {
            
            print(error)
            
        }
        
//        docRef.setData(fav) { error in
//            if let error = error {
//                print("Error while posting document: \(error)")
//            } else {
//                print("Document has been added")
//            }
//        }
        
    }
    
}
