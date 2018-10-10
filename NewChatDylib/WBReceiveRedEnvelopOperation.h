//
//  WBReceiveRedEnvelopOperation.h
//  NewChatDylib
//
//  Created by Qionglin Fu on 2018/10/10.
//  Copyright © 2018年 Qionglin Fu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WeChatRedEnvelopParam;
@interface WBReceiveRedEnvelopOperation : NSOperation

- (instancetype)initWithRedEnvelopParam:(WeChatRedEnvelopParam *)param delay:(unsigned int)delaySeconds;

@end
