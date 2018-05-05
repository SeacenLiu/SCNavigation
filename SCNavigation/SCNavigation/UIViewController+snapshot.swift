//
//  UIViewController+snapshot.swift
//  SCNavigation
//
//  Created by SeacenLiu on 2018/5/5.
//  Copyright © 2018年 成. All rights reserved.
//

import UIKit

private let kAnimationTransitionSnapshot = "SCAnimationTransitionSnapshot"

extension UIViewController {
    var snapshot: UIView {
        get {
            if let view = objc_getAssociatedObject(self, kAnimationTransitionSnapshot) as? UIView {
                return view
            }
            let view = navigationController!.view.snapshotView(afterScreenUpdates: false)!
            objc_setAssociatedObject(self, kAnimationTransitionSnapshot, view, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return view
        }
        set {
            objc_setAssociatedObject(self, kAnimationTransitionSnapshot, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
