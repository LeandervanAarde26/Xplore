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
        let docRef = db.collection("countries").document(countryId)
        
        let newValue = uid

        docRef.updateData(["favourited": FieldValue.arrayUnion([newValue])]) {
            error in
            if let error = error {
                print(error)
            } else {
                print ("favourited :\(uid). Country: \(countryId)")
            }
        }
    }
    
    func delFavouriteCountry(uid: String, countryId: String) {
        let docRef = db.collection("countries").document(countryId)
        
        let newValue = uid
        
        docRef.updateData(["favourited": FieldValue.arrayRemove([newValue])]){ error in
            if let error = error {
                print(error)
            } else {
                print ("removed favourite :\(uid). Country: \(countryId)")
            }
        }
    }
    
    func checkIfFavourited(uid: String, countryId: String, countryData: Country)-> Bool{
        if countryData.favourited?.contains(uid) ?? false{
            return true
        } else {
            return false
        }
    }
}
