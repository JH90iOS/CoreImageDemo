//
//  BaseView.m
//  CoreImageDemo
//
//  Created by 金 on 15/3/2.
//  Copyright (c) 2015年 jinhua. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView



//获得上下文方法一：
-(void)drawRect:(CGRect)rect{
    
    /*//绘制方法1.1：UIKit
    UIBezierPath* path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 100)];
    [[UIColor blueColor] setFill];
    [path fill];*/
    
    //绘制方法1.2：Core Graphics
    CGContextRef context = UIGraphicsGetCurrentContext();//获得当前图形上下文的引用
    CGContextAddEllipseInRect(context, CGRectMake(0, 0, 100, 100));
    CGContextSetFillColorWithColor(context, [UIColor blueColor].CGColor);
    CGContextFillPath(context);
}



@end
