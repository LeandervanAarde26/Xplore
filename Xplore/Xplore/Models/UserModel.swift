//
//  TestModel.swift
//  Xplore
//
//  Created by Leander van Aarde on 2023/06/23.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Identifiable, Codable {
    @DocumentID var id: String?
    var username: String?
    var email: String?
    var profileURL: String?
    var posts: [String]?
}
