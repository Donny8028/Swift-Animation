//
//  File.swift
//  SideMenu
//
//  Created by 賢瑭 何 on 2016/5/22.
//  Copyright © 2016年 Donny. All rights reserved.
//

import UIKit

@objc protocol AnimationManagerDelegate {
    func dismiss()
}
// Must add @objc
class AnimationManager: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    
    var duration = 0.3
    var isPresent = false
    var snapShot: UIView?{
        didSet{
            if let delegate = delegate {
                let gesture = UITapGestureRecognizer(target: delegate, action: #selector(delegate.dismiss))
                snapShot?.addGestureRecognizer(gesture)
            }
        }
    }
    
    var delegate: AnimationManagerDelegate?
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return duration
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let fromview = transitionContext.viewForKey(UITransitionContextFromViewKey)
        let toview = transitionContext.viewForKey(UITransitionContextToViewKey)
        let containerView = transitionContext.containerView()
        let moveUp = CGAffineTransformMakeTranslation(0.0, -50.0)
        let moveDown = CGAffineTransformMakeTranslation(0.0, containerView!.bounds.height - 150)
        
        if  isPresent {
            snapShot = fromview?.snapshotViewAfterScreenUpdates(true)
            toview?.transform = moveUp
            containerView?.addSubview(toview!)
            containerView?.addSubview(snapShot!)
        }
        
        UIView.animateWithDuration(duration, animations: {
            
            if self.isPresent{
                self.snapShot?.transform = moveDown
                toview?.transform = CGAffineTransformIdentity
            }else{
                fromview?.transform = moveUp
                self.snapShot?.transform = CGAffineTransformIdentity
            }
            
            }) { _ in
                transitionContext.completeTransition(true)
                if !self.isPresent {
                    self.snapShot?.removeFromSuperview()
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
}
