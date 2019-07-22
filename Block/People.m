//
//  People.m
//  Block
//
//  Created by boomsense on 17/5/3.
//  Copyright © 2017年 wuxuzhao. All rights reserved.
//

#import "People.h"

@implementation People

-(People*(^)(NSString*))people{
    __weak typeof(self) WSelf = self;
    return ^(NSString *name){
        NSLog(@"帅哥：%@",name);
        return WSelf;
    };
}

-(People*(^)())byBus{
    __weak typeof(self) WSelf = self;
    return ^{
        NSLog(@"骑自行车");
        return WSelf;
    };
    
    
}
-(People*(^)(NSString*))buyApple{
    __weak typeof(self) WSelf = self;
    return ^(NSString*doing){
        NSLog(@"买：%@",doing);
        return  WSelf;
    };
}

@end
