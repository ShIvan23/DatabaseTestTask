//
//  PostsListCellViewModel.swift
//  DatabaseTestTask
//
//  Created by Ivan on 01.06.2021.
//

import Foundation

protocol PostsListCellViewModelProtocol {
    var title: String { get }
    var body: String { get }
    init(post: Post)
}

final class PostsListCellViewModel: PostsListCellViewModelProtocol {
    
    // MARK: - Public Properties
    
    var title: String {
        "Title: \(post.title)"
    }
    
    var body: String {
        "Body: \(post.body)"
    }
    
    // MARK: - Private Properties
    
    private let post: Post
    
    // MARK: - Initializers
  
    init(post: Post) {
        self.post = post
    }
    
    
}
