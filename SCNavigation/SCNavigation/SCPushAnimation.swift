//
//  SCPushAnimation.swift
//  SCNavigation
//
//  Created by SeacenLiu on 2018/5/4.
//  Copyright © 2018年 成. All rights reserved.
//

import UIKit

class SCPushAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewController(forKey: .from)!
        let toVC = transitionContext.viewController(forKey: .to)!
        let containerView = transitionContext.containerView
        let duration = transitionDuration(using: transitionContext)
        let translationW = UIScreen.main.bounds.width
        fromVC.view.isHidden = true
        
        containerView.addSubview(toVC.view)
        toVC.navigationController?.view.superview?.insertSubview(fromVC.snapshot!, belowSubview: toVC.navigationController!.view)
        toVC.navigationController?.view.transform = CGAffineTransform(translationX: translationW, y: 0)
        
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0, options: .curveLinear, animations: {
            fromVC.snapshot?.transform = CGAffineTransform(translationX: -translationW*0.3, y: 0)
            toVC.navigationController!.view.transform = CGAffineTransform(translationX: 0, y: 0)
        }) { (_) in
            fromVC.view.isHidden = false
            fromVC.snapshot?.removeFromSuperview()
            transitionContext.completeTransition(true)
        }
    }
    
}
