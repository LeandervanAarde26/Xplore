//
//  TestModel.swift
//  Xplore
//
//  Created by Leander van Aarde on 2023/06/23.
//

import Foundation
import FirebaseFirestoreSwift

struct Country: Identifiable, Codable {
    @DocumentID var id: String?
    var name: Name?
    var currencies: Currency?
    var capital: [String]?
    var region: String?
    var subregion: String?
    var maps: Map?
    var population: Int?
    var car: Car?
    var timezones: [String]?
    var continents: [String]?
    var flags: Flag?
}

struct Name: Codable {
    var common: String?
    var official: String?
}

struct Currency: Codable {
    var name: String?
    var symbol: String?
    var acronym: String?
}

struct Map: Codable {
    var googleMaps: String?
    var openStreetMaps: String?
}

struct Car: Codable {
    var signs: [String]?
    var side: String?
}

struct Flag: Codable {
    var png: String?
    var svg: String?
    var alt: String?
}
