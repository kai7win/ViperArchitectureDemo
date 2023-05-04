//
//  UserListInteractor.swift
//  ViperArchitectureDemo
//
//  Created by Thomas on 2023/5/4.
//

import Foundation

protocol UserListInteractorInput: AnyObject {
    func fetchUsers()
}

protocol UserListInteractorOutput: AnyObject {
    func didFetchUsers(_ users: [User])
}

class UserListInteractor: UserListInteractorInput {
    weak var output: UserListInteractorOutput?

    func fetchUsers() {
        // 在此处获取用户数据，如从网络、数据库等
        // 假设我们已经获取了用户数据
        let users = [
            User(id: 1, name: "Alice", email: "alice@example.com"),
            User(id: 2, name: "Bob", email: "bob@example.com")
        ]
        output?.didFetchUsers(users)
    }
}
