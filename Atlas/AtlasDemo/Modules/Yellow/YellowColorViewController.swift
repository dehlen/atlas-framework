//
//  YellowColorViewController.swift
//  HelloAtlas
//
//  Created by Engel, Stefan on 24.05.18.
//  Copyright © 2018 dm-drogerie markt GmbH + Co. KG. All rights reserved.
//

import UIKit

class YellowColorViewController: UIViewController {
    var viewModel: YellowColorViewModelProtocol?

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!

    @IBAction func dismiss(_ sender: Any) {
        viewModel?.dismiss()
    }

    @IBAction func login(_ sender: Any) {
        viewModel?.login()
    }

    @IBAction func logout(_ sender: Any) {
        viewModel?.logout()
    }
    
    override func viewDidLoad() {
        setup()
    }

    func setup() {
        guard let viewModel = viewModel else {
            return
        }

        view.backgroundColor = viewModel.backgroundColor
        loginButton.isHidden = viewModel.isLoggedIn
        logoutButton.isHidden = !viewModel.isLoggedIn
    }

    static func create() -> YellowColorViewController {
        let viewController: YellowColorViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "YellowColorViewController") as! YellowColorViewController
        return viewController
    }
}
