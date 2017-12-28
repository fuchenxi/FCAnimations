//
//  FCCellDataAdapter.m
//  FCAnimations
//
//  Created by fcx on 2017/12/27.
//  Copyright © 2017年 https://github.com/fuchenxi. All rights reserved.
//

#import "FCCellDataAdapter.h"

@implementation FCCellDataAdapter

+ (FCCellDataAdapter *)cellDataAdapterWithCellReuseIdentifier:(NSString *)cellReuseIdentifiers
                                                         data:(id)data
                                                   cellHeight:(CGFloat)cellHeight
                                                     cellType:(NSInteger)cellType {
    
    FCCellDataAdapter *adapter    = [[self class] new];
    adapter.cellReuseIdentifier = cellReuseIdentifiers;
    adapter.data                = data;
    adapter.cellHeight          = cellHeight;
    adapter.cellType            = cellType;
    
    return adapter;
}

+ (FCCellDataAdapter *)cellDataAdapterWithCellReuseIdentifier:(NSString *)cellReuseIdentifiers
                                                         data:(id)data
                                                   cellHeight:(CGFloat)cellHeight
                                                    cellWidth:(CGFloat)cellWidth
                                                     cellType:(NSInteger)cellType {
    
    FCCellDataAdapter *adapter    = [[self class] new];
    adapter.cellReuseIdentifier = cellReuseIdentifiers;
    adapter.data                = data;
    adapter.cellHeight          = cellHeight;
    adapter.cellWidth           = cellWidth;
    adapter.cellType            = cellType;
    
    return adapter;
}

+ (FCCellDataAdapter *)collectionCellDataAdapterWithCellReuseIdentifier:(NSString *)cellReuseIdentifiers
                                                                   data:(id)data
                                                               cellType:(NSInteger)cellType {
    
    FCCellDataAdapter *adapter    = [[self class] new];
    adapter.cellReuseIdentifier = cellReuseIdentifiers;
    adapter.data                = data;
    adapter.cellType            = cellType;
    
    return adapter;
}

@end
