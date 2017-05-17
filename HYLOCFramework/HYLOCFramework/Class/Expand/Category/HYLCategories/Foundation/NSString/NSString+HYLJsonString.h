//
//  NSString+HYLJsonString.h
//  HYLOCFramework
//
//  Created by JF on 2017/5/17.
//  Copyright © 2017年 HYL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (HYLJsonString)

+ (NSString *)hyl_jsonStringWithDictionary:(NSDictionary *)dictionary;

+ (NSString *)hyl_jsonStringWithArray:(NSArray *)array;

+ (NSString *)hyl_jsonStringWithString:(NSString *)string;

+ (NSString *)hyl_jsonStringWithObject:(id)object;

@end
