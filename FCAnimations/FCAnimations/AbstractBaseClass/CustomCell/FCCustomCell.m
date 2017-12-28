//
//  FCCustomCell.m
//  FCAnimations
//
//  Created by fcx on 2017/12/27.
//  Copyright © 2017年 https://github.com/fuchenxi. All rights reserved.
//

#import "FCCustomCell.h"

@implementation FCCustomCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self setupCell];
        
        [self buildSubview];
    }
    
    return self;
}

- (void)setupCell {
    
}

- (void)buildSubview {
    
}

- (void)loadContent {
    
}

- (void)selectedEvent {
    
    [self delegateEvent];
}

- (void)delegateEvent {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(customCell:event:)]) {
        
        [self.delegate customCell:self event:self.data];
    }
}

+ (CGFloat)cellHeightWithData:(id)data {
    
    return 0.f;
}

- (void)loadContentWithAdapter:(FCCellDataAdapter *)dataAdapter {
    
    _dataAdapter = dataAdapter;
    _data        = dataAdapter.data;
    [self loadContent];
}

- (void)loadContentWithAdapter:(FCCellDataAdapter *)dataAdapter
                     indexPath:(NSIndexPath *)indexPath {
    
    _dataAdapter = dataAdapter;
    _data        = dataAdapter.data;
    _indexPath   = indexPath;
    [self loadContent];
}

- (void)loadContentWithAdapter:(FCCellDataAdapter *)dataAdapter
                      delegate:(id <FCCustomCellDelegate>)delegate
                     indexPath:(NSIndexPath *)indexPath {
    
    _dataAdapter = dataAdapter;
    _data        = dataAdapter.data;
    _indexPath   = indexPath;
    _delegate    = delegate;
    [self loadContent];
}

- (void)loadContentWithAdapter:(FCCellDataAdapter *)dataAdapter
                      delegate:(id <FCCustomCellDelegate>)delegate
                     tableView:(UITableView *)tableView
                     indexPath:(NSIndexPath *)indexPath {
    
    _dataAdapter = dataAdapter;
    _data        = dataAdapter.data;
    _indexPath   = indexPath;
    _delegate    = delegate;
    _tableView   = tableView;
    [self loadContent];
}

#pragma mark - Normal type adapter.

+ (FCCellDataAdapter *)dataAdapterWithCellReuseIdentifier:(NSString *)reuseIdentifier
                                                   data:(id)data
                                             cellHeight:(CGFloat)height
                                                   type:(NSInteger)type {
    
    NSString *tmpReuseIdentifier = reuseIdentifier.length <= 0 ? NSStringFromClass([self class]) : reuseIdentifier;
    return [FCCellDataAdapter cellDataAdapterWithCellReuseIdentifier:tmpReuseIdentifier data:data cellHeight:height cellType:type];
}

+ (FCCellDataAdapter *)dataAdapterWithCellReuseIdentifier:(NSString *)reuseIdentifier
                                                   data:(id)data
                                             cellHeight:(CGFloat)height
                                              cellWidth:(CGFloat)cellWidth
                                                   type:(NSInteger)type {
    
    NSString *tmpReuseIdentifier = reuseIdentifier.length <= 0 ? NSStringFromClass([self class]) : reuseIdentifier;
    return [FCCellDataAdapter cellDataAdapterWithCellReuseIdentifier:tmpReuseIdentifier data:data cellHeight:height cellWidth:cellWidth cellType:type];
}

+ (FCCellDataAdapter *)dataAdapterWithData:(id)data cellHeight:(CGFloat)height type:(NSInteger)type {
    
    return [[self class] dataAdapterWithCellReuseIdentifier:nil data:data cellHeight:height type:type];
}

+ (FCCellDataAdapter *)dataAdapterWithData:(id)data cellHeight:(CGFloat)height {
    
    return [[self class] dataAdapterWithCellReuseIdentifier:nil data:data cellHeight:height type:0];
}

+ (FCCellDataAdapter *)dataAdapterWithData:(id)data {
    
    return [[self class] dataAdapterWithCellReuseIdentifier:nil data:data cellHeight:0 type:0];
}

+ (FCCellDataAdapter *)dataAdapterWithCellHeight:(CGFloat)height {
    
    return [[self class] dataAdapterWithCellReuseIdentifier:nil data:nil cellHeight:height type:0];
}

+ (FCCellDataAdapter *)fixedHeightTypeDataAdapterWithCellReuseIdentifier:(NSString *)reuseIdentifier
                                                                  data:(id)data
                                                                  type:(NSInteger)type {
    
    NSString *tmpReuseIdentifier = reuseIdentifier.length <= 0 ? NSStringFromClass([self class]) : reuseIdentifier;
    return [FCCellDataAdapter cellDataAdapterWithCellReuseIdentifier:tmpReuseIdentifier
                                                                data:data
                                                          cellHeight:[[self class] cellHeightWithData:data]
                                                            cellType:type];
}

