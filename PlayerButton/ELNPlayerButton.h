//
//  ELNPlayerButton.h
//  PlayerButton
//
//  Created by GZ on 15/12/15.
//  Copyright (c) 2015年 GZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ELNPlayerButton : UIButton

@property (nonatomic,strong)UIImageView *bgImageView;
//显示播放或者暂停的图片

@property (nonatomic,assign)double value;
//控制每次圆周的夹角 从而控制每次弧长应该为多少

// value的取值 0 - 1 把一个圆周分为30等份 每隔一秒 value应该 + 1/30

//30秒画完一个圆周




@end
