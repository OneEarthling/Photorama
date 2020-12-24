//
//  Photo.swift
//  Photorama
//
//  Created by User on 11.12.2020.
//

import Foundation

class Photo: Codable {
    let title: String
    let remoteURL: URL?
    let photoID: String
    let dateTaken: Date?
    
    enum CodingKeys: String, CodingKey {
        case title
        case remoteURL = "url_z"
        case photoID = "id"
        case dateTaken = "datetaken"
    }
}
