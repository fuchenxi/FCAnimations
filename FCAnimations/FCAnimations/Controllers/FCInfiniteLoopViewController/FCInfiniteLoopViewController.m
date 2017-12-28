//
//  FCInfiniteLoopViewController.m
//  FCAnimations
//
//  Created by fcx on 2017/12/28.
//  Copyright © 2017年 https://github.com/fuchenxi. All rights reserved.
//

#import "FCInfiniteLoopViewController.h"

#import "FCInfiniteLoopViewBuilder.h"

#import "FCLoopViewCell.h"
#import "FCCircleNodeView.h"
#import "FCImageModel.h"

#import "FCLoopViewTwoCell.h"
#import "FCRectNodeView.h"
#import "FCImageTwoModel.h"

@interface FCInfiniteLoopViewController () <FCInfiniteLoopViewBuilderDelegate>

@property(nonatomic, strong) FCInfiniteLoopViewBuilder *oneLoopView;
@property(nonatomic, strong) FCInfiniteLoopViewBuilder *twoLoopView;

@end

@implementation FCInfiniteLoopViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    {
        NSArray *strings = @[@"http://img.wdjimg.com/image/video/d999011124c9ed55c2dd74e0ccee36ea_0_0.jpeg",
                             @"http://img.wdjimg.com/image/video/2ddcad6dcc38c5ca88614b7c5543199a_0_0.jpeg",
                             @"http://img.wdjimg.com/image/video/6d6ccfd79ee1deac2585150f40915c09_0_0.jpeg",
                             @"http://img.wdjimg.com/image/video/2111a863ea34825012b0c5c9dec71843_0_0.jpeg",
                             @"http://img.wdjimg.com/image/video/b4085a983cedd8a8b1e83ba2bd8ecdd8_0_0.jpeg",
                             @"http://img.wdjimg.com/image/video/2d59165e816151350a2b683b656a270a_0_0.jpeg",
                             @"http://img.wdjimg.com/image/video/dc2009ee59998039f795fbc7ac2f831f_0_0.jpeg"];
        
        NSMutableArray *models = [NSMutableArray array];
        for (int i = 0; i < strings.count; i++) {
            
            FCImageModel *model                     = [FCImageModel imageModelWithImageUrl:strings[i]];
            model.infiniteLoopCellClass           = [FCLoopViewCell class];
            model.infiniteLoopCellReuseIdentifier = [NSString stringWithFormat:@"FCImageModel_%d", i];
            [models addObject:model];
        }
        
        self.oneLoopView = ({
            
            FCInfiniteLoopViewBuilder *loopView = [[FCInfiniteLoopViewBuilder alloc] initWithFrame:CGRectMake(0, 0, Width, self.contentView.height / 2.f)];
            loopView.nodeViewTemplate = [FCCircleNodeView new];
            loopView.scrollTimeInterval = 2.5;
            loopView.sampleNodeViewSize = CGSizeMake(8, 6);
            loopView.position = kNodeViewBottomRight;
            loopView.edgeInsets = UIEdgeInsetsMake(0, 0, 7, 5);
            loopView.delegate = self;
            loopView.models = (NSArray <FCInfiniteLoopViewProtocol, FCInfiniteLoopCellClassProtocol> *)models;
            [loopView startLoopAnimated:YES];
            [self.contentView addSubview:loopView];
            loopView;
        });
    }
    
    {
        NSArray *strings = @[@"http://img.wdjimg.com/image/video/b8ff75ba333183e0fa92efc4a52ffda0_0_0.jpeg",
                             @"http://img.wdjimg.com/image/video/d160e33391a555127be999d1d6273a17_0_0.jpeg",
                             @"http://img.wdjimg.com/image/video/b8ff75ba333183e0fa92efc4a52ffda0_0_0.jpeg",
                             @"http://img.wdjimg.com/image/video/735e73eb85a47b5f2a661aa02ad1fed2_0_0.jpeg"];
        
        NSArray *titles  = @[@"We call a custom helper",
                             @"The animation collection",
                             @"iOS design pattern",
                             @"A weather app"];
        
        NSMutableArray *models = [NSMutableArray array];
        for (int i = 0; i < strings.count; i++) {
            
            FCImageTwoModel *model = [FCImageTwoModel infiniteLoopModelWithImageUrl:strings[i] title:titles[i]];
            model.infiniteLoopCellClass           = [FCLoopViewTwoCell class];
            model.infiniteLoopCellReuseIdentifier = [NSString stringWithFormat:@"FCLoopViewTwoCell_%d", i];
            [models addObject:model];
        }
        
        self.twoLoopView = ({
            
            FCInfiniteLoopViewBuilder *loopView = [[FCInfiniteLoopViewBuilder alloc] initWithFrame:CGRectMake(0, self.contentView.height / 2.f, Width, self.contentView.height / 2.f)];
            loopView.nodeViewTemplate = [FCRectNodeView new];
            loopView.sampleNodeViewSize = CGSizeMake(8, 20);
            loopView.position           = kNodeViewRightBottom;
            loopView.scrollTimeInterval = 2;
            loopView.edgeInsets         = UIEdgeInsetsMake(0, 0, 2, 2);
            loopView.scrollDirection = UICollectionViewScrollDirectionVertical;
            
            loopView.delegate = self;
            loopView.models = (NSArray <FCInfiniteLoopViewProtocol, FCInfiniteLoopCellClassProtocol> *)models;
            [loopView startLoopAnimated:YES];
            [self.contentView addSubview:loopView];
            loopView;
        });
    }
}

- (void)infiniteLoopViewBuilder:(FCInfiniteLoopViewBuilder *)infiniteLoopViewBuilder didScrollCurrentPage:(NSInteger)index {
    
    NSLog(@"currentPage:%ld", (long)index);
}

- (void)infiniteLoopViewBuilder:(FCInfiniteLoopViewBuilder *)infiniteLoopViewBuilder data:(id<FCInfiniteLoopViewProtocol>)data selectedIndex:(NSInteger)index cell:(FCInfiniteLoopViewCell *)cell {
    
    NSLog(@"index:%ld - %@ %@", (long)index, data, cell);
}

@end
