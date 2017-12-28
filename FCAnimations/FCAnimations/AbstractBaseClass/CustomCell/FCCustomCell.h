//
//  FCCustomCell.h
//  FCAnimations
//
//  Created by fcx on 2017/12/27.
//  Copyright © 2017年 https://github.com/fuchenxi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FCCellDataAdapter.h"

@class FCCustomCell;

@protocol FCCustomCellDelegate <NSObject>

@optional

/**
 *  CustomCell's event.
 *
 *  @param cell  CustomCell type class.
 *  @param event Event data.
 */
- (void)customCell:(FCCustomCell *)cell event:(id)event;

@end


@interface FCCustomCell : UITableViewCell

#pragma mark - Propeties.

/**
 *  CustomCell's delegate.
 */
@property (nonatomic, weak) id <FCCustomCellDelegate> delegate;

/**
 *  CustomCell's dataAdapter.
 */
@property (nonatomic, weak) FCCellDataAdapter *dataAdapter;

/**
 *  CustomCell's data.
 */
@property (nonatomic, weak) id data;

/**
 *  CustomCell's indexPath.
 */
@property (nonatomic, weak) NSIndexPath *indexPath;

/**
 *  TableView.
 */
@property (nonatomic, weak) UITableView *tableView;

/**
 *  Controller.
 */
@property (nonatomic, weak) UIViewController *controller;

/**
 *  Cell is showed or not, you can set this property in UITableView's method 'tableView:willDisplayCell:forRowAtIndexPath:' & 'tableView:didEndDisplayingCell:forRowAtIndexPath:' at runtime.
 */
@property (nonatomic) BOOL display;

#pragma mark - Method you should overwrite.

/**
 *  Setup cell, overwrite by subclass.
 */
- (void)setupCell;

/**
 *  Build subview, overwrite by subclass.
 */
- (void)buildSubview;

/**
 *  Load content, overwrite by subclass.
 */
- (void)loadContent;

/**
 *  Calculate the cell's height from data, overwrite by subclass.
 *
 *  @param data Data.
 *
 *  @return Cell's height.
 */
+ (CGFloat)cellHeightWithData:(id)data;

#pragma mark - Useful method.

/**
 *  Update the cell's height with animated or not, before you use this method, you should have the weak reference 'tableView' and 'dataAdapter', and this method will update the weak reference dataAdapter's property cellHeight.
 *
 *  @param height   The new cell height.
 *  @param animated Animated or not.
 */
- (void)updateWithNewCellHeight:(CGFloat)height animated:(BOOL)animated;

/**
 *  Selected event, you should use this method in 'tableView:didSelectRowAtIndexPath:' to make it effective.
 */
- (void)selectedEvent;

/**
 *  Used for delegate event.
 */
- (void)delegateEvent;

#pragma mark - Constructor method.

/**
 *  Create the cell's dataAdapter.
 *
 *  @param reuseIdentifier Cell reuseIdentifier, can be nil.
 *  @param data            Cell's data, can be nil.
 *  @param height          Cell's height.
 *  @param type            Cell's type.
 *
 *  @return Cell's dataAdapter.
 */
+ (FCCellDataAdapter *)dataAdapterWithCellReuseIdentifier:(NSString *)reuseIdentifier
                                                     data:(id)data
                                               cellHeight:(CGFloat)height
                                                     type:(NSInteger)type;

/**
 *  Create the cell's dataAdapter.
 *
 *  @param reuseIdentifier Cell reuseIdentifier, can be nil.
 *  @param data            Cell's data, can be nil.
 *  @param height          Cell's height.
 *  @param cellWidth       Cell's width.
 *  @param type            Cell's type.
 *
 *  @return Cell's dataAdapter.
 */
+ (FCCellDataAdapter *)dataAdapterWithCellReuseIdentifier:(NSString *)reuseIdentifier
                                                     data:(id)data
                                               cellHeight:(CGFloat)height
                                                cellWidth:(CGFloat)cellWidth
                                                     type:(NSInteger)type;

/**
 *  Create the cell's dataAdapter, the CellReuseIdentifier is the cell's class string.
 *
 *  @param data            Cell's data, can be nil.
 *  @param height          Cell's height.
 *  @param type            Cell's type.
 *
 *  @return Cell's dataAdapter.
 */
+ (FCCellDataAdapter *)dataAdapterWithData:(id)data
                                cellHeight:(CGFloat)height
                                      type:(NSInteger)type;

/**
 *  Create the cell's dataAdapter, the CellReuseIdentifier is the cell's class string.
 *
 *  @param data            Cell's data, can be nil.
 *  @param height          Cell's height.
 *
 *  @return Cell's dataAdapter.
 */
+ (FCCellDataAdapter *)dataAdapterWithData:(id)data
                                cellHeight:(CGFloat)height;

/**
 *  Create the cell's dataAdapter, the CellReuseIdentifier is the cell's class string.
 *
 *  @param data            Cell's data, can be nil.
 *
 *  @return Cell's dataAdapter.
 */
+ (FCCellDataAdapter *)dataAdapterWithData:(id)data;

/**
 Create the cell's dataAdapter, the CellReuseIdentifier is the cell's class string.
 
 @param height Cell's height.
 @return Cell's dataAdapter.
 */
+ (FCCellDataAdapter *)dataAdapterWithCellHeight:(CGFloat)height;

