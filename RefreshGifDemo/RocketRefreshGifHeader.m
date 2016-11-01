//
//  RocketRefreshGifHeader.m
//  RefreshGifDemo
//
//  Created by lingzhi on 2016/10/31.
//  Copyright © 2016年 lingzhi. All rights reserved.
//

#import "RocketRefreshGifHeader.h"

@implementation RocketRefreshGifHeader


#pragma mark- 重写方法  基本设置
- (void)prepare
{
    [super prepare];
    //设置普通动画图片
    NSMutableArray *idleImages = [[NSMutableArray alloc] init];
    for (NSUInteger i = 1; i<= 60; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_anim__000%zd",i]];
        [idleImages addObject:image];
    }
    //给刷新头部添加控件
    [self setImages:idleImages forState:MJRefreshStateIdle];
    
    
    //设置即将刷新状态的动画图片（松开进入刷新状态）
    NSMutableArray *refreshingImage = [[NSMutableArray alloc] init];
    
    for (NSUInteger i = 1; i <= 3; i ++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_loading_0%zd", i]];
        [refreshingImage addObject:image];
    }
    
    [self setImages:refreshingImage forState:MJRefreshStatePulling];
    
    //设置正在刷新状态的动画图片
    [self setImages:refreshingImage forState:MJRefreshStateRefreshing];
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
