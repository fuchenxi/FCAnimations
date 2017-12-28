//
//  FCBaseCustomViewController.m
//  FCAnimations
//
//  Created by fcx on 2017/12/27.
//  Copyright © 2017年 https://github.com/fuchenxi. All rights reserved.
//

#import "FCBaseCustomViewController.h"

@interface FCBaseCustomViewController ()

@property (nonatomic, strong) NSMutableDictionary <NSString *, FCControllerBaseViewConfig *> *viewsConfig;

@end

@implementation FCBaseCustomViewController

NSString * const titleViewId       = @"titleViewId";
NSString * const loadingAreaViewId = @"loadingAreaViewId";
NSString * const windowAreaViewId  = @"windowAreaViewId";
NSString * const contentViewId     = @"contentViewId";
NSString * const backgroundViewId  = @"backgroundViewId";


- (void)viewDidLoad {
    
    [super viewDidLoad];

    self.automaticallyAdjustsScrollViewInsets = NO;
    [self initViewsConfigs];
    [self makeViewsConfig:self.viewsConfig];
    [self buildConfigViews];
    [self setupSubViews];
    [self setupDataSource];
}

- (void)initViewsConfigs {
    
    self.viewsConfig = [[NSMutableDictionary alloc] init];
    CGFloat width    = [UIScreen mainScreen].bounds.size.width;
    CGFloat height   = [UIScreen mainScreen].bounds.size.height;
    
    // backgroundView config.
    {
        FCControllerBaseViewConfig *config   = [FCControllerBaseViewConfig new];
        config.exist                       = YES;
        config.frame                       = CGRectMake(0, 0, width, height);
        config.backgroundColor             = [UIColor whiteColor];
        self.viewsConfig[backgroundViewId] = config;
    }
    
    // contentView config.
    {
        FCControllerBaseViewConfig *config = [FCControllerBaseViewConfig new];
        config.exist                     = YES;
        config.frame                     = CGRectMake(0, 64, width, height - 64);
        config.backgroundColor           = [UIColor clearColor];
        self.viewsConfig[contentViewId]  = config;
    }
    
    // titleView config.
    {
        FCControllerBaseViewConfig *config = [FCControllerBaseViewConfig new];
        config.exist                     = YES;
        config.frame                     = CGRectMake(0, 0, width, 64.f);
        config.backgroundColor           = [UIColor clearColor];
        self.viewsConfig[titleViewId]    = config;
    }
    
    // loadingAreaView config.
    {
        FCControllerBaseViewConfig *config    = [FCControllerBaseViewConfig new];
        config.exist                        = YES;
        config.frame                        = CGRectMake(0, 64, width, height - 64.f);
        config.backgroundColor              = [UIColor clearColor];
        self.viewsConfig[loadingAreaViewId] = config;
    }
    
    // windowAreaView config.
    {
        FCControllerBaseViewConfig *config   = [FCControllerBaseViewConfig new];
        config.exist                       = YES;
        config.frame                       = CGRectMake(0, 0, width, height);
        config.backgroundColor             = [UIColor clearColor];
        self.viewsConfig[windowAreaViewId] = config;
    }
}

- (void)buildConfigViews {
    
    // backgroundView
    {
        FCControllerBaseViewConfig *config = self.viewsConfig[backgroundViewId];
        if (config && config.exist) {
            
            UIView *view         = [[UIView alloc] initWithFrame:config.frame];
            view.backgroundColor = config.backgroundColor;
            [self.view addSubview:view];
            self.backgroundView  = view;
        }
    }
    
    // contentView
    {
        FCControllerBaseViewConfig *config = self.viewsConfig[contentViewId];
        if (config && config.exist) {
            
            UIView *view         = [[UIView alloc] initWithFrame:config.frame];
            view.backgroundColor = config.backgroundColor;
            [self.view addSubview:view];
            self.contentView     = view;
        }
    }
    
    // titleView
    {
        FCControllerBaseViewConfig *config = self.viewsConfig[titleViewId];
        if (config && config.exist) {
            
            UIView *view         = [[UIView alloc] initWithFrame:config.frame];
            view.backgroundColor = config.backgroundColor;
            [self.view addSubview:view];
            self.titleView       = view;
        }
    }
    
    // loadingAreaView
    {
        FCControllerBaseViewConfig *config = self.viewsConfig[loadingAreaViewId];
        if (config && config.exist) {
            
            FCShowLoadingView *view = [[FCShowLoadingView alloc] initWithFrame:config.frame];
            view.backgroundColor  = config.backgroundColor;
            [self.view addSubview:view];
            self.loadingAreaView  = view;
        }
    }
    
    // windowAreaView
    {
        FCControllerBaseViewConfig *config = self.viewsConfig[windowAreaViewId];
        if (config && config.exist) {
            
            FCShowLoadingView *view = [[FCShowLoadingView alloc] initWithFrame:config.frame];
            view.backgroundColor  = config.backgroundColor;
            [self.view addSubview:view];
            self.windowAreaView   = view;
        }
    }
}

#pragma mark - Overwrite By Subclass.

- (void)makeViewsConfig:(NSMutableDictionary <NSString *, FCControllerBaseViewConfig *> *)viewsConfig {
    
}

- (void)setupSubViews {
    
}

- (void)setupDataSource {
    
}

@end
