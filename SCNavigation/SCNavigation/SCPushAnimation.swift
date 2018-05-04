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
        return 0.25
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let toView = transitionContext.view(forKey: .to)
        transitionContext.containerView.addSubview(toView!)
        transitionContext.completeTransition(true)
    }
    
}