/**
 [= Must over write class method 'cellHeightWithData:' to get the height =]
 
 Create the cell's dataAdapter, the CellReuseIdentifier is the cell's class string.
 
 @param reuseIdentifier Cell reuseIdentifier, can be nil.
 @param data Cell's data, can be nil.
 @param type Cell's type.
 @return Cell's dataAdapter.
 */
+ (FCCellDataAdapter *)fixedHeightTypeDataAdapterWithCellReuseIdentifier:(NSString *)reuseIdentifier
                                                                    data:(id)data
                                                                    type:(NSInteger)type;

/**
 [= Must over write class method 'cellHeightWithData:' to get the height =]
 
 Create the cell's dataAdapter, the CellReuseIdentifier is the cell's class string.
 
 @param data Cell's data, can be nil.
 @param type Cell's type.
 @return Cell's dataAdapter.
 */
+ (FCCellDataAdapter *)fixedHeightTypeDataAdapterWithData:(id)data
                                                     type:(NSInteger)type;

/**
 [= Must over write class method 'cellHeightWithData:' to get the height =]
 
 Create the cell's dataAdapter, the CellReuseIdentifier is the cell's class string.
 
 @param data Cell's data, can be nil.
 @return Cell's dataAdapter.
 */
+ (FCCellDataAdapter *)fixedHeightTypeDataAdapterWithData:(id)data;

/**
 [= Must over write class method 'cellHeightWithData:' to get the height =]
 
 Create the cell's dataAdapter, the CellReuseIdentifier is the cell's class string.
 @return Cell's dataAdapter.
 */
+ (FCCellDataAdapter *)fixedHeightTypeDataAdapter;

/**
 Create the layout type cell's dataAdapter, the CellReuseIdentifier is the cell's class string.
 
 @param reuseIdentifier Cell reuseIdentifier, can be nil.
 @param data Cell's data, can be nil.
 @param type Cell's type.
 @return Cell's dataAdapter.
 */
+ (FCCellDataAdapter *)layoutTypeAdapterWithCellReuseIdentifier:(NSString *)reuseIdentifier
                                                           data:(id)data
                                                           type:(NSInteger)type;

/**
 Create the layout type cell's dataAdapter.
 
 @param data Cell's data, can be nil.
 @param type Cell's type.
 @return Cell's dataAdapter.
 */
+ (FCCellDataAdapter *)layoutTypeAdapterWithData:(id)data
                                            type:(NSInteger)type;

/**
 Create the layout type cell's dataAdapter.
 
 @param data Cell's data, can be nil.
 @return Cell's dataAdapter.
 */
+ (FCCellDataAdapter *)layoutTypeAdapterWithData:(id)data;

/**
 Create the layout type cell's dataAdapter.
 
 @return Cell's dataAdapter.
 */
+ (FCCellDataAdapter *)layoutTypeAdapter;

#pragma mark - Load content.

/**
 Set the dataAdapter and load content.
 
 @param dataAdapter The CellDataAdapter.
 @param indexPath The indexPath.
 */
- (void)loadContentWithAdapter:(FCCellDataAdapter *)dataAdapter
                     indexPath:(NSIndexPath *)indexPath;

/**
 Set the dataAdapter and load content.
 
 @param dataAdapter The CellDataAdapter.
 */
- (void)loadContentWithAdapter:(FCCellDataAdapter *)dataAdapter;

/**
 Set the dataAdapter and load content.
 
 @param dataAdapter The CellDataAdapter.
 @param delegate The delegate
 @param indexPath The indexPath.
 */
- (void)loadContentWithAdapter:(FCCellDataAdapter *)dataAdapter
                      delegate:(id <FCCustomCellDelegate>)delegate
                     indexPath:(NSIndexPath *)indexPath;

/**
 Set the dataAdapter and load content.
 
 @param dataAdapter The CellDataAdapter.
 @param delegate The delegate.
 @param tableView The tableView.
 @param indexPath The indexPath.
 */
- (void)loadContentWithAdapter:(FCCellDataAdapter *)dataAdapter
                      delegate:(id <FCCustomCellDelegate>)delegate
                     tableView:(UITableView *)tableView
                     indexPath:(NSIndexPath *)indexPath;

#pragma mark - Register cell with tableView.

/**
 *  Register to tableView with the reuseIdentifier you specified.
 *
 *  @param tableView       TableView.
 *  @param reuseIdentifier The cell reuseIdentifier.
 */
+ (void)registerToTableView:(UITableView *)tableView
            reuseIdentifier:(NSString *)reuseIdentifier;

/**
 *  Register to tableView with the The class name.
 *
 *  @param tableView       TableView.
 */
+ (void)registerToTableView:(UITableView *)tableView;

@end

#pragma mark - UITableView category.

@interface UITableView (FCCustomCell)

- (FCCustomCell *)dequeueReusableCellAndLoadDataWithAdapter:(FCCellDataAdapter *)adapter indexPath:(NSIndexPath *)indexPath;

- (FCCustomCell *)dequeueReusableCellAndLoadDataWithAdapter:(FCCellDataAdapter *)adapter
                                                   delegate:(id <FCCustomCellDelegate>)delegate
                                                  indexPath:(NSIndexPath *)indexPath;

- (CGFloat)cellHeightWithAdapter:(FCCellDataAdapter *)adapter;

- (void)selectedEventAtIndexPath:(NSIndexPath *)indexPath;

@end
