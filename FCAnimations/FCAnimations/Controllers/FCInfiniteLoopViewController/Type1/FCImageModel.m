//
//  FCImageModel.m
//  FCAnimations
//
//  Created by fcx on 2017/12/28.
//  Copyright © 2017年 https://github.com/fuchenxi. All rights reserved.
//

#import "FCImageModel.h"

@implementation FCImageModel

+ (instancetype)imageModelWithImageUrl:(NSString *)url {
    
    FCImageModel *model = [[[self class] alloc] init];
    model.imageUrl    = url;
    
    return model;
}

#pragma mark - InfiniteLoopViewProtocol's method.

- (id)dataObject {
    
    return self;
}

- (NSString *)imageUrlString {
    
    return _imageUrl;
}

#pragma mark - InfiniteLoopCellClassProtocol's method.

- (NSString *)cellReuseIdentifier {
    
    return _infiniteLoopCellReuseIdentifier;
}

- (Class)cellClass {
    
    return _infiniteLoopCellClass;
}

@end
