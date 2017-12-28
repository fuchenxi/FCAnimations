//
//  FCImageModel.h
//  FCAnimations
//
//  Created by fcx on 2017/12/28.
//  Copyright © 2017年 https://github.com/fuchenxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FCInfiniteLoopViewProtocol.h"
#import "FCInfiniteLoopCellClassProtocol.h"

@interface FCImageModel : NSObject <FCInfiniteLoopViewProtocol, FCInfiniteLoopCellClassProtocol>

@property (nonatomic, strong) NSString *imageUrl;

+ (instancetype)imageModelWithImageUrl:(NSString *)url;

@property (nonatomic, strong) NSString *infiniteLoopCellReuseIdentifier;
@property (nonatomic)         Class     infiniteLoopCellClass;

@end
