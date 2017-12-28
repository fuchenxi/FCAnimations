//
//  FCLoopViewTwoCell.m
//  FCAnimations
//
//  Created by fcx on 2017/12/28.
//  Copyright © 2017年 https://github.com/fuchenxi. All rights reserved.
//

#import "FCLoopViewTwoCell.h"
#import "FCImageTwoModel.h"

@interface FCLoopViewTwoCell ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *label;

@end

@implementation FCLoopViewTwoCell

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
    
    self.label = ({
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 0, 0)];
        label.font      = [UIFont fontWithName:@"GillSans-Italic" size:12.f];
        label.textColor = [UIColor redColor];
        [self addSubview:label];
        label;
    });
}

- (void)loadContent {
    
    FCImageTwoModel *model = (id)self.dataModel;
    self.label.text = model.title;
    [self.label sizeToFit];
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:[self.dataModel imageUrlString]] placeholderImage:[UIImage imageNamed:@"详情默认图"]];
}

- (void)contentOffset:(CGPoint)offset {
    
    self.imageView.y = offset.y * 0.85f;
}

- (void)willDisplay {
    
    self.label.alpha = 0.f;
    [UIView animateWithDuration:1.f delay:0.5f options:0 animations:^{
        
        self.label.x     = 10;
        self.label.alpha = 1;
        
    } completion:nil];
}

- (void)didEndDisplay {
    
    [self.label.layer removeAllAnimations];
    self.label.x = 0;
    self.label.y = 10;
}

@end
