//
//  PYMakeTextSecretLabel.m
//  打码Demo
//
//  Created by Snake on 16/7/14.
//  Copyright © 2016年 IAsk. All rights reserved.
//

#import "PYMakeTextSecretLabel.h"

@implementation PYMakeTextSecretLabel

// !< 为了能接收到事件（能成为第一响应者）
- (BOOL)canBecomeFirstResponder {
    return YES;
}

//"反馈"关心的功能
-(BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    return (action == @selector(copy:));
}
//针对于copy的实现
-(void)copy:(id)sender{
    UIPasteboard *pboard = [UIPasteboard pasteboardWithName:@"dama" create:YES];
    pboard.string = self.text;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
