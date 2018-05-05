//
//  SCNavigationController.swift
//  SCNavigation
//
//  Created by SeacenLiu on 2018/5/4.
//  Copyright © 2018年 成. All rights reserved.
//

import UIKit

class SCNavigationController: UINavigationController {
    
    // MARK: - public
    /// 返回手势是否与其他手势共存
    public var recognizeSimultaneouslyEnable = false
    
    /// pop手势启动范围
    public var popRecognizerRangeX: CGFloat = 80.0
    
    /// 返回手势是否可用
    public var popRecognizerEnable = true {
        didSet {
            popRecognizer.isEnabled = popRecognizerEnable
        }
    }

    // MARK: - view life cycle
    override func loadView() {
        super.loadView()
        // 屏蔽系统的返回手势
        interactivePopGestureRecognizer?.isEnabled = false
        // 设置UINavigationControllerDelegate
        delegate = self
        // 添加自定义右滑返回手势
        view.addGestureRecognizer(popRecognizer)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.tintColor = .black
    }
    
    // MARK: - 右滑返回交互部分
    /// 自定义右滑返回手势
    private lazy var popRecognizer: UIPanGestureRecognizer = {
        let recognizer = UIPanGestureRecognizer(target: self, action: #selector(dragging(recognizer:)))
        recognizer.delegate = self
        return recognizer
    }()

    /// 自定义右滑返回手势的拖拽方法
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
    
}

// MARK: - UIGestureRecognizerDelegate
extension SCNavigationController: UIGestureRecognizerDelegate {
    // 是否接收手势
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if popRecognizerEnable == false {
            return false
        }
        if viewControllers.count <= 1 {
            return false
        }
        if gestureRecognizer.isEqual(popRecognizer) {
            let point = touch.location(in: gestureRecognizer.view)
            // TODO: - 设置手势触发区
            if point.x < popRecognizerRangeX {
                return true
            }
        }
        return false
    }
    
    // 是否与其他手势共存，一般使用默认值(默认返回false：不与任何手势共存)
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        if recognizeSimultaneouslyEnable {
            if otherGestureRecognizer.isKind(of: UIPanGestureRecognizer.self) {
                return true
            }
        }
        return false
    }
}

// MARK: - UINavigationControllerDelegate
extension SCNavigationController: UINavigationControllerDelegate {
    // 返回自定义动画部分
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .push {
            return SCPushAnimation()
        } else if operation == .pop {
            return SCPopAnimation()
        }
        return nil
    }
}
