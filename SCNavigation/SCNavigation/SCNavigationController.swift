//
//  SCNavigationController.swift
//  SCNavigation
//
//  Created by SeacenLiu on 2018/5/4.
//  Copyright © 2018年 成. All rights reserved.
//

import UIKit

class SCNavigationController: UINavigationController {
    
    private lazy var popRecognizer = UIPanGestureRecognizer(target: self, action: #selector(dragging(recognizer:)))
    
    @objc private func dragging(recognizer: UIPanGestureRecognizer) {
        // 如果只有1个子控制器,停止拖拽
        if viewControllers.count <= 1 {
            return
        }
        // 在x方向上移动的距离
        let tx = recognizer.translation(in: view).x
        // 在x方向上移动的距离除以屏幕的宽度
        var width_scale: CGFloat
        let priorView = viewControllers[viewControllers.count-2].snapshot!
        if recognizer.state == .began {
            // 添加截图到最后面
            width_scale = 0;
            UIApplication.shared.keyWindow?.insertSubview(priorView, at: 0)
        } else if recognizer.state == .changed {
            // 移动view
            if tx > 10 {
                width_scale = (tx-10)/view.bounds.width
                view.transform = CGAffineTransform(translationX: tx-10, y: 0)
                priorView.transform = CGAffineTransform(translationX: -view.bounds.width*0.3*(1-width_scale), y: 0)
            }
        } else if recognizer.state == .ended {
            // 决定pop还是还原
            if tx >= 100 {
                UIView.animate(withDuration: 0.25, animations: {
                    self.view.transform = CGAffineTransform(translationX: self.view.bounds.width, y: 0)
                    priorView.transform = .identity
                }, completion: { (_) in
                    self.popViewController(animated: false)
                    self.view.transform = .identity
                    priorView.removeFromSuperview()
                    self.viewControllers.last?.snapshot = nil
                })
            } else {
                UIView.animate(withDuration: 0.25, animations: {
                    self.view.transform = .identity
                }, completion: { (_) in
                    priorView.removeFromSuperview()
                })
            }
        }
    }

    override func loadView() {
        super.loadView()
        // 屏蔽系统的返回手势
        interactivePopGestureRecognizer?.isEnabled = false
        delegate = self
        // 添加自定义右滑返回手势
        view.addGestureRecognizer(popRecognizer)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationBar.barTintColor = .black
    }

}
