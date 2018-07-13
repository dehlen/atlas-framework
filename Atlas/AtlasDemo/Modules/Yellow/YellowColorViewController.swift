//
//  YellowColorViewController.swift
//  HelloAtlas
//
//  Created by Engel, Stefan on 24.05.18.
//  Copyright © 2018 dm-drogerie markt GmbH + Co. KG. All rights reserved.
//

import UIKit

class YellowColorViewController: UIViewController {
    var viewModel: ColorViewModelProtocol?

    override func viewDidLoad() {
        view.backgroundColor = viewModel?.backgroundColor
    }
}
