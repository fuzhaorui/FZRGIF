//
//  GifView.m
//  XtuanMoive
//
//  Created by ppl on 14-12-11.
//  Copyright (c) 2014年 X团. All rights reserved.
//

#import "FZRGIFView.h"
@interface FZRGIFView ()
{
     CGImageSourceRef  _gif;            // 保存gif动画
     NSDictionary      *_gifProperties; // 保存gif动画属性
     size_t            _index;          // gif动画播放开始的帧序号
     size_t            _count;          // gif动画的总帧数
     NSTimer           *_timer;         // 播放gif动画所使用的timer
     NSTimeInterval    _rate;           // 播放gif动画播放速率
     NSInteger         _playCount;      // 播放gif动画播次数
}

@end

@implementation FZRGIFView



/**   创建gif的显示控件 FZRGIFView
 1.frame  (gif显示控件的位置)
 2.gifName  (gif动画的名字)
 **/
- (FZRGIFView *)initWithFrame:(CGRect)frame andGifImageName:(NSString *)gifName
{
    
    self = [super initWithFrame:frame];
    
    [self loadGifImageView:gifName];
    return self;
}



/**   创建gif的显示控件 FZRGIFView
 1.frame  (gif显示控件的位置)
 2.gifName  (gif动画的名字)
 3.rate  (gif动画播放的速率)
 **/
- (FZRGIFView *)initWithFrame:(CGRect)frame andGifImageName:(NSString *)gifName andRate:(NSTimeInterval )rate
{
    
    self = [ self initWithFrame:frame andGifImageName:gifName];
    
    _rate = rate;
    return self;
    
}



/**   创建gif的显示控件 FZRGIFView
 1.frame  (gif显示控件的位置)
 2.gifName  (gif动画的名字)
 3.rate  (gif动画播放的速率)
 4.count  (gif动画播放次数必须大于1，否则将无限循环)
 **/
- (FZRGIFView *)initWithFrame:(CGRect)frame andGifImageName:(NSString *)gifName andRate:(NSTimeInterval)rate andCount:(NSInteger)count
{
    
   self = [self initWithFrame:frame andGifImageName:gifName andRate:rate];
    
    _playCount = count;
    return self;
}



- (void)loadGifImageView:(NSString *)gifName
{
    //加载gif图
    
    NSDictionary *gifLoopCount = [NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:(NSString *)kCGImagePropertyGIFLoopCount];
    _gifProperties = [NSDictionary dictionaryWithObject:gifLoopCount forKey:(NSString *)kCGImagePropertyGIFDictionary];
    
    NSString* filePath = [[NSBundle mainBundle] pathForResource:gifName ofType:nil];
    _gif = CGImageSourceCreateWithURL((CFURLRef)[NSURL fileURLWithPath:filePath], (CFDictionaryRef)_gifProperties);
    _count =CGImageSourceGetCount(_gif);
    _rate  = 0.05;
    _index = 0;
    _playCount = -1;
    [self gifDraw];
}

- (void)setRate:(NSTimeInterval )rate
{
    _rate = rate;
}



/**
 开启gif动画
 **/
- (void)start
{
    _index = 0;
    _timer = [NSTimer scheduledTimerWithTimeInterval:_rate target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
}



/**
 结束gif动画
 **/
- (void)stop
{
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
    
    if (_delegate) {
        [_delegate endGIFPlay];
    }
}

- (void)onTimer
{
    [self gifDraw];
    
    _index++;
    if (_index == _count) {
        
         _index = 0;
        if (_playCount>0) {
            _playCount--;
        }
        if (_playCount == 0) {
            [self stop];
        }

    }
}

- (void)gifDraw
{
    CGImageRef ref = CGImageSourceCreateImageAtIndex(_gif, _index, (CFDictionaryRef)_gifProperties);
    self.layer.contents = (__bridge id)ref;
    CFRelease(ref);
}

- (void)dealloc
{
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
}

@end
