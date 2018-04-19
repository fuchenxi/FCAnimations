//
//  FCLoopViewCell.m
//  FCAnimations
//
//  Created by fcx on 2017/12/28.
//  Copyright © 2017年 https://github.com/fuchenxi. All rights reserved.
//

#import "FCLoopViewCell.h"

@interface FCLoopViewCell ()

@property(nonatomic, strong) UIImageView *imageView;

@end

@implementation FCLoopViewCell

- (void)setupCollectionViewCell {
    
    self.layer.masksToBounds = YES;
}

- (void)buildSubView {
    
    self.imageView = ({
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        imageView.image    = [UIImage imageNamed:@"详情默认图"];
        [self addSubview:imageView];
        imageView;
    });
}

- (void)loadContent {
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:[self.dataModel imageUrlString]] placeholderImage:[UIImage imageNamed:@"详情默认图"]];
}

- (void)contentOffset:(CGPoint)offset {

    if (offset.x >= 0.f) {
        self.imageView.x = offset.x * 0.5f;
    } else {
        self.imageView.x = 0;
    }
}

@end
