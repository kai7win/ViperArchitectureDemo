//
//  UserListRouter.swift
//  ViperArchitectureDemo
//
//  Created by Thomas on 2023/5/4.
//

import UIKit

class UserListRouter {
    
    weak var viewController: UserListViewController?
    
    func navigateToUserDetails(_ user: User) {
        let userDetailsViewController = UserDetailsViewController(user: user)
        viewController?.navigationController?.pushViewController(userDetailsViewController, animated: true)
    }
    
    func navigateToAbout() {
        let aboutViewController = AboutViewController()
        viewController?.navigationController?.pushViewController(aboutViewController, animated: true)
    }
    
    static func createModule() -> UIViewController {
        let viewController = UserListViewController()
        let presenter = UserListPresenter()
        let interactor = UserListInteractor()
        let router = UserListRouter()
        
        router.viewController = viewController
        viewController.presenter = presenter
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter

        return viewController
    }
}
