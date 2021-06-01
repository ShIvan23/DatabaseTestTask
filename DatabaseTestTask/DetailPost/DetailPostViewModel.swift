//
//  DetailPostViewModel.swift
//  DatabaseTestTask
//
//  Created by Ivan on 01.06.2021.
//

import Foundation

protocol DetailPostViewModelProtocol {
    init(post: Post)
}


final class DetailPostViewModel: DetailPostViewModelProtocol {
    
    // MARK: - Private Properties
    
    private let post: Post
    
    // MARK: - Initializers
    
    init(post: Post) {
        self.post = post
    }
}
