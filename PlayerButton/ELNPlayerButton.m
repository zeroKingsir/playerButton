//
//  ELNPlayerButton.m
//  PlayerButton
//
//  Created by GZ on 15/12/15.
//  Copyright (c) 2015年 GZ. All rights reserved.
//

#import "ELNPlayerButton.h"

@implementation ELNPlayerButton
#pragma mark -- 重写构造方法
- (instancetype)initWithFrame:(CGRect)frame
{
  //如果视图中 有属性初始化 通常的做法是重写常用的构造方法 在构造方法中对属性进行初始化
    
    self = [super initWithFrame:frame];
    if (self) {
       
        
        [self setUp];
        
        
    }
    return self;
}

- (void)setUp{

    //bgImageView
    
    _bgImageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, self.frame.size.width - 40, self.frame.size.height - 40)];
    
    _bgImageView.image = [UIImage imageNamed:@"start.png"];
    
    _bgImageView.layer.masksToBounds = YES;
    
    _bgImageView.layer.cornerRadius = (self.frame.size.width - 40)/2.0;
    
    [self addSubview:_bgImageView];
    
    
    _value = 0;
    
    
}

#pragma mark -- 切换选中状态时触发 系统提供的
- (void)setSelected:(BOOL)selected{

    [super setSelected:selected];
    //先执行父类的方法
    
    
    if(selected == YES){
    
        //选中
        
        _bgImageView.image = [UIImage imageNamed:@"selected.png"];
    }else{
    
        //正常情况下
        _bgImageView.image = [UIImage imageNamed:@"start.png"];
        
    }
    
    
}


#pragma mark -- 重写画图方法
- (void)drawRect:(CGRect)rect{

    UIBezierPath *path = [[UIBezierPath alloc]init];
    
    CGPoint center = CGPointMake(self.frame.size.width/2.0, self.frame.size.height/2.0);
    
    CGFloat radius = self.frame.size.width/2.0 - 3;
    
    
    [path addArcWithCenter:center radius:radius startAngle:- M_PI_2 endAngle:- M_PI_2 + (2 * M_PI)*_value clockwise:YES];
    
    path.lineWidth = 5.0;
    
    [[UIColor purpleColor] setStroke];
    
    [path stroke];
    

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
