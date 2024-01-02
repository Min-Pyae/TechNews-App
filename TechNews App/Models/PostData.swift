//
//  PostData.swift
//  TechNews App
//
//  Created by Chris Min on 02/01/2024.
//

import Foundation

struct Result: Decodable {
    var hits: [Post]
}


struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    var objectID: String
    var title: String
    var points: Int
    var url: String?
}
