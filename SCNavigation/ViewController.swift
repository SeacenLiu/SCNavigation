//
//  ViewController.swift
//  SCNavigation
//
//  Created by SeacenLiu on 2018/5/4.
//  Copyright © 2018年 成. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @objc private func nextAction() {
        navigationController!.pushViewController(ViewController(), animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let color = UIColor.init(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1.0)
        view.backgroundColor = color
        
        title = "No." + String.init(format: "%03d", navigationController!.viewControllers.count)
        
        let next = UIBarButtonItem(title: "next", style: .plain, target: self, action: #selector(nextAction))
        navigationItem.rightBarButtonItem = next
    }

}

