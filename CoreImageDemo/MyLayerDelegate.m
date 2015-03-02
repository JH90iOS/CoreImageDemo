//
//  MyLayerDelegate.m
//  CoreImageDemo
//
//  Created by 金 on 15/3/2.
//  Copyright (c) 2015年 jinhua. All rights reserved.
//

#import "MyLayerDelegate.h"
#import <QuartzCore/QuartzCore.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

@implementation MyLayerDelegate

//获取上下文方法二：
- (void)drawLayer:(CALayer*)layer inContext:(CGContextRef)context {
    
    //绘制方法2.1：使用UIKit
    /*UIGraphicsPushContext(context);//将context转化为当前上下文
    UIBezierPath* path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 100)];
    [[UIColor yellowColor] setFill];
    [path fill];
    UIGraphicsPopContext();//恢复上下文环境 */
    
    //绘制方法2.2：使用Core Graphics
    CGContextAddEllipseInRect(context, CGRectMake(0, 0, 100, 100));
    CGContextSetFillColorWithColor(context, [UIColor yellowColor].CGColor);
    CGContextFillPath(context);
    
}

@end
