//
//  UIColor+HYLHEX.m
//  HYLOCFramework
//
//  Created by JF on 2017/5/17.
//  Copyright © 2017年 HYL. All rights reserved.
//

#import "UIColor+HYLHEX.h"
#import "UIColor+JKHEX.h"

@implementation UIColor (HYLHEX)

/**
 *  hexString = FFFFFF or 0xFFFFFF or 0XFFFFFF
 */
+ (UIColor *)hyl_colorWithHexString:(NSString *)hexString {
    
    NSString *colorString = [[[hexString stringByReplacingOccurrencesOfString:@"#" withString:@""] stringByReplacingOccurrencesOfString:@"0x" withString:@""] stringByReplacingOccurrencesOfString:@"0X" withString:@""];
    
    return [UIColor jk_colorWithHexString:colorString];
}

+ (UIColor*)hyl_randomColor {
    
    UIColor *color;
    float randomRed   = (arc4random() % 255) / 255.0f;
    float randomGreen = (arc4random() % 255) / 255.0f;
    float randomBlue  = (arc4random() % 255) / 255.0f;
    
    color = [UIColor colorWithRed:randomRed green:randomGreen blue:randomBlue alpha:1.0];
    
    return color;
}

@end
