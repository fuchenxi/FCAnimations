//
//  FCInfiniteLoopView.m
//  FCAnimations
//
//  Created by fcx on 2017/12/28.
//  Copyright © 2017年 https://github.com/fuchenxi. All rights reserved.
//

#import "FCInfiniteLoopView.h"

@interface FCInfiniteLoopView () <UICollectionViewDelegate, UICollectionViewDataSource>

@property(nonatomic, strong) UICollectionView *collectionView;
@property(nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
@property(nonatomic, strong) NSTimer *timer;
@property(nonatomic, assign) NSInteger currentPage;
@property(nonatomic, assign, getter = isAnimation) BOOL animation;

@end

@implementation FCInfiniteLoopView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.scrollTimeInterval = 4.0f;
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        self.flowLayout = ({
            
            UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
            flowLayout.itemSize = self.bounds.size;
            flowLayout.minimumInteritemSpacing = 0;
            flowLayout.minimumLineSpacing = 0;
            flowLayout;
        });
        
        self.collectionView = ({
            
            UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:self.flowLayout];
            collectionView.showsVerticalScrollIndicator = NO;
            collectionView.showsHorizontalScrollIndicator = NO;
            collectionView.pagingEnabled = YES;
            collectionView.backgroundColor = [UIColor clearColor];
            [self addSubview:collectionView];
            collectionView;
        });
    }
    return self;
}

- (void)prepare {
    
    NSParameterAssert(self.models);
    
    for (id <FCInfiniteLoopCellClassProtocol>cellInfo in self.models) {
        
        if (NO == [cellInfo.cellClass isSubclassOfClass:[FCInfiniteLoopViewCell class]]) {
            
            [NSException raise:@"FCInfiniteLoopView prepare error"
                        format:@"The cellClass must be the Subclass of FCInfiniteLoopViewCell"];
        }
    }
    
    for (id <FCInfiniteLoopCellClassProtocol>cellInfo in self.models) {
        
        [self.collectionView registerClass:cellInfo.cellClass forCellWithReuseIdentifier:cellInfo.cellReuseIdentifier];
    }
    self.flowLayout.scrollDirection = self.scrollDirection;
    self.collectionView.delegate    = self;
    self.collectionView.dataSource  = self;
    [self.collectionView reloadData];
    
    // Scroll to specified position.
    if (self.models.count) {
        
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:500]
                                    atScrollPosition:(self.flowLayout.scrollDirection == UICollectionViewScrollDirectionHorizontal ? UICollectionViewScrollPositionLeft : UICollectionViewScrollPositionTop)
                                            animated:NO];
    }
}

- (void)reset {
    
    [self stopLoopAnimation];
    self.models = nil;
}

- (void)startLoopAnimation {
    
    _animation = YES;
    [self setupTimer];
}

- (void)stopLoopAnimation {
    
    _animation = NO;
    [self invalidateTimer];
}

- (void)setupTimer {
    
    NSTimer *timer = [NSTimer timerWithTimeInterval:self.scrollTimeInterval target:self selector:@selector(action) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    self.timer = timer;
}

- (void)invalidateTimer {
    
    [self.timer invalidate];
    self.timer = nil;
}

- (void)action {
    
    if (self.models.count == 0) return;
    NSIndexPath *currentIndexPath = [[self.collectionView indexPathsForVisibleItems] lastObject];
    NSInteger newItem = (currentIndexPath.item + 1) % self.models.count;
    NSInteger newSection = currentIndexPath.section + (newItem == 0 ? 1 : 0);
    NSIndexPath *newIndexPath = [NSIndexPath indexPathForItem:newItem inSection:newSection];
    [self.collectionView scrollToItemAtIndexPath:newIndexPath
                                atScrollPosition:(self.scrollDirection == UICollectionViewScrollDirectionHorizontal ? UICollectionViewScrollPositionRight : UICollectionViewScrollPositionBottom)
                                        animated:YES];
}

#pragma mark -
#pragma mark - UICollectionView's DataSource & Delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 3000;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.models.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    FCInfiniteLoopViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[self.models[indexPath.item] cellReuseIdentifier] forIndexPath:indexPath];
    cell.indexPath = indexPath;
    cell.dataModel = self.models[indexPath.item];
    [cell loadContent];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(infiniteLoopView:data:selectedIndex:cell:)]) {
        
        [self.delegate infiniteLoopView:self
                                   data:self.models[indexPath.item]
                          selectedIndex:indexPath.item
                                   cell:(FCInfiniteLoopViewCell *)[collectionView cellForItemAtIndexPath:indexPath]];
    }
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(FCInfiniteLoopViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGPoint point = [cell convertPoint:cell.bounds.origin fromView:self];
    [cell contentOffset:point];
    [cell willDisplay];
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(FCInfiniteLoopViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [cell didEndDisplay];
}

#pragma mark -
#pragma mark - UIScrollView's Delegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    if (_animation) {
        
        [self invalidateTimer];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
    if (_animation) {
        
        [self setupTimer];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    [self.collectionView.visibleCells enumerateObjectsUsingBlock:^(__kindof FCInfiniteLoopViewCell * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        CGPoint point = [obj convertPoint:obj.bounds.origin fromView:self];
        [obj contentOffset:point];
    }];
    if (self.models.count == 0) return;
    
    NSInteger newValue = [self currentIndex] % self.models.count;
    
    if (_currentPage != newValue) {
        
        _currentPage = newValue;
        if (self.delegate && [self.delegate respondsToSelector:@selector(infiniteLoopView:didScrollCurrentPage:)]) {
            
            [self.delegate infiniteLoopView:self didScrollCurrentPage:_currentPage];
        }
    }
}

#pragma mark - Other.

- (NSInteger)currentIndex {
    
    NSInteger index = 0;
    
    if (_flowLayout.scrollDirection == UICollectionViewScrollDirectionHorizontal) {
        
        index = (_collectionView.contentOffset.x + _flowLayout.itemSize.width * 0.5) / _flowLayout.itemSize.width;
        
    } else {
        
        index = (_collectionView.contentOffset.y + _flowLayout.itemSize.height * 0.5) / _flowLayout.itemSize.height;
    }
    
    return index;
}

- (void)adjustWhenFreeze {
    
    long targetIndex = [self currentIndex];
    
    // Scroll to specified position.
    if (targetIndex < _models.count) {
        
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:targetIndex inSection:500]
                                    atScrollPosition:(self.flowLayout.scrollDirection == UICollectionViewScrollDirectionHorizontal ? UICollectionViewScrollPositionLeft : UICollectionViewScrollPositionTop)
                                            animated:NO];
    }
}
- (void)dealloc {
    
    
    NSLog(@"%@ dealloc", [self class]);
}

- (void)removeFromSuperview {
    
    [super removeFromSuperview];
    [self invalidateTimer];
}

@end
