//
//  WBBaseViewController.h
//  NewChatDylib
//
//  Created by Qionglin Fu on 2018/10/10.
//  Copyright © 2018年 Qionglin Fu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WBBaseViewController : UIViewController

- (void)startLoadingBlocked;
- (void)startLoadingNonBlock;
- (void)startLoadingWithText:(NSString *)text;
- (void)stopLoading;
- (void)stopLoadingWithFailText:(NSString *)text;
- (void)stopLoadingWithOKText:(NSString *)text;

@end
