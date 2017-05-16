//
//  NSNull+HYLSafe.m
//  HYLOCFramework
//
//  Created by JF on 2017/5/16.
//  Copyright © 2017年 HYL. All rights reserved.
//

#import "NSNull+HYLSafe.h"

@implementation NSNull (HYLSafe)

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    NSMethodSignature *signature = [super methodSignatureForSelector:sel];
    if (!signature) {
        signature = [NSMethodSignature signatureWithObjCTypes:@encode(void)];
    }
    return signature;
}

- (void)forwardInvocation:(NSInvocation *)invocation {
}

@end
