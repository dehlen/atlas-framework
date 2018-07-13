//
//  ColorViewController.swift
//  AtlasDemo
//
//  Created by Engel, Stefan on 28.06.18.
//  Copyright © 2018 dm-drogerie markt GmbH + Co. KG. All rights reserved.
//

import UIKit

class GreenColorView: UIViewController {
    var viewModel: ColorViewModelProtocol?

    override func viewDidLoad() {
        view.backgroundColor = viewModel?.backgroundColor
    }
}
