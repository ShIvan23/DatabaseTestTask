//
//  PostsListViewController.swift
//  DatabaseTestTask
//
//  Created by Ivan on 01.06.2021.
//

import UIKit

final class PostsListViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private lazy var mainView = PostsListView()
    
    private var viewModel: PostsListViewModelProtocol! {
        didSet {
            viewModel.fetchPosts { [weak self] in
                guard let self = self else { return }
                self.mainView.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Life Cycle
    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = PostsListViewModel()
        setupTableView()
    }
    
    // MARK: - Private Methods
    
    private func setupTableView() {
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
    }

}

// MARK: - UITable View Data Source

extension PostsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell: PostsListCell = tableView.dequeueCell(for: indexPath)
        cell.viewModel = viewModel.cellViewModel(at: indexPath)
         
        return cell
    }
}

// MARK: - UITable View Delegate

extension PostsListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        tableView.deselectRow(at: indexPath, animated: true)
        let detailViewModel = viewModel.viewModelForSelectedRow(at: indexPath)
        let detailViewController = DetailPostViewController(viewModel: detailViewModel)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
