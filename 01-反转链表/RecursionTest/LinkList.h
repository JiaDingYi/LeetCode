//
//  LinkList.h
//  RecursionTest
//
//  Created by jdy on 2020/11/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Node<E> : NSObject
@property (nonatomic, readonly) E element;
@property (nonatomic, nullable) Node<E>* next;

- (instancetype)initNodeWith:(nullable Node<E> *)next
                     Element:(E)element;
@end

@interface LinkList<E> : NSObject
@property (nonatomic, assign, readonly) int size;
@property (nonatomic, readonly) Node<E> *first;

- (void)addElement:(E)element;

- (Node *)node:(int)index;
@end

NS_ASSUME_NONNULL_END
