//
//  UIViewController+snapshot.swift
//  SCNavigation
//
//  Created by SeacenLiu on 2018/5/5.
//  Copyright © 2018年 成. All rights reserved.
//

import UIKit

private var kSnapshotKey = "SCAnimationTransitionSnapshot"

extension UIViewController {
    var snapshot: UIView? {
        get {
            if let view = objc_getAssociatedObject(self, &kSnapshotKey) as? UIView {
                return view
            }
            let view = navigationController!.view.snapshotView(afterScreenUpdates: false)
            objc_setAssociatedObject(self, &kSnapshotKey, view, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return view
        }
        set {
            objc_setAssociatedObject(self, &kSnapshotKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
