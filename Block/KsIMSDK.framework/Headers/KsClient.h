//
//  KsClient.h
//  KsIMSDK
//
//  Created by chenshengji on 16/9/24.
//  Copyright © 2016年 chenshengji. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface KsClient : NSObject

+ (instancetype)sharedInstance;
- (void)openSessionWithAppKey:(NSString *)appKey;
- (void)closeSession;
- (BOOL)isOpen;

- (void)pushChatViewOnViewController:(UIViewController *)viewController;
- (void)popChatViewController;
@end
