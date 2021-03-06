//
//  PostsListViewModel.swift
//  DatabaseTestTask
//
//  Created by Ivan on 01.06.2021.
//

import Foundation

protocol PostsListViewModelProtocol {
    var postsArray: [Post] { get }
    func fetchPosts(completion: @escaping () -> Void)
    func numberOfRows() -> Int
    func cellViewModel(at indexPath: IndexPath) -> PostsListCellViewModelProtocol
    func viewModelForSelectedRow(at indexPath: IndexPath) -> DetailPostViewModelProtocol
}

final class PostsListViewModel: PostsListViewModelProtocol {
    
    // MARK: - Public Properties
    
    private(set) var postsArray = [Post]()
    
    // MARK: - Private Properties
    
    private let databaseManager = DatabaseManager()
    
    // MARK: - Public Methods
    
    func fetchPosts(completion: @escaping () -> Void) {
        databaseManager.fetchData { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let posts):
                self.postsArray.append(contentsOf: posts)
                completion()
                
            case .failure(let error):
                /// Здесь нужно вывести Alert
                print(error.localizedDescription)
            }
        }
    }
    
    func numberOfRows() -> Int {
        postsArray.count
    }
    
    func cellViewModel(at indexPath: IndexPath) -> PostsListCellViewModelProtocol {
        
        let post = postsArray[indexPath.row]
        return PostsListCellViewModel(post: post)
    }
    
    func viewModelForSelectedRow(at indexPath: IndexPath) -> DetailPostViewModelProtocol {
       
        let post = postsArray[indexPath.row]
        return DetailPostViewModel(post: post)
    }
    
}
