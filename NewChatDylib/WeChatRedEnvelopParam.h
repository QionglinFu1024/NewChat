//
//  WeChatRedEnvelopParam.h
//  NewChatDylib
//
//  Created by Qionglin Fu on 2018/10/10.
//  Copyright © 2018年 Qionglin Fu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeChatRedEnvelopParam : NSObject

- (NSDictionary *)toParams;

@property (strong, nonatomic) NSString *msgType;
@property (strong, nonatomic) NSString *sendId;
@property (strong, nonatomic) NSString *channelId;
@property (strong, nonatomic) NSString *nickName;
@property (strong, nonatomic) NSString *headImg;
@property (strong, nonatomic) NSString *nativeUrl;
@property (strong, nonatomic) NSString *sessionUserName;
@property (strong, nonatomic) NSString *sign;
@property (strong, nonatomic) NSString *timingIdentifier;

@property (assign, nonatomic) BOOL isGroupSender;

@end
