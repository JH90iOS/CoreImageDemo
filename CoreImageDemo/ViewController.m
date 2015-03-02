//
//  ViewController.m
//  CoreImageDemo
//
//  Created by 金 on 15/3/2.
//  Copyright (c) 2015年 jinhua. All rights reserved.
//

#import "ViewController.h"
#import <CoreImage/CoreImage.h>
#import "BaseView.h"
#import "MyLayerDelegate.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property (strong,nonatomic)MyLayerDelegate* myLayerDelegate;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    BaseView* view = [[BaseView alloc]initWithFrame:CGRectMake(50, 50, 100, 100)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    CALayer* myLayer = [CALayer layer];
    _myLayerDelegate = [[MyLayerDelegate alloc]init];
    myLayer.delegate = _myLayerDelegate;
    myLayer.frame = CGRectMake(50, 160, 100, 100);
    myLayer.backgroundColor = [UIColor whiteColor].CGColor;
    [self.view.layer addSublayer:myLayer];
    [myLayer setNeedsDisplay];
    
    //获取上下文方法三：
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(100, 100), NO, 0);
    
    //绘图方法3.1：使用UIKit
    /*UIBezierPath* path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 100)];
    [[UIColor redColor] setFill];
    [path fill];
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();*/
    
    //绘图方法3.2：使用Core Graphics
    CGContextRef context = UIGraphicsGetCurrentContext();//获得当前图形上下文的引用
    CGContextAddEllipseInRect(context, CGRectMake(0, 0, 100, 100));
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    CGContextFillPath(context);
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();
    
    UIImageView* imageView = [[UIImageView alloc]initWithFrame:CGRectMake(50, 280, 100, 100)];
    imageView.image = image;
    [self.view addSubview:imageView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tap:(UIButton *)sender {
    
}

@end
