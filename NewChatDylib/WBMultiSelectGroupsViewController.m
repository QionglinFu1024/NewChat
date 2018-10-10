//
//  WBMultiSelectGroupsViewController.m
//  NewChatDylib
//
//  Created by Qionglin Fu on 2018/10/10.
//  Copyright © 2018年 Qionglin Fu. All rights reserved.
//

#import "WBMultiSelectGroupsViewController.h"
#import "WeChatRedEnvelop.h"
#import <objc/runtime.h>

#define QL_ScreenWidth  [UIScreen mainScreen].bounds.size.width///屏幕宽
#define QL_ScreenHeight [UIScreen mainScreen].bounds.size.height///屏幕高
#define QL_iPhoneX (QL_ScreenWidth == 375.f && QL_ScreenHeight == 812.f ? YES : NO)/// iPhone X
#define QL_StatusBarHeight (QL_iPhoneX ? 44.f : 20.f)  //状态栏高度
#define QL_NavigationBarHeight  44.f   ///导航条高度
#define QL_TabbarHeight (QL_iPhoneX ? (49.f+34.f) : 49.f)///标签栏总高度
#define QL_TabbarSafeBottomMargin (QL_iPhoneX ? 34.f : 0.f)///标签栏到底部高度
#define QL_StatusBarAndNavigationBarHeight  (QL_iPhoneX ? 88.f : 64.f)///导航栏总高度

@interface WBMultiSelectGroupsViewController () <ContactSelectViewDelegate>

@property (strong, nonatomic) ContactSelectView *selectView;
@property (strong, nonatomic) NSArray *blackList;

@end

@implementation WBMultiSelectGroupsViewController

- (instancetype)initWithBlackList:(NSArray *)blackList {
    if (self = [super initWithNibName:nil bundle:nil]) {
        _blackList = blackList;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initTitleArea];
    [self initSelectView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    MMServiceCenter *serviceCenter = [objc_getClass("MMServiceCenter") defaultCenter];
    CContactMgr *contactMgr = [serviceCenter getService:objc_getClass("CContactMgr")];
    
    for (NSString *contactName in self.blackList) {
        CContact *contact = [contactMgr getContactByName:contactName];
        [self.selectView addSelect:contact];
    }
}

- (void)initTitleArea {
    self.navigationItem.leftBarButtonItem = [objc_getClass("MMUICommonUtil") getBarButtonWithTitle:@"取消" target:self action:@selector(onCancel:) style:0];
    
    self.navigationItem.rightBarButtonItem = [self rightBarButtonWithSelectCount:self.blackList.count];
    
    self.title = @"黑名单";
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:18.0]}];
}

- (UIBarButtonItem *)rightBarButtonWithSelectCount:(unsigned long)selectCount {
    
    UIBarButtonItem *barButtonItem;
    if (selectCount == 0) {
        barButtonItem = [objc_getClass("MMUICommonUtil") getBarButtonWithTitle:@"确定" target:self action:@selector(onDone:) style:2];
    } else {
        NSString *title = [NSString stringWithFormat:@"确定(%lu)", selectCount];
        barButtonItem = [objc_getClass("MMUICommonUtil") getBarButtonWithTitle:title target:self action:@selector(onDone:) style:4];
    }
    return barButtonItem;
}

- (void)onCancel:(UIBarButtonItem *)item {
    if ([self.delegate respondsToSelector:@selector(onMultiSelectGroupCancel)]) {
        [self.delegate onMultiSelectGroupCancel];
    }
}

- (void)onDone:(UIBarButtonItem *)item {
    if ([self.delegate respondsToSelector:@selector(onMultiSelectGroupReturn:)]) {
        NSArray *blacklist = [[self.selectView.m_dicMultiSelect allKeys] copy];
        [self.delegate onMultiSelectGroupReturn:blacklist];
    }
}

- (void)initSelectView {
    self.selectView = [[objc_getClass("ContactSelectView") alloc] initWithFrame:CGRectMake(0, QL_StatusBarAndNavigationBarHeight, QL_ScreenWidth, QL_ScreenHeight) delegate:self];
    
    self.selectView.m_uiGroupScene = 5;
    self.selectView.m_bMultiSelect = YES;
    [self.selectView initData:5];
    [self.selectView initView];
    
    [self.view addSubview:self.selectView];
}

#pragma mark - ContactSelectViewDelegate
- (void)onSelectContact:(CContact *)arg1 {
    self.navigationItem.rightBarButtonItem = [self rightBarButtonWithSelectCount:[self getTotalSelectCount]];
}

- (unsigned long)getTotalSelectCount {
    return (unsigned long)[self.selectView.m_dicMultiSelect count];
}

@end
