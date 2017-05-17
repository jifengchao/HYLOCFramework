//
//  NSString+HYLColor.m
//  HYLOCFramework
//
//  Created by JF on 2017/5/17.
//  Copyright © 2017年 HYL. All rights reserved.
//

#import "NSString+HYLColor.h"
#import "UIColor+HYLHEX.h"

@implementation NSString (HYLColor)

- (UIColor *)hyl_color {
    
    return [UIColor hyl_colorWithHexString:self];
}

@end
