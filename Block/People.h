//
//  People.h
//  Block
//
//  Created by boomsense on 17/5/3.
//  Copyright © 2017年 wuxuzhao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface People : NSObject
-(People*(^) (NSString*name)) people;
-(People*(^)()) byBus;
-(People*(^)(NSString*doing))buyApple;


@end
