//
//  FCDynamicSwitchingLayoutController.m
//  FCAnimations
//
//  Created by fcx on 2017/12/29.
//  Copyright © 2017年 https://github.com/fuchenxi. All rights reserved.
//

#import "FCDynamicSwitchingLayoutController.h"
#import "FCDynamicSwitchingCell.h"
#import "FCDuiTangModel.h"

static const CGFloat gap = 5.f;
static CGFloat itemCount = 3.f;

@interface FCDynamicSwitchingLayoutController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property(nonatomic, strong) UICollectionView *collectionView;

@property(nonatomic, strong) UICollectionViewFlowLayout *flowLayout;

@property(nonatomic, strong) NSMutableArray <FCDuiTangModel *>*models;

@property(nonatomic, strong) UIButton *changeBtn;

@end

@implementation FCDynamicSwitchingLayoutController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.models = [NSMutableArray array];
    NSArray *duitangPics = [[NSData dataWithContentsOfFile:[FCFileManager bundleFileWithName:@"duitang.json"]] toListProperty];
    [duitangPics enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [self.models addObject:[[FCDuiTangModel alloc] initWithDictionary:dict]];
    }];
    
    self.flowLayout = ({
        
        UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
        flowLayout.minimumLineSpacing      = gap;
        flowLayout.minimumInteritemSpacing = gap;
        flowLayout.itemSize                = [FCMath resetFromSize:CGSizeMake(100, 150.f) withFixedWidth:(Width - gap * (itemCount + 1)) / itemCount];
        flowLayout;
    });
    
    self.collectionView = ({
        
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.contentView.bounds collectionViewLayout:self.flowLayout];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.contentInset = UIEdgeInsetsMake(gap, gap, gap, gap);
        collectionView.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:collectionView];
        [FCDynamicSwitchingCell registerToCollectionView:collectionView];
        collectionView;
    });
    
}

- (void)setupSubViews {
    
    [super setupSubViews];
    
    self.changeBtn = ({
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200.f, NavigationBarHeight)];
        button.bottom  = self.titleView.height;
        [button setTitle:@"切换" forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont HeitiSCWithFontSize:16.f];
        [button setTitleColor:[UIColor colorWithRed:0.329  green:0.329  blue:0.329 alpha:1] forState:UIControlStateNormal];
        [button setTitleColor:[[UIColor colorWithRed:0.329  green:0.329  blue:0.329 alpha:1] colorWithAlphaComponent:0.5] forState:UIControlStateHighlighted];
        [button setTitleColor:[[UIColor colorWithRed:0.329  green:0.329  blue:0.329 alpha:1] colorWithAlphaComponent:0.5] forState:UIControlStateDisabled];
        button.right = Width;
        [self.titleView addSubview:button];
        [button addTarget:self action:@selector(changeEvent) forControlEvents:UIControlEventTouchUpInside];
        [button setContentEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 15.f)];
        [button setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
        [button setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
        button;
    });
}

- (void)changeEvent {
    
    // 布局失效
    [self.flowLayout invalidateLayout];
    
    // 初始化新的布局
    CGFloat randomValue = 0;
    while (1) {
        
        randomValue = arc4random() % 4 + 2.f;
        if (itemCount != randomValue) {
            
            itemCount = randomValue;
            break;
        }
    }
    
    self.flowLayout = [UICollectionViewFlowLayout new];
    self.flowLayout.minimumLineSpacing = gap;
    self.flowLayout.minimumInteritemSpacing = gap;
    self.flowLayout.itemSize = [FCMath resetFromSize:CGSizeMake(100, 150.f) withFixedWidth:(Width - gap * (itemCount + 1.f)) / itemCount];
    
    // 切换布局的动画
    __weak UIButton *weakButton = self.changeBtn;
    weakButton.enabled = NO;
    [self.collectionView setCollectionViewLayout:self.flowLayout animated:YES completion:^(BOOL finished) {
        
        weakButton.enabled = YES;
    }];
}

#pragma mark - UICollectionViewDataSource, UICollectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.models.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    FCDynamicSwitchingCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FCDynamicSwitchingCell" forIndexPath:indexPath];
    cell.data = self.models[indexPath.row];
    cell.indexPath = indexPath;
    [cell loadContent];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"%@", self.models[indexPath.row]);
}

@end
