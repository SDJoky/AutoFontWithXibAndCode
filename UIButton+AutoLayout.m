
//
//  UIButton+AutoLayout.m
//  Saisir
//
//  Created by Joky Lee on 2017/7/17.
//  Copyright © 2017年 Joky. All rights reserved.
//

#import "UIButton+AutoLayout.h"

@implementation UIButton (AutoLayout)
+ (void)load {
    //    static dispatch_once_t onceToken;
    //    dispatch_once(&onceToken, ^{
    Method originalM = class_getInstanceMethod([self class], @selector(initWithCoder:));
    Method currentM = class_getInstanceMethod([self class], @selector(myInitWithCoder:));
    method_exchangeImplementations(originalM, currentM);
    //    });
}

- (instancetype)myInitWithCoder:(NSCoder *)aDecoder {
    [self myInitWithCoder:aDecoder];
    if (self.tag == 88) {
        return  self;
    }
    if (IS_IPHONE_5) {
        
        self.titleLabel.font = [UIFont systemFontOfSize:self.titleLabel.font.pointSize - CutMinFont];
    } else if (IS_IPHONE_6_PLUS) {
        self.titleLabel.font = [UIFont systemFontOfSize:self.titleLabel.font.pointSize + AddMaxFont];
    } else {
        self.titleLabel.font = [UIFont systemFontOfSize:self.titleLabel.font.pointSize];
    }
    return self;
}

@end
