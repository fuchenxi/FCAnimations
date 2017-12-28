//
//  FCBaseCustomNavigationController.h
//  FCAnimations
//
//  Created by fcx on 2017/12/27.
//  Copyright © 2017年 https://github.com/fuchenxi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FCBaseCustomViewController.h"

@interface FCBaseCustomNavigationController : UINavigationController

/**
 Get the BaseCustomNavigationController with the root BaseCustomViewController.
 
 @param rootViewController The root BaseCustomViewController.
 @param hidden Hidden or not.
 @return BaseCustomNavigationController object.
 */
- (instancetype)initWithRootViewController:(FCBaseCustomViewController *)rootViewController
                    setNavigationBarHidden:(BOOL)hidden;

@end
