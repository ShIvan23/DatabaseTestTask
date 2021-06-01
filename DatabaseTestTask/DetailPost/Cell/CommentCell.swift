//
//  CommentCell.swift
//  DatabaseTestTask
//
//  Created by Ivan on 01.06.2021.
//

import UIKit

final class CommentCell: UITableViewCell {

    // MARK: - Public Properties
    
    public var viewModel: CommentCellViewModelProtocol! {
        didSet {
            nameLabel.text = viewModel.name
            emailLabel.text = viewModel.email
            bodyLabel.text = viewModel.body
        }
    }
    
 // MARK: - Private Properties
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
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
        addSubview(nameLabel)
        addSubview(emailLabel)
        addSubview(bodyLabel)
        
        let inset: CGFloat = 15
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: inset),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -inset)
        ])
        
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: inset / 2),
            emailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset * 2),
            emailLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -inset)
        ])
        
        NSLayoutConstraint.activate([
            bodyLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: inset),
            bodyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset),
            bodyLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -inset),
            bodyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -inset)
        ])
    }
    
}
