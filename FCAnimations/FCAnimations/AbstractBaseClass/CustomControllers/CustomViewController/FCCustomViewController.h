//
//  FCCustomViewController.h
//  FCAnimations
//
//  Created by fcx on 2017/12/20.
//  Copyright © 2017年 https://github.com/fuchenxi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FCCustomViewController : UIViewController

/**
 *  You can only use this method when the current controller is an UINavigationController's rootViewController.
 */
- (void)useInteractivePopGestureRecognizer;

/**
 *  You can use this property when this controller is pushed by an UINavigationController.
 */
@property (nonatomic)  BOOL  enableInteractivePopGestureRecognizer;

/**
 *  If this controller is managed by an UINavigationController, you can use this method to pop.
 *
 *  @param animated Animated or not.
 */
- (void)popViewControllerAnimated:(BOOL)animated;

/**
 *  If this controller is managed by an UINavigationController, you can use this method to pop to the rootViewController.
 *
 *  @param animated Animated or not.
 */
- (void)popToRootViewControllerAnimated:(BOOL)animated;


@end
