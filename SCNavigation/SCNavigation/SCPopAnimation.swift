//
//  SCPopAnimation.swift
//  SCNavigation
//
//  Created by SeacenLiu on 2018/5/4.
//  Copyright © 2018年 成. All rights reserved.
//

import UIKit

class SCPopAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewController(forKey: .from)!
        let toVC = transitionContext.viewController(forKey: .to)!
        let containerView = transitionContext.containerView
        let duration = transitionDuration(using: transitionContext)
        let translationW = UIScreen.main.bounds.width
        
        fromVC.view.addSubview(fromVC.snapshot!)
        fromVC.navigationController?.navigationBar.isHidden = true
        fromVC.view.transform = .identity
        
        toVC.view.isHidden = true
        toVC.snapshot?.transform = CGAffineTransform(translationX: -translationW*0.3, y: 0)
        
        containerView.addSubview(toVC.view)
        containerView.addSubview(toVC.snapshot!)
        containerView.sendSubview(toBack: toVC.snapshot!)
        
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0, options: .curveLinear, animations: {
            fromVC.view.transform = CGAffineTransform(translationX: translationW, y: 0)
            toVC.snapshot?.transform = .identity
        }) { (_) in
            toVC.navigationController?.navigationBar.isHidden = false
            toVC.view.isHidden = false
            
            fromVC.snapshot?.removeFromSuperview()
            toVC.snapshot?.removeFromSuperview()
            fromVC.snapshot = nil
            
            transitionContext.completeTransition(true)
        }
    }
    
}
