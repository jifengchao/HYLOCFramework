//
//  NSDictionary+HYLSafe.m
//  HYLOCFramework
//
//  Created by JF on 2017/5/16.
//  Copyright © 2017年 HYL. All rights reserved.
//

#import "NSDictionary+HYLSafe.h"
#import <objc/runtime.h>

@implementation NSDictionary (HYLSafe)

+ (void)load {
    Method originalMethod = class_getClassMethod(self, @selector(dictionaryWithObjects:forKeys:count:));
    Method swizzledMethod = class_getClassMethod(self, @selector(hyl_dictionaryWithObjects:forKeys:count:));
    method_exchangeImplementations(originalMethod, swizzledMethod);
}

+ (instancetype)hyl_dictionaryWithObjects:(const id [])objects forKeys:(const id <NSCopying> [])keys count:(NSUInteger)cnt {
    id nObjects[cnt];
    id nKeys[cnt];
    int i=0, j=0;
    for (; i<cnt && j<cnt; i++) {
        if (objects[i] && keys[i]) {
            nObjects[j] = objects[i];
            nKeys[j] = keys[i];
            j++;
        }
    }
    
    return [self hyl_dictionaryWithObjects:nObjects forKeys:nKeys count:j];
}

@end

@implementation NSMutableDictionary (HYLSafe)

+ (void)load {
    Class dictCls = NSClassFromString(@"__NSDictionaryM");
    Method originalMethod = class_getInstanceMethod(dictCls, @selector(setObject:forKey:));
    Method swizzledMethod = class_getInstanceMethod(dictCls, @selector(hyl_setObject:forKey:));
    method_exchangeImplementations(originalMethod, swizzledMethod);
}

- (void)hyl_setObject:(id)anObject forKey:(id<NSCopying>)aKey {
    if (!anObject)
        return;
    [self hyl_setObject:anObject forKey:aKey];
}

@end
