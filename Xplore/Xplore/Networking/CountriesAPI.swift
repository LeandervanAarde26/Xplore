//
//  TestViewModel.swift
//  Xplore
//
//  Created by Leander van Aarde on 2023/06/23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class countryViewModel: ObservableObject{
    @Published var countries = [Country]()
    private var db = Firestore.firestore()
    
    func fetchData(){
        db.collection("countries").getDocuments{ (querySnapshot, error) in

            guard let documents = querySnapshot?.documents else {
                print("no documents could be found")
                return
            }
            
            
            
            self.countries = documents.compactMap { queryDocumentSnapshot in
                do {
                    return try queryDocumentSnapshot.data(as: Country.self)
                } catch {
                    print("Error decoding document: (error)")
                    return nil
                }
            }
        }
    }
    
}
