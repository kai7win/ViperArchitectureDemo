//
//  UserListViewController.swift
//  ViperArchitectureDemo
//
//  Created by Thomas on 2023/5/4.
//

import UIKit

class UserListViewController: UIViewController, UserListView {
    var presenter: UserListPresenter?

    private let tableView = UITableView()
    private var users: [User] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        setupTableView()
        setupAboutButton()
        presenter?.viewDidLoad()
    }
    

    private func setupTableView() {
        tableView.dataSource = self
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: "UserCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)

        // 添加约束
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func setupAboutButton() {
        let aboutButton = UIBarButtonItem(title: "About", style: .plain, target: self, action: #selector(aboutButtonTapped))
        navigationItem.rightBarButtonItem = aboutButton
    }
    
    @objc private func aboutButtonTapped() {
        presenter?.aboutButtonTapped()
    }

    func showUsers(_ users: [User]) {
        self.users = users
        tableView.reloadData()
    }
}

// 遵守 UITableViewDataSource 协议
extension UserListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserTableViewCell
        let user = users[indexPath.row]
        cell.configure(with: user)
        return cell
    }
}

// 遵守 UITableViewDelegate 协议
extension UserListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let user = users[indexPath.row]
        presenter?.didSelectUser(user)
    }
}
