//
//  FCLineLayout.m
//  FCAnimations
//
//  Created by fcx on 2017/12/28.
//  Copyright © 2017年 https://github.com/fuchenxi. All rights reserved.
//

#import "FCLineLayout.h"

@interface FCLineLayout (){
    
    CGFloat  _itemWidth;
    CGFloat  _itemHeight;
    CGSize   _contentSize;
    
    NSArray <UICollectionViewLayoutAttributes *> *_attributes;
}

@end

@implementation FCLineLayout

- (void)prepareLayout {
    
    [super prepareLayout];
    
    CGSize collectionViewSize = self.collectionView.bounds.size;
    UIEdgeInsets contentInset = self.collectionView.contentInset;
    _itemWidth = collectionViewSize.width - (contentInset.left + contentInset.right);
    _itemHeight = collectionViewSize.height - (contentInset.top + contentInset.bottom);
    NSInteger numberOfSections = [self.collectionView numberOfSections];
    CGFloat offsetX = 0.f;
    NSMutableArray *array = [NSMutableArray array];
    
    for (int i = 0; i < numberOfSections; i++) {
        
        NSInteger numberOfRows = [self.collectionView numberOfItemsInSection:i];
        
        for (int j = 0; j < numberOfRows; j++) {
            
            UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:j inSection:i]];
            attributes.frame = CGRectMake(offsetX, 0, _itemWidth, _itemHeight);
            offsetX += _itemWidth;
            [array addObject:attributes];
        }
    }
    
    _contentSize = CGSizeMake(offsetX, _itemHeight);
    _attributes = array.copy;
}

- (CGSize)collectionViewContentSize {
    
    return _contentSize;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    return attributes;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    NSMutableArray *array = [NSMutableArray array];
    [_attributes enumerateObjectsUsingBlock:^(UICollectionViewLayoutAttributes * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (CGRectIntersectsRect(rect, obj.frame)) {
            [array addObject:obj];
        }
    }];
    return array;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    
    return YES;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    
    UIEdgeInsets insets = self.collectionView.contentInset;
    CGFloat offsetX = proposedContentOffset.x + insets.left;
    
    CGFloat resultInOffsetX = round(offsetX / _itemWidth) * _itemWidth - insets.left;
    return CGPointMake(resultInOffsetX, proposedContentOffset.y);
}

@end
