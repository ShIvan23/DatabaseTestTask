//
//  PostsListView.swift
//  DatabaseTestTask
//
//  Created by Ivan on 01.06.2021.
//

import UIKit

final class PostsListView: UIView {

  // MARK: - Public Properties
    
    public let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(cell: PostsListCell.self)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Initializers
    
    init() {
        super.init(frame: CGRect())
        setConstraints()
        customizeView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func customizeView() {
        backgroundColor = .white
    }
    
    private func setConstraints() {
        
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
}
