//
//  WBMultiSelectGroupsViewController.h
//  NewChatDylib
//
//  Created by Qionglin Fu on 2018/10/10.
//  Copyright © 2018年 Qionglin Fu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MultiSelectGroupsViewControllerDelegate <NSObject>
- (void)onMultiSelectGroupReturn:(NSArray *)arg1;

@optional
- (void)onMultiSelectGroupCancel;
@end

@interface WBMultiSelectGroupsViewController : UIViewController

- (instancetype)initWithBlackList:(NSArray *)blackList;

@property (nonatomic, assign) id<MultiSelectGroupsViewControllerDelegate> delegate;

@end
