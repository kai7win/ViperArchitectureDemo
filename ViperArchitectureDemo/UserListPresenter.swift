//
//  UserListPresenter.swift
//  ViperArchitectureDemo
//
//  Created by Thomas on 2023/5/4.
//

import Foundation

protocol UserListView: AnyObject {
    func showUsers(_ users: [User])
}

class UserListPresenter {
    weak var view: UserListView?
    var interactor: UserListInteractorInput?
    var router: UserListRouter?

    func viewDidLoad() {
        interactor?.fetchUsers()
    }
    
    func didSelectUser(_ user: User) {
        router?.navigateToUserDetails(user)
    }
    
    func aboutButtonTapped() {
        router?.navigateToAbout()
    }
}

extension UserListPresenter: UserListInteractorOutput {
    func didFetchUsers(_ users: [User]) {
        view?.showUsers(users)
    }
}
