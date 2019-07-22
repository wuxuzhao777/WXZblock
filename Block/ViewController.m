//
//  ViewController.m
//  Block
//
//  Created by boomsense on 17/5/3.
//  Copyright © 2017年 wuxuzhao. All rights reserved.
//

#import "ViewController.h"
#import "People.h"
#import "CustomButton.h"
#import <ifaddrs.h>
#import <arpa/inet.h>
#import <net/if.h>
#import "KsIMSDK/KsIMSDK.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    People*people = [[People alloc]init];
    people.people(@"我").byBus().buyApple(@"苹果");
    
    
    CustomButton*customBtn = [[CustomButton alloc]initWithFrame:CGRectMake(60, 60, 200, 60)];
    customBtn.addSubview(self.view).bbackgundColor([UIColor grayColor]).title(@"haha").btnCLick =^{
        NSLog(@"asdasdasdasd");
    };
    
    //修改属性
    //customBtn.bbackgundColor([UIColor redColor]);
   // customBtn.title(@"sadasd");

    NSLog(@"%@",self.getIPaddress);
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor redColor];
    btn.frame = CGRectMake(100, 100, 100, 100);
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

  
    
    
}

- (void)btnClick {
    if (![KsClient sharedInstance].isOpen) {
        [[KsClient sharedInstance] openSessionWithAppKey:@"A7zzhVlgCJ2AWvarF704wxPAaEYmFND6"];
    }
    [[KsClient sharedInstance] pushChatViewOnViewController:self];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// 获取设备IP地址
-(NSString *)getIPaddress {
    NSString *address = @"error";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    // 检索当前接口,在成功时,返回0
    success = getifaddrs(&interfaces);
    if (success == 0) {
        // 循环链表的接口
        temp_addr = interfaces;
        while(temp_addr != NULL) {
            if(temp_addr->ifa_addr->sa_family == AF_INET) {
                // 检查接口是否en0 wifi连接在iPhone上
                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // 得到NSString从C字符串
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            temp_addr = temp_addr->ifa_next;
        }
    }
    // 释放内存
    freeifaddrs(interfaces);
    
    return address;
}



@end
