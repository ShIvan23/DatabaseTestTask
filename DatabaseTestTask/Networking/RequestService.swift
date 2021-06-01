//
//  RequestService.swift
//  DatabaseTestTask
//
//  Created by Ivan on 01.06.2021.
//

import Foundation

protocol RequestServiceProtocol {
    var pageNumber: Int { get }
    func postsRequest() -> URLRequest?
    func commentsRequest(id: Int) -> URLRequest?
}

final class RequestService: RequestServiceProtocol {
    
    // MARK: - Public Properties
    
    var pageNumber: Int = 1
    
    
    // MARK: - Public Methods
    
    func postsRequest() -> URLRequest? {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts?_page=\(pageNumber)") else { return nil }
        pageNumber += 1
        return URLRequest(url: url)
    }
    
    func commentsRequest(id: Int) -> URLRequest? {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/\(id)/comments") else { return nil }
        return URLRequest(url: url)
    }
}
