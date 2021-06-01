//
//  CommentCellViewModel.swift
//  DatabaseTestTask
//
//  Created by Ivan on 01.06.2021.
//

import Foundation

protocol CommentCellViewModelProtocol {
    init(comment: Comment)
    var name: String { get }
    var email: String { get }
    var body: String { get }
}

final class CommentCellViewModel: CommentCellViewModelProtocol {
    
    // MARK: - Public Properties
    
    var name: String {
        comment.name
    }
    
    var email: String {
        comment.email
    }
    
    var body: String {
        comment.body
    }
    
    // MARK: - Private Properties
    
    private let comment: Comment
    
    // MARK: - Initializers
    
    init(comment: Comment) {
        self.comment = comment
    }
}
