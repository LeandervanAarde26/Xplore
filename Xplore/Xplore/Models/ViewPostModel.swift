//
//  ViewPostModel.swift
//  Xplore
//
//  Created by Leander Van Aarde on 03/07/2023.
//

import Foundation

struct ViewPostModel: Decodable{
    var user: User?
    var image: String?
    var country: String?
    var description: String?
}
