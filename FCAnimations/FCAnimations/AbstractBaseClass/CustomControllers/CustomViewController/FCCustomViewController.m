//
//  FCCustomViewController.m
//  FCAnimations
//
//  Created by fcx on 2017/12/20.
//  Copyright © 2017年 https://github.com/fuchenxi. All rights reserved.
//

#import "FCCustomViewController.h"

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


@interface FCCustomViewController () <UIGestureRecognizerDelegate>

@end

@implementation FCCustomViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
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

- (void)popViewControllerAnimated:(BOOL)animated {
    
    [self.navigationController popViewControllerAnimated:animated];
}

- (void)popToRootViewControllerAnimated:(BOOL)animated {
    
    [self.navigationController popToRootViewControllerAnimated:animated];
}

- (void)useInteractivePopGestureRecognizer {
    
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}

#pragma mark -
#pragma mark - Overwrite Setter & Getter.
@synthesize enableInteractivePopGestureRecognizer = _enableInteractivePopGestureRecognizer;

- (void)setEnableInteractivePopGestureRecognizer:(BOOL)enableInteractivePopGestureRecognizer {
    
    _enableInteractivePopGestureRecognizer = enableInteractivePopGestureRecognizer;
    self.navigationController.interactivePopGestureRecognizer.enabled = enableInteractivePopGestureRecognizer;
}

- (BOOL)enableInteractivePopGestureRecognizer {
    
    return _enableInteractivePopGestureRecognizer;
}

#pragma mark -
#pragma mark - Debug Message.
- (void)debugWithString:(NSString *)string debugTag:(FCDebugTag)tag {
    
    NSDateFormatter *outputFormatter  = [[NSDateFormatter alloc] init] ;
    outputFormatter.dateFormat        = @"HH:mm:ss.SSS";
    
    NSString        *classString = [NSString stringWithFormat:@" %@ %@ [%@] ", [outputFormatter stringFromDate:[NSDate date]], string, [self class]];
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
