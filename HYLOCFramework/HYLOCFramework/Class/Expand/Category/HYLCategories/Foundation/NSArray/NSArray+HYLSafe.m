//
//  NSArray+HYLSafe.m
//  HYLOCFramework
//
//  Created by JF on 2017/5/16.
//  Copyright © 2017年 HYL. All rights reserved.
//

#import "NSArray+HYLSafe.h"
#import <objc/runtime.h>

@implementation NSArray (HYLSafe)

+ (void)load {
    Method originalMethod = class_getClassMethod(self, @selector(arrayWithObjects:count:));
    Method swizzledMethod = class_getClassMethod(self, @selector(hyl_arrayWithObjects:count:));
    method_exchangeImplementations(originalMethod, swizzledMethod);
}

+ (instancetype)hyl_arrayWithObjects:(const id [])objects count:(NSUInteger)cnt {
    id nObjects[cnt];
    int i=0, j=0;
    for (; i<cnt && j<cnt; i++) {
        if (objects[i]) {
            nObjects[j] = objects[i];
            j++;
        }
    }
    
    return [self hyl_arrayWithObjects:nObjects count:j];
}
@end

@implementation NSMutableArray (HYLSafe)

+ (void)load {
    Class arrayCls = NSClassFromString(@"__NSArrayM");
    
    Method originalMethod1 = class_getInstanceMethod(arrayCls, @selector(insertObject:atIndex:));
    Method swizzledMethod1 = class_getInstanceMethod(arrayCls, @selector(hyl_insertObject:atIndex:));
    method_exchangeImplementations(originalMethod1, swizzledMethod1);
    
    Method originalMethod2 = class_getInstanceMethod(arrayCls, @selector(setObject:atIndex:));
    Method swizzledMethod2 = class_getInstanceMethod(arrayCls, @selector(hyl_setObject:atIndex:));
    method_exchangeImplementations(originalMethod2, swizzledMethod2);
}

- (void)hyl_insertObject:(id)anObject atIndex:(NSUInteger)index {
    if (!anObject)
        return;
    [self hyl_insertObject:anObject atIndex:index];
}

- (void)hyl_setObject:(id)anObject atIndex:(NSUInteger)index {
    if (!anObject)
        return;
    [self hyl_setObject:anObject atIndex:index];
}

@end
