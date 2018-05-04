//
//  SCNavControllerDelegate.swift
//  SCNavigation
//
//  Created by SeacenLiu on 2018/5/4.
//  Copyright © 2018年 成. All rights reserved.
//

import UIKit

extension SCNavigationController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .push {
            return SCPushAnimation()
        } else if operation == .pop {
            return SCPopAnimation()
        }
        return nil
    }
}
