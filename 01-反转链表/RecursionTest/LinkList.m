//
//  LinkList.m
//  RecursionTest
//
//  Created by jdy on 2020/11/17.
//

#import "LinkList.h"

//static const int ELEMENT_NOT_FOUND = -1;

@interface Node<E> ()
@property (nonatomic) E element;
@end

@implementation Node

- (instancetype)initNodeWith:(nullable Node *)next
                     Element:(id)element {
    self = [super init];
    self.next = next;
    self.element = element;
    
    return self;
}

@end

@interface LinkList<E> ()
@property (nonatomic, assign) int size;
@property (nonatomic) Node<E> *first;

@end

@implementation LinkList

- (instancetype)init {
    self = [super init];
    
    self.first = NULL;
    self.size = 0;
    
    return self;
}

- (void)addElement:(id)element {
    [self addElement:element With:self.size];
}

- (void)addElement:(id)element With:(int)index {
    Node *node = [[Node alloc] initNodeWith:NULL Element:element];
    if (self.size == 0) {
        self.first = node;
    } else {
        [self node:(index -1)].next = node;
    }
    self.size = self.size + 1;
}

- (Node *)node:(int)index {
    if (![self rangeCheck:index]) {
        return NULL;
    }
    Node *node = self.first;
    for (int i = 0; i < index; i++) {
        node = node.next;
    }
    return node;
}

- (BOOL)rangeCheck:(int)index {
    if (index < 0 || index >= self.size) {
        return false;
    } else {
        return true;
    }
}

- (NSString *)description
{
    if (self.size == 0) {
        return @"0 element";
    }
    NSMutableString *str = [[NSMutableString alloc] init];
    for (int i = 0; i < self.size; i++) {
        Node *node = [self node:i];
        [str appendString:[NSString stringWithFormat:@"%@,",node.element]];
    }
    return str;
}

@end
