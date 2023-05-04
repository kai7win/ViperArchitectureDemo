//
//  AboutViewController .swift
//  ViperArchitectureDemo
//
//  Created by Thomas on 2023/5/4.
//

import UIKit

class AboutViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        title = "About"

        let aboutLabel = UILabel()
        aboutLabel.text = "About our App"
        aboutLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(aboutLabel)

        NSLayoutConstraint.activate([
            aboutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            aboutLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
