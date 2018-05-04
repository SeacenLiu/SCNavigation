//
//  SCNavigationController.swift
//  SCNavigation
//
//  Created by SeacenLiu on 2018/5/4.
//  Copyright © 2018年 成. All rights reserved.
//

import UIKit

class SCNavigationController: UINavigationController {

    override func loadView() {
        super.loadView()
        // 屏蔽系统的返回手势
        interactivePopGestureRecognizer?.isEnabled = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

}
