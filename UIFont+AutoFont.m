//
//  UIFont+AutoFont.m
//  Saisir
//
//  Created by Joky on 2017/7/12.
//  Copyright © 2017年 Joky. All rights reserved.
//  字体大小适配

#import "UIFont+AutoFont.h"


@implementation UIFont (AutoFont)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method originalM = class_getClassMethod(self, @selector(systemFontOfSize:));
        Method currentM = class_getClassMethod(self, @selector(ql_systemFontOfSize:));
        method_exchangeImplementations(originalM, currentM);
    });
}

+ (UIFont *)ql_systemFontOfSize:(CGFloat )size {
    CGFloat kSize;
    if (IS_IPHONE_5) {
        kSize = size - CutMinFont;
    } else if (IS_IPHONE_6_PLUS) {
        kSize = size + AddMaxFont;
    } else {
        kSize = size;
    }
    return [self ql_systemFontOfSize:kSize];
}
@end
