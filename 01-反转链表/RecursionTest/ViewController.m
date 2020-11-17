//
//  ViewController.m
//  RecursionTest
//
//  Created by jdy on 2020/11/17.
//

#import "ViewController.h"
#import "LinkList.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LinkList *list = [[LinkList alloc] init];
    [list addElement:@0];
    [list addElement:@1];
    [list addElement:@2];
    [list addElement:@3];
    [list addElement:@4];
    [list addElement:@5];
    [list addElement:@6];
    NSLog(@"%@", list);
    
    // 递归
    Node *newNode = [self reverseList:[list node:0]];
    NSMutableString *str = [[NSMutableString alloc] init];
    [str appendString:[NSString stringWithFormat:@"%@,",newNode.element]];
    Node *node = newNode;
    for (int i = 0; i < list.size; i++) {
        node = node.next;
        if (node == NULL) {
            NSLog(@"%@", str);
            return;
        }
        [str appendString:[NSString stringWithFormat:@"%@,",node.element]];
    }
    
//    // 非递归
//    Node *newHead = [self reverseList2:[list node:0]];
//    NSMutableString *str = [[NSMutableString alloc] init];
//    [str appendString:[NSString stringWithFormat:@"%@," ,newHead.element]];
//    Node *node = newHead;
//    for (int i = 0; i < list.size; i++) {
//        node = node.next;
//        if (node == NULL) {
//            NSLog(@"%@", str);
//            return;
//        }
//        [str appendString:[NSString stringWithFormat:@"%@,",node.element]];
//    }
}

// 递归
- (Node *)reverseList:(Node *)node {
    if (node == NULL || node.next == NULL) {
        return node;
    }
    Node *newNode = [self reverseList:node.next];
    node.next.next = node;
    node.next = NULL;
    return newNode;
}

// 非递归
- (Node *)reverseList2:(Node *)head {
    if (head == NULL || head.next == NULL) {
        return head;
    }
    Node *newHead = NULL;
    while (head != NULL) {
        Node *tmp = head.next;
        head.next = newHead;
        newHead = head;
        head = tmp;
    }
    return newHead;
}

@end
