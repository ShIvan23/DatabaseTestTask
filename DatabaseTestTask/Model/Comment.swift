//
//  Comment.swift
//  DatabaseTestTask
//
//  Created by Ivan on 01.06.2021.
//

import Foundation

struct Comment: Decodable {
    let name: String
    let email: String
    let body: String
}
