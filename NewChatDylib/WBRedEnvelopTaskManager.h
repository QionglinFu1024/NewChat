//
//  WBRedEnvelopTaskManager.h
//  NewChatDylib
//
//  Created by Qionglin Fu on 2018/10/10.
//  Copyright © 2018年 Qionglin Fu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WBReceiveRedEnvelopOperation;
@interface WBRedEnvelopTaskManager : NSObject

+ (instancetype)sharedManager;

- (void)addNormalTask:(WBReceiveRedEnvelopOperation *)task;
- (void)addSerialTask:(WBReceiveRedEnvelopOperation *)task;

- (BOOL)serialQueueIsEmpty;

@end
