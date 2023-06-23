//
//  TestViewModel.swift
//  Xplore
//
//  Created by Leander van Aarde on 2023/06/23.
//

import Foundation
import FirebaseFirestore

class testViewModel:ObservableObject{
    @Published var testData = [test]()
    private var db = Firestore.firestore()
    
    func fetchData(){
        db.collection("test").addSnapshotListener{(Snapshot, error) in
            guard let documents = Snapshot?.documents else {
                print("no documents")
                return
            }
            self.testData = documents.map{(docSnapshot) -> test in
                let data = docSnapshot.data()
                let name = data["name"] as? String ?? ""
                print(name)
                return test(name: name)
            }
        }
    }
    
}
