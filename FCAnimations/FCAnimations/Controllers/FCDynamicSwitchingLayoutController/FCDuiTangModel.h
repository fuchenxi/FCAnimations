//
//  FCDuiTangModel.h
//  FCAnimations
//
//  Created by fcx on 2017/12/29.
//  Copyright © 2017年 https://github.com/fuchenxi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FCDuiTangModel : NSObject

@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSString *height;
@property (nonatomic, strong) NSString *width;

/**
 *  Init the model with dictionary
 *
 *  @param dictionary dictionary
 *
 *  @return model
 */
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
