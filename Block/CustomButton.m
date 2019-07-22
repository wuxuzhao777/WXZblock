//
//  CustomButton.m
//  Block
//
//  Created by boomsense on 17/5/3.
//  Copyright © 2017年 wuxuzhao. All rights reserved.
//

#import "CustomButton.h"

@implementation CustomButton

//初始化
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addTarget:self action:@selector(btnCLick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
    
}

//重写方法
-(void)btnCLick:(UIButton*)btn{
    if (self.btnCLick) {
        self.btnCLick();
    }
    
}

-(UIViewBlock)addSubview{
    __weak typeof(self) Wself = self;
    return ^(UIView*superView){
        [superView addSubview:Wself];
        
        return  Wself;
    };

}
-(BackgroundColorBlock)bbackgundColor{
    __weak typeof(self) Wself = self;
    return ^(UIColor*backgoundColor){
        Wself.backgroundColor = backgoundColor;
        return Wself;
    };
}


-(TitleBlock)title{
    __weak typeof (self)Wself = self;
    return ^(NSString*title){
        [Wself setTitle:title forState:UIControlStateNormal];
         return Wself;
    };
}




@end
