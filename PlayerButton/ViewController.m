//
//  ViewController.m
//  PlayerButton
//
//  Created by GZ on 15/12/15.
//  Copyright (c) 2015年 GZ. All rights reserved.
//

#import "ViewController.h"
#import "ELNPlayerButton.h"
#import "NewViewController.h"
#define TOTAL_TIME 10.0
@interface ViewController ()
@property (nonatomic,strong)ELNPlayerButton * playerBtn;
@property (nonatomic,assign)NSInteger timerFlag;
//当定时器触发 每次timerFlag就会+1
//取值范围 0 - 10 10秒就走完一个周期

@property (nonatomic,strong)NSTimer *timer;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _playerBtn = [[ELNPlayerButton alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    
    _playerBtn.center = self.view.center;
    
    [_playerBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_playerBtn];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.f target:self selector:@selector(player) userInfo:nil repeats:YES];
    
    [_timer setFireDate:[NSDate distantFuture]];
    
    _timerFlag = 0;
    
}

#pragma mark -- 定时器触发方法
- (void)player{

    _timerFlag ++;
    
    _playerBtn.value = _timerFlag/TOTAL_TIME;
    
    
    if(_timerFlag > TOTAL_TIME){
    
        _timerFlag = 0;
        
        _playerBtn.value = 0;
        
        _playerBtn.selected = NO;
        
        [_timer setFireDate:[NSDate distantFuture]];
        
        NewViewController *newCtr = [[NewViewController alloc] init];
        
        newCtr.view.backgroundColor = [UIColor blueColor];
        
        [self.navigationController pushViewController:newCtr animated:YES];
        
    }
    
    [_playerBtn setNeedsDisplay];
    //UIView以及子类中都有 作用是将重新布局
    //画图方法会被调用 画的弧线就会变长

    
    
}

#pragma mark -- button的点击事件

- (void)btnClick:(id)sender{

    self.playerBtn.selected ^= 1;
    
    if (self.playerBtn.selected == YES) {
        
        [_timer setFireDate:[NSDate distantPast]];
    }
    else{
    
         [_timer setFireDate:[NSDate distantFuture]];
    }
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
