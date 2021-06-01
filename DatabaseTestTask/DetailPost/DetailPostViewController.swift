//
//  DetailPostViewController.swift
//  DatabaseTestTask
//
//  Created by Ivan on 01.06.2021.
//

import UIKit

final class DetailPostViewController: UIViewController {
    
    // MARK: - Public Properties
    
    let viewModel: DetailPostViewModelProtocol
    
    // MARK: - Private Properties
    
    private lazy var mainView = DetailPostView()
    
    // MARK: - Initializers
    
    init(viewModel: DetailPostViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.fetchComments { [weak self] in
            guard let self = self else { return }
            
            self.mainView.commentsTableView.reloadData()
        }
    }
    
    // MARK: - Private Methods
    
    private func setupTableView() {
        mainView.commentsTableView.delegate = self
        mainView.commentsTableView.dataSource = self
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        title = "Detail Post"
        mainView.titleLabel.text = viewModel.title
        mainView.bodyLabel.text = viewModel.body
    }

}

// MARK: - UITable View Data Source

extension DetailPostViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CommentCell = tableView.dequeueCell(for: indexPath)
        cell.viewModel = viewModel.cellViewModel(at: indexPath)
        
        return cell
    }
}

// MARK: - UITable View Delegate

extension DetailPostViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
