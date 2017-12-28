//
//  FCAnimationListCell.m
//  FCAnimations
//
//  Created by fcx on 2017/12/27.
//  Copyright © 2017年 https://github.com/fuchenxi. All rights reserved.
//

#import "FCAnimationListCell.h"
#import "FCItem.h"

@interface FCAnimationListCell ()

@property (nonatomic, strong) UILabel  *titlelabel;
@property (nonatomic, strong) UILabel  *subTitleLabel;

@end

@implementation FCAnimationListCell

- (void)setupCell {
    
    self.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)buildSubview {
    
    self.titlelabel = ({
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 8, 290, 25)];
        [self.contentView addSubview:label];
        label;
    });
    
    self.subTitleLabel = ({
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 35, 290, 10)];
        label.font      = [UIFont systemFontOfSize:8.f];
        label.textColor = [UIColor grayColor];
        [self.contentView addSubview:label];
        label;
    });
}

- (void)loadContent {
    
    if (self.dataAdapter.data) {
        
        FCItem *item                     = self.dataAdapter.data;
        self.titlelabel.text = [NSString stringWithFormat:@"%zd. %@", self.indexPath.row, item.name];
//        self.titlelabel.attributedText = item.nameString;
        self.subTitleLabel.text        = [NSString stringWithFormat:@"%@", [item.object class]];
    }
    
    if (self.indexPath.row % 2) {
        
        self.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.05f];
        
    } else {
        
        self.backgroundColor = [UIColor whiteColor];
    }
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    
    [super setHighlighted:highlighted animated:animated];
    
    if (self.highlighted) {
        
//        POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewScaleXY];
//        scaleAnimation.duration           = 0.1f;
//        scaleAnimation.toValue            = [NSValue valueWithCGPoint:CGPointMake(0.95, 0.95)];
//        [self.titlelabel pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
        
    } else {
        
//        POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
//        scaleAnimation.toValue             = [NSValue valueWithCGPoint:CGPointMake(1, 1)];
//        scaleAnimation.velocity            = [NSValue valueWithCGPoint:CGPointMake(2, 2)];
//        scaleAnimation.springBounciness    = 20.f;
//        [self.titlelabel pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
    }
}

@end
