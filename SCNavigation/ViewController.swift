//
//  ViewController.swift
//  SCNavigation
//
//  Created by SeacenLiu on 2018/5/4.
//  Copyright © 2018年 成. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    static var index = 1
    
    @objc private func nextAction() {
        ViewController.index += 1
        navigationController!.pushViewController(ViewController(), animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        title = "No.\(ViewController.index)"
        
        let next = UIBarButtonItem(title: "next", style: .plain, target: self, action: #selector(nextAction))
        navigationItem.rightBarButtonItem = next
    }

}

