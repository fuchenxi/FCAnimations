//
//  FCBaseCustomNavigationController.m
//  FCAnimations
//
//  Created by fcx on 2017/12/27.
//  Copyright © 2017年 https://github.com/fuchenxi. All rights reserved.
//

#import "FCBaseCustomNavigationController.h"

typedef NS_ENUM(NSUInteger, FCDebugTag) {
    
    FCEnterControllerType = 1000,
    FCLeaveControllerType,
    FCDeallocType,
};

#define _Flag_NSLog(fmt,...) {                                          \
    do                                                                  \
    {                                                                   \
        NSString *str = [NSString stringWithFormat:fmt, ##__VA_ARGS__]; \
        printf("%s\n",[str UTF8String]);                                \
    }                                                                   \
    while (0);                                                          \
}

#ifdef DEBUG
    #define ControllerLog(fmt, ...) _Flag_NSLog((@"" fmt), ##__VA_ARGS__)
#else
    #define ControllerLog(...)
#endif

@interface FCBaseCustomNavigationController ()

@end

@implementation FCBaseCustomNavigationController

- (instancetype)initWithRootViewController:(FCBaseCustomViewController *)rootViewController
                    setNavigationBarHidden:(BOOL)hidden {
    
    FCBaseCustomNavigationController *ncController = [[[self class] alloc] initWithRootViewController:rootViewController];
    [rootViewController useInteractivePopGestureRecognizer];
    
    [ncController setNavigationBarHidden:hidden animated:NO];
    
    return ncController;
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
#ifdef DEBUG
    
    [self debugWithString:@"[➡️] Did entered to" debugTag:FCEnterControllerType];
    
#endif
}

- (void)viewDidDisappear:(BOOL)animated {
    
    [super viewDidDisappear:animated];
    
#ifdef DEBUG
    
    [self debugWithString:@"[⛔️] Did left from" debugTag:FCLeaveControllerType];
    
#endif
}

- (void)dealloc {
    
#ifdef DEBUG
    
    [self debugWithString:@"[⚠️] Did released the" debugTag:FCDeallocType];
    
#endif
}

#pragma mark - Debug message.

- (void)debugWithString:(NSString *)string debugTag:(FCDebugTag)tag {
    
    NSDateFormatter *outputFormatter  = [[NSDateFormatter alloc] init] ;
    outputFormatter.dateFormat        = @"HH:mm:ss.SSS";
    
    NSString        *classString = [NSString stringWithFormat:@" %@ %@ [ Nav - %@ ] ", [outputFormatter stringFromDate:[NSDate date]], string, [self class]];
    NSMutableString *flagString  = [NSMutableString string];
    
    for (int i = 0; i < classString.length; i++) {
        
        if (i == 0 || i == classString.length - 1) {
            
            [flagString appendString:@"+"];
            continue;
        }
        
        switch (tag) {
                
            case FCEnterControllerType:
                [flagString appendString:@">"];
                break;
                
            case FCLeaveControllerType:
                [flagString appendString:@"<"];
                break;
                
            case FCDeallocType:
                [flagString appendString:@" "];
                break;
                
            default:
                break;
        }
    }
    
    NSString *showSting = [NSString stringWithFormat:@"\n%@\n%@\n%@\n", flagString, classString, flagString];
    ControllerLog(@"%@", showSting);
}
@end
