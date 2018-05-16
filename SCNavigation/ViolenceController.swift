//
//  ViolenceController.swift
//  SCNavigation
//
//  Created by SeacenLiu on 2018/5/16.
//  Copyright © 2018年 成. All rights reserved.
//

import UIKit

class ViolenceController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        
        navigationBar.isUserInteractionEnabled = false
    }

}
