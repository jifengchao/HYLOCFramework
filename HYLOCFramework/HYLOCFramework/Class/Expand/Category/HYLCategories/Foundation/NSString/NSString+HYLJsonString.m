//
//  NSString+HYLJsonString.m
//  HYLOCFramework
//
//  Created by JF on 2017/5/17.
//  Copyright © 2017年 HYL. All rights reserved.
//

#import "NSString+HYLJsonString.h"

@implementation NSString (HYLJsonString)

+ (NSString *)hyl_jsonStringWithString:(NSString *)string {
    return [NSString stringWithFormat:@"\"%@\"",
            [[string stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"] stringByReplacingOccurrencesOfString:@"\""withString:@"\\\""]
            ];
}

+ (NSString *)hyl_jsonStringWithArray:(NSArray *)array {
    NSMutableString *reString = [NSMutableString string];
    [reString appendString:@"["];
    NSMutableArray *values = [NSMutableArray array];
    for (id valueObj in array) {
        NSString *value = [NSString hyl_jsonStringWithObject:valueObj];
        if (value) {
            [values addObject:[NSString stringWithFormat:@"%@",value]];
        }
    }
    [reString appendFormat:@"%@",[values componentsJoinedByString:@","]];
    [reString appendString:@"]"];
    return reString;
}

+ (NSString *)hyl_jsonStringWithDictionary:(NSDictionary *)dictionary {
    NSArray *keys = [dictionary allKeys];
    NSMutableString *reString = [NSMutableString string];
    [reString appendString:@"{"];
    NSMutableArray *keyValues = [NSMutableArray array];
    for (int i = 0; i < [keys count]; i++) {
        NSString *name = [keys objectAtIndex:i];
        id valueObj = [dictionary objectForKey:name];
        NSString *value = [NSString hyl_jsonStringWithObject:valueObj];
        if (value) {
            [keyValues addObject:[NSString stringWithFormat:@"\"%@\":%@",name,value]];
        }
    }
    [reString appendFormat:@"%@",[keyValues componentsJoinedByString:@","]];
    [reString appendString:@"}"];
    return reString;
}

+ (NSString *)hyl_jsonStringWithObject:(id)object {
    NSString *value = nil;
    if (!object) {
        return value;
    }
    if ([object isKindOfClass:[NSString class]]) {
        value = [NSString hyl_jsonStringWithString:object];
    } else if([object isKindOfClass:[NSDictionary class]]) {
        value = [NSString hyl_jsonStringWithDictionary:object];
    } else if([object isKindOfClass:[NSArray class]]) {
        value = [NSString hyl_jsonStringWithArray:object];
    }
    
    return value;
}

@end
