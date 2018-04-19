//
//  FCDynamicSwitchingCell.m
//  FCAnimations
//
//  Created by fcx on 2017/12/29.
//  Copyright © 2017年 https://github.com/fuchenxi. All rights reserved.
//

#import "FCDynamicSwitchingCell.h"
#import "FCDuiTangModel.h"

@interface FCDynamicSwitchingCell ()

@property(nonatomic, strong) UIImageView *imgView;

@end

@implementation FCDynamicSwitchingCell

- (void)buildSubview {
    
    self.imgView = ({
        
        UIImageView *imgView = [[UIImageView alloc] init];
        imgView.image = [UIImage imageNamed:@"详情默认图-小"];
        [self.contentView addSubview:imgView];
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.edges.equalTo(self.contentView);
        }];
        imgView;
    });
}

- (void)loadContent {
    
    FCDuiTangModel *model       = self.data;
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:model.img] placeholderImage:[UIImage imageNamed:@"详情默认图-小"]];
}

- (void)willTransitionFromLayout:(UICollectionViewLayout *)oldLayout toLayout:(UICollectionViewLayout *)newLayout {
    
    NSLog(@"willTransitionFromLayout - %ld", self.indexPath.row);
}

- (void)didTransitionFromLayout:(UICollectionViewLayout *)oldLayout toLayout:(UICollectionViewLayout *)newLayout {
    
    NSLog(@"didTransitionFromLayout - %ld", self.indexPath.row);
}

@end