+ (FCCellDataAdapter *)fixedHeightTypeDataAdapterWithData:(id)data type:(NSInteger)type {
    
    return [FCCellDataAdapter cellDataAdapterWithCellReuseIdentifier:NSStringFromClass([self class])
                                                                data:data
                                                          cellHeight:[[self class] cellHeightWithData:data]
                                                            cellType:type];
}

+ (FCCellDataAdapter *)fixedHeightTypeDataAdapterWithData:(id)data {
    
    return [FCCellDataAdapter cellDataAdapterWithCellReuseIdentifier:NSStringFromClass([self class])
                                                                data:data
                                                          cellHeight:[[self class] cellHeightWithData:data]
                                                            cellType:0];
}

+ (FCCellDataAdapter *)fixedHeightTypeDataAdapter {
    
    return [FCCellDataAdapter cellDataAdapterWithCellReuseIdentifier:NSStringFromClass([self class])
                                                                data:nil
                                                          cellHeight:[[self class] cellHeightWithData:nil]
                                                            cellType:0];
}

#pragma mark - Layout type adapter.

+ (FCCellDataAdapter *)layoutTypeAdapterWithCellReuseIdentifier:(NSString *)reuseIdentifier data:(id)data type:(NSInteger)type {
    
    return [[self class] dataAdapterWithCellReuseIdentifier:reuseIdentifier data:data cellHeight:UITableViewAutomaticDimension type:type];
}

+ (FCCellDataAdapter *)layoutTypeAdapterWithData:(id)data type:(NSInteger)type {
    
    return [[self class] dataAdapterWithCellReuseIdentifier:nil data:data cellHeight:UITableViewAutomaticDimension type:type];
}

+ (FCCellDataAdapter *)layoutTypeAdapterWithData:(id)data {
    
    return [[self class] dataAdapterWithCellReuseIdentifier:nil data:data cellHeight:UITableViewAutomaticDimension type:0];
}

+ (FCCellDataAdapter *)layoutTypeAdapter {
    
    return [[self class] dataAdapterWithCellReuseIdentifier:nil data:nil cellHeight:UITableViewAutomaticDimension type:0];
}

#pragma mark -

- (void)updateWithNewCellHeight:(CGFloat)height animated:(BOOL)animated {
    
    if (_tableView && _dataAdapter) {
        
        if (animated) {
            
            _dataAdapter.cellHeight = height;
            [_tableView beginUpdates];
            [_tableView endUpdates];
            
        } else {
            
            _dataAdapter.cellHeight = height;
            [_tableView reloadData];
        }
    }
}

+ (void)registerToTableView:(UITableView *)tableView reuseIdentifier:(NSString *)reuseIdentifier {
    
    [tableView registerClass:[self class] forCellReuseIdentifier:reuseIdentifier];
}

+ (void)registerToTableView:(UITableView *)tableView {
    
    [tableView registerClass:[self class] forCellReuseIdentifier:NSStringFromClass([self class])];
}

@end

@implementation UITableView (FCCustomCell)

- (FCCustomCell *)dequeueReusableCellAndLoadDataWithAdapter:(FCCellDataAdapter *)adapter indexPath:(NSIndexPath *)indexPath {
    
    FCCustomCell *cell = [self dequeueReusableCellWithIdentifier:adapter.cellReuseIdentifier forIndexPath:indexPath];
    [cell loadContentWithAdapter:adapter delegate:nil tableView:self indexPath:indexPath];
    
    return cell;
}

- (FCCustomCell *)dequeueReusableCellAndLoadDataWithAdapter:(FCCellDataAdapter *)adapter
                                                 delegate:(id <FCCustomCellDelegate>)delegate
                                                indexPath:(NSIndexPath *)indexPath {
    
    FCCustomCell *cell = [self dequeueReusableCellWithIdentifier:adapter.cellReuseIdentifier forIndexPath:indexPath];
    [cell loadContentWithAdapter:adapter delegate:delegate tableView:self indexPath:indexPath];
    
    return cell;
}

- (CGFloat)cellHeightWithAdapter:(FCCellDataAdapter *)adapter {
    
    return adapter.cellHeight;
}

- (void)selectedEventAtIndexPath:(NSIndexPath *)indexPath {
    
    FCCustomCell *cell = [self cellForRowAtIndexPath:indexPath];
    if ([cell isKindOfClass:[FCCustomCell class]]) {
        
        [cell selectedEvent];
    }
}

@end
