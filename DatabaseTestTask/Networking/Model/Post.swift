//
//  Post.swift
//  DatabaseTestTask
//
//  Created by Ivan on 01.06.2021.
//

import Foundation


struct Post: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
