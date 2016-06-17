//
//  File.swift
//  TumblrMenu
//
//  Created by 賢瑭 何 on 2016/5/23.
//  Copyright © 2016年 Donny. All rights reserved.
//

import UIKit

//StackView bugs, waiting for fix

class AnimationManager: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    
    let duration = 0.5
    var isPresent = false
    var views = [String:UIView]()
    var snapShot: UIView?
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return duration
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        let containerView = transitionContext.containerView()
        snapShot = fromViewController?.view.snapshotViewAfterScreenUpdates(false)
        //let screen: (from:UIViewController, to:UIViewController)?
        if isPresent {
            toViewController?.view.frame = containerView!.frame
            containerView?.addSubview(snapShot!)
            if toViewController is EffectViewController {
                let superView = toViewController!.view
                for n in 1...12 {
                    let i = String(n)
                    views[i] = superView.viewWithTag(n)
                }
                print("\(views.count) and \(views["0"])")
                toViewController?.view.alpha = 0.0
                offScreen()
            }
        }
        
        containerView?.addSubview(toViewController!.view)
        
        UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: .CurveEaseOut, animations: {
            if self.isPresent {
                toViewController?.view.alpha = 1.0
                self.onScreen()
            }else {
                fromViewController?.view.alpha = 0.0
                self.offScreen()
            }
            }) { _ in
                transitionContext.completeTransition(true)
                if !self.isPresent {
                    self.snapShot?.removeFromSuperview()
                    self.setNil()
            }
        }
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresent = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresent = false
        return self
    }
    
    // MARK: - Set nil
    func setNil() {
        views.removeAll()
    }
    
    // MARK: - For Animation
    func onScreen() {
        if !views.isEmpty {
            for (_,view) in views {
                view.transform = CGAffineTransformIdentity
            }
        }
    }
    
    func offScreen() {
        if !views.isEmpty {
            views["1"]?.transform = CGAffineTransformMakeTranslation(-300, 0)
            views["2"]?.transform = CGAffineTransformMakeTranslation(-300, 0)
            views["3"]?.transform = CGAffineTransformMakeTranslation(300, 0)
            views["4"]?.transform = CGAffineTransformMakeTranslation(300, 0)
            views["5"]?.transform = CGAffineTransformMakeTranslation(-150, 0)
            views["6"]?.transform = CGAffineTransformMakeTranslation(-150, 0)
            views["7"]?.transform = CGAffineTransformMakeTranslation(150, 0)
            views["8"]?.transform = CGAffineTransformMakeTranslation(150, 0)
            views["9"]?.transform = CGAffineTransformMakeTranslation(-50, 0)
            views["10"]?.transform = CGAffineTransformMakeTranslation(-50, 0)
            views["11"]?.transform = CGAffineTransformMakeTranslation(50, 0)
            views["12"]?.transform = CGAffineTransformMakeTranslation(50, 0)
        }
    }
}



