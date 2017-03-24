//
//  GifView.h
//  XtuanMoive
//
//  Created by ppl on 14-12-11.
//  Copyright (c) 2014年 X团. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <ImageIO/ImageIO.h>

@protocol FZRGifViewDelegate <NSObject>

/**
 *  结束gif图动画时
 **/
- (void)endGIFPlay;


@end

@interface FZRGIFView : UIView
@property (nonatomic, weak) id<FZRGifViewDelegate> delegate;




/**   创建gif的显示控件 FZRGIFView
 1.frame  (gif显示控件的位置)
 2.gifName  (gif动画的名字)
 **/
- (FZRGIFView *)initWithFrame:(CGRect)frame andGifImageName:(NSString *)gifName ;



/**   创建gif的显示控件 FZRGIFView
 1.frame  (gif显示控件的位置)
 2.gifName  (gif动画的名字)
 3.rate  (gif动画播放的速率)
 **/
- (FZRGIFView *)initWithFrame:(CGRect)frame andGifImageName:(NSString *)gifName andRate:(NSTimeInterval)rate;



/**   创建gif的显示控件 FZRGIFView   
      1.frame  (gif显示控件的位置)
      2.gifName  (gif动画的名字)
      3.rate  (gif动画播放的速率)
      4.count  (gif动画播放次数必须大于1，否则将无限循环)
 **/
- (FZRGIFView *)initWithFrame:(CGRect)frame andGifImageName:(NSString *)gifName andRate:(NSTimeInterval)rate andCount:(NSInteger)count;



/**
 设置gif动画的播放速度
 **/
- (void)setRate:(NSTimeInterval)rate;



/**
 开启gif动画
 **/
- (void)start;



/**
 结束gif动画
 **/
- (void)stop;


@end
