//
//  DetailPostView.swift
//  DatabaseTestTask
//
//  Created by Ivan on 01.06.2021.
//

import UIKit

final class DetailPostView: UIView {

    // MARK: - Public Properties
    
    public let titleLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 15)
        return label
    }()
    
    public let bodyLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public let commentsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(cell: CommentCell.self)
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
        addSubview(titleLabel)
        addSubview(bodyLabel)
        addSubview(commentsTableView)
        
        let inset: CGFloat = 30
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: inset),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -inset)
        ])
        
        NSLayoutConstraint.activate([
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: inset),
            bodyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset),
            bodyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -inset)
        ])
        
        NSLayoutConstraint.activate([
            commentsTableView.topAnchor.constraint(equalTo: bodyLabel.bottomAnchor, constant: inset),
            commentsTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            commentsTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            commentsTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}
