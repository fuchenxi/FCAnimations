//
//  NSData+JsonData.h
//  FCAnimations
//
//  Created by fcx on 2017/12/29.
//  Copyright © 2017年 https://github.com/fuchenxi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (JsonData)

/**
 *  将JSON字符串转换为列表格式(字典或者数组)
 *
 *  @return 字典或者数组
 */
- (id)toListProperty;

@end
