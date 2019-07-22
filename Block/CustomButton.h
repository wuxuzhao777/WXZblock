//
//  CustomButton.h
//  Block
//
//  Created by boomsense on 17/5/3.
//  Copyright © 2017年 wuxuzhao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class  CustomButton;

//三个属性
typedef CustomButton*(^UIViewBlock)(UIView*);
typedef CustomButton*(^BackgroundColorBlock)(UIColor*);
typedef CustomButton*(^TitleBlock)(NSString*);
typedef CustomButton*(^BtnHandlerBlock) (void);
//事件
typedef void (^BtnClick)(void);


@interface CustomButton : UIButton




@property(nonatomic,assign)BtnHandlerBlock btnHandlerBlock;
@property(nonatomic,assign)BtnClick btnCLick;
@property(nonatomic,assign)UIViewBlock addSubview;
@property(nonatomic,assign)BackgroundColorBlock bbackgundColor;
@property(nonatomic,assign)TitleBlock title;




@end
