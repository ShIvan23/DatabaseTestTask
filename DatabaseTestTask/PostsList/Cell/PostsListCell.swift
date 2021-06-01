//
//  PostsListCell.swift
//  DatabaseTestTask
//
//  Created by Ivan on 01.06.2021.
//

import UIKit

final class PostsListCell: UITableViewCell {
    
    // MARK: - Public Properties
    
    public var viewModel: PostsListCellViewModelProtocol! {
        didSet {
            titleLabel.text = viewModel.title
            bodyLabel.text = viewModel.body
        }
    }
    
    // MARK: - Private Properties
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let bodyLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setConstraints() {
        addSubview(titleLabel)
        addSubview(bodyLabel)
        
        let inset: CGFloat = 15
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: inset),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -inset)
        ])
        
        NSLayoutConstraint.activate([
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: inset),
            bodyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset),
            bodyLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -inset),
            bodyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -inset)
        ])
    }
    
}
