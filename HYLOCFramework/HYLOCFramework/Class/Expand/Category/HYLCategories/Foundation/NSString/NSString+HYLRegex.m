//
//  NSString+HYLRegex.m
//  HYLOCFramework
//
//  Created by JF on 2017/5/17.
//  Copyright © 2017年 HYL. All rights reserved.
//

#import "NSString+HYLRegex.h"

@implementation NSString (HYLRegex)

// 全是数字
- (BOOL)hyl_isAllDigital {
    
    NSString *regex = @"^[0-9]*$";
    
    return [self hyl_validateByRegexString:regex];
}

#pragma mark - 正则表达式验证
- (BOOL)hyl_validateByRegexString:(NSString *)regexString {
    
    NSRegularExpression *regex = [[NSRegularExpression alloc] initWithPattern:regexString options:0 error:nil];
    NSArray *results = [regex matchesInString:self options:0 range:NSMakeRange(0, self.length)];
    
    return results.count;
}

@end
