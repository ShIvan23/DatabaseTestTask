//
//  DatabaseManager.swift
//  DatabaseTestTask
//
//  Created by Ivan on 01.06.2021.
//

import Foundation

final class DatabaseManager {
    
    // MARK: - Private Properties
    
    private let dataTaskService = DataTaskService()
    private let requestService = RequestService()
    
    // MARK: - Public Methods
    
    public func fetchData(completion: @escaping (Result<[Post], Error>) -> Void) {
        
        guard let request = requestService.postsRequest() else { return }
        dataTaskService.fetch(request: request, completionHandler: completion)
    }
}
