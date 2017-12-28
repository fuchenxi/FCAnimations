//
//  FCAnimationListController.m
//  FCAnimations
//
//  Created by fcx on 2017/12/27.
//  Copyright © 2017年 https://github.com/fuchenxi. All rights reserved.
//

#import "FCAnimationListController.h"
#import "FCControllersHeader.h"
#import "FCItem.h"
#import "FCCellDataAdapter.h"
#import "FCAnimationListCell.h"

@interface FCAnimationListController () <UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate, UIViewControllerTransitioningDelegate, UINavigationControllerDelegate, FCCustomCellDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray  <FCCellDataAdapter *> *items;

@end

@implementation FCAnimationListController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self rootViewControllerSetup];
    
    [self configureDataSource];
    
    [self configureTableView];
    
    [self configureTitleView];
}

#pragma mark - RootViewController setup.

- (void)rootViewControllerSetup {
    
    // [IMPORTANT] Enable the Push transitioning.
    self.navigationController.delegate = self;
    
    // [IMPORTANT] Set the RootViewController's push delegate.
    [self useInteractivePopGestureRecognizer];
}

#pragma mark - Config TitleView.

- (void)configureTitleView {
    
//    BackgroundLineView *lineView = [BackgroundLineView backgroundLineViewWithFrame:CGRectMake(0, 0, Width, 64 + (iPhoneX ? UIView.additionaliPhoneXTopSafeHeight : 0))
//                                                                         lineWidth:4 lineGap:4
//                                                                         lineColor:[[UIColor blackColor] colorWithAlphaComponent:0.015]
//                                                                            rotate:M_PI_4];
//    [self.titleView addSubview:lineView];
//
//    // Title label.
//    UILabel *headlinelabel          = [UIView animationsListViewControllerNormalHeadLabel];
//    UILabel *animationHeadLineLabel = [UIView animationsListViewControllerHeadLabel];
//
//    // Title view.
//    UIView *titleView             = [[UIView alloc] initWithFrame:CGRectMake(0, iPhoneX ? UIView.additionaliPhoneXTopSafeHeight : 0, Width, 64)];
//    headlinelabel.center          = titleView.middlePoint;
//    animationHeadLineLabel.center = titleView.middlePoint;
//    [titleView addSubview:headlinelabel];
//    [titleView addSubview:animationHeadLineLabel];
//    [self.titleView addSubview:titleView];
//
//    UIView *line         = [[UIView alloc] initWithFrame:CGRectMake(0, titleView.height - 0.5, Width, 0.5f)];
//    line.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.25f];
//    [titleView addSubview:line];
//
//    // Start glow.
//    animationHeadLineLabel.glowRadius            = @(2.f);
//    animationHeadLineLabel.glowOpacity           = @(1.f);
//    animationHeadLineLabel.glowColor             = [[UIColor colorWithRed:0.203  green:0.598  blue:0.859 alpha:1] colorWithAlphaComponent:0.95f];
//
//    animationHeadLineLabel.glowDuration          = @(1.f);
//    animationHeadLineLabel.hideDuration          = @(3.f);
//    animationHeadLineLabel.glowAnimationDuration = @(2.f);
//
//    [animationHeadLineLabel createGlowLayer];
//    [animationHeadLineLabel insertGlowLayer];
//
//    [GCDQueue executeInMainQueue:^{
//
//        [animationHeadLineLabel startGlowLoop];
//
//    } afterDelaySecs:2.f];
}

#pragma mark - Config DataSource.

- (void)configureDataSource {
    
    NSArray *array = @[[FCItem itemWithObject:[FCLineLayoutViewController  class]  name:@"LineLayout"]];
    
    self.items = [NSMutableArray array];
    [array enumerateObjectsUsingBlock:^(FCItem *item, NSUInteger idx, BOOL *stop) {
        
        item.index = idx + 1;
        [self.items addObject:[FCAnimationListCell dataAdapterWithData:item]];
    }];
}

#pragma mark - TableView Related.

- (void)configureTableView {
    
    self.tableView = ({
        
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.contentView.bounds style:UITableViewStylePlain];
        tableView.delegate       = self;
        tableView.dataSource     = self;
        tableView.rowHeight      = 50.f;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.contentView addSubview:tableView];
        [FCAnimationListCell registerToTableView:tableView];
        tableView;
    });
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [tableView dequeueReusableCellAndLoadDataWithAdapter:_items[indexPath.row] delegate:self indexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView selectedEventAtIndexPath:indexPath];
}

#pragma mark - CustomCellDelegate.

- (void)customCell:(FCCustomCell *)cell event:(id)event {
    
    if ([cell isKindOfClass:[FCAnimationListCell class]]) {
        
        FCItem             *item        = event;
        UIViewController *controller  = [item.object new];
        controller.title              = item.name;
        [self.navigationController pushViewController:controller animated:YES];
    }
}

#pragma mark - Overwrite system methods.

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    self.enableInteractivePopGestureRecognizer = NO;
}

- (void)viewDidDisappear:(BOOL)animated {
    
    [super viewDidDisappear:animated];
    // self.enableInteractivePopGestureRecognizer = YES;
}


@end
