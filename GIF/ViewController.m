//
//  ViewController.m
//  GIF
//
//  Created by IOS-开发机 on 15/11/18.
//  Copyright © 2015年 IOS-开发机. All rights reserved.
//

#import "ViewController.h"
#import "FZRGIFView.h"
//#import "SCGIFImageView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

    FZRGIFView *gif = [[FZRGIFView alloc]initWithFrame:CGRectMake(0, 0, 100, 100) andGifImageName:@"ren.gif" andRate:0.1 andCount:2];
//    gif.center = self.view.center;
    [gif start];
    [self.view addSubview:gif];
    
    FZRGIFView *gif1 = [[FZRGIFView alloc]initWithFrame:CGRectMake(0, 150, 100, 100) andGifImageName:@"ren.gif" andRate:0.01];
    [gif1 start];
    [self.view addSubview:gif1];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
