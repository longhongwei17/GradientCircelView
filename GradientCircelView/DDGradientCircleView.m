//
//  GradView.m
//  asdas
//
//  Created by longhongwei on 16/4/22.
//  Copyright © 2016年 longhongwei. All rights reserved.
//

#import "DDGradientCircleView.h"
#include <math.h>
@interface DDGradientCircleView ()

//@property (nonatomic, strong) UIView *baseView;

@property (nonatomic) CGFloat radius;

@property (nonatomic) NSUInteger counter;//

@property (nonatomic) CGFloat perAngle;

@property (nonatomic) CGFloat mainPerAngle;

@property (nonatomic) CGFloat secondAngle;
@end

@implementation DDGradientCircleView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize
{
    self.counter = 12;
    self.perAngle = (2 * M_PI) / self.counter;
    self.mainPerAngle = 0.667 * self.perAngle;
    self.secondAngle = 0.333 * self.perAngle;
}

- (void)showViewWithMainColor:(UIColor *)mainColor
                            secondColor:(UIColor *)secondColor
{
    for (NSInteger index = 0; index < self.counter + 1; index ++) {
        UIView *mainView = [self baseViewPercent:self.mainPerAngle color:mainColor];
        mainView.layer.anchorPoint = CGPointMake(0, 0.5);
        mainView.transform = CGAffineTransformRotate(CGAffineTransformIdentity, self.perAngle *index);
        [self addSubview:mainView];
        
        UIView *secondView = [self baseViewPercent:self.secondAngle color:secondColor];
        secondView.layer.anchorPoint = CGPointMake(0, 0.5);
        secondView.transform = CGAffineTransformRotate(CGAffineTransformIdentity, self.perAngle *index + self.perAngle * 0.5);
        [self addSubview:secondView];
    }
}

- (UIView *)baseViewPercent:(float)percentAngle color:(UIColor *)curColor
{
    
    self.radius = CGRectGetWidth(self.frame)/2 ;
    CGFloat height = tan((percentAngle )/2) * self.radius * 2;
    UIView *baseView = [[UIView alloc] init];
    baseView.frame = CGRectMake(self.radius/2, self.radius - height/2, self.radius, height);
    
    // mask
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:CGPointMake(0, height/2)];
    [bezierPath addLineToPoint:CGPointMake(self.radius, 0)];
    [bezierPath addLineToPoint:CGPointMake(self.radius, height)];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = baseView.bounds;
    shapeLayer.path = bezierPath.CGPath;
    
    
    //Gradient
    CAGradientLayer * gLayer = [CAGradientLayer layer];
    gLayer.frame = baseView.bounds;
    
    
    
    gLayer.startPoint = CGPointMake(0.2, 0);
    gLayer.endPoint = CGPointMake(1, 0);
    
    
    gLayer.colors = [NSArray arrayWithObjects:
                     (id)curColor.CGColor,
                     (id)[curColor colorWithAlphaComponent:0.].CGColor,
                     nil];
    
    gLayer.locations = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.0f],[NSNumber numberWithFloat:1.0f],nil];
    
    [baseView.layer addSublayer:gLayer];
    
    baseView.layer.mask = shapeLayer;
    
    return baseView;
}


@end
