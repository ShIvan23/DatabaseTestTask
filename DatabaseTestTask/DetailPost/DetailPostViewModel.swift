//
//  DetailPostViewModel.swift
//  DatabaseTestTask
//
//  Created by Ivan on 01.06.2021.
//

import Foundation

protocol DetailPostViewModelProtocol {
    init(post: Post)
    var commentsArray: [Comment] { get }
    var title: String { get }
    var body: String { get }
    func numberOfRows() -> Int
    func cellViewModel(at indexPath: IndexPath) -> CommentCellViewModelProtocol
    func fetchComments(completion: @escaping () -> Void)
}


final class DetailPostViewModel: DetailPostViewModelProtocol {
    
    // MARK: - Private Properties
    
    private let databaseManager = DatabaseManager()
    
    // MARK: - Public Properties
    
    var commentsArray = [Comment]()
    
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
    
    // MARK: - Public Methods
    
    func numberOfRows() -> Int {
        commentsArray.count
    }
    
    func cellViewModel(at indexPath: IndexPath) -> CommentCellViewModelProtocol {
        let comment = commentsArray[indexPath.row]
        return CommentCellViewModel(comment: comment)
    }
    
    func fetchComments(completion: @escaping () -> Void) {
        databaseManager.fetchComments(id: post.id) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let comments):
                self.commentsArray = comments
                completion()
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
