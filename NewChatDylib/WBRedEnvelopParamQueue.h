//
//  WBRedEnvelopParamQueue.h
//  NewChatDylib
//
//  Created by Qionglin Fu on 2018/10/10.
//  Copyright © 2018年 Qionglin Fu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WeChatRedEnvelopParam;
@interface WBRedEnvelopParamQueue : NSObject

+ (instancetype)sharedQueue;

- (void)enqueue:(WeChatRedEnvelopParam *)param;
- (WeChatRedEnvelopParam *)dequeue;
- (WeChatRedEnvelopParam *)peek;
- (BOOL)isEmpty;

@end
