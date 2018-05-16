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
        
//        if navigationController!.isKind(of: ViolenceController.self) {
//            let barView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44+20))
//            barView.backgroundColor = UIColor.red
//            view.addSubview(barView)
//            
//            let m: CGFloat = 30
//            let w: CGFloat = 30
//            let rx = UIScreen.main.bounds.width-m-w
//            let y = (44-w)*0.5+20
//            let next = UIButton(frame: CGRect(x: rx, y: y, width: w, height: w))
//            next.backgroundColor = .blue
//            barView.addSubview(next)
//            next.addTarget(self, action: #selector(nextAction), for: .touchUpInside)
//            let last = UIButton(frame: CGRect(x: m, y: y, width: w, height: w))
//            last.backgroundColor = .black
//            barView.addSubview(last)
//        } else {
//            let next = UIBarButtonItem(title: "next", style: .plain, target: self, action: #selector(nextAction))
//            navigationItem.rightBarButtonItem = next
//        }
    }

}

