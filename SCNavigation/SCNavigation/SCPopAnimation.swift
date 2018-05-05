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
        return 0.25
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromView = transitionContext.view(forKey: .from)!
        let toView = transitionContext.view(forKey: .to)!
        let containerView = transitionContext.containerView
        containerView.addSubview(toView)
        UIView.transition(from: fromView, to: toView, duration: self.transitionDuration(using: transitionContext), options: .transitionCurlDown) { (_) in
            fromView.transform = .identity
            toView.transform = .identity
            transitionContext.completeTransition(true)
        }
    }
    
}
