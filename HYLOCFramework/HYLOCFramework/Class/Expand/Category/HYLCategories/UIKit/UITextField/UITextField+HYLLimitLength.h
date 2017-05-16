//
//  UITextField+HYLLimitLength.h
//  HYLOCFramework
//
//  Created by JF on 2017/5/16.
//  Copyright © 2017年 HYL. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^HYLEditEndBlock)(NSString *text);

@interface UITextField (HYLLimitLength)

/**
 *  使用时只要调用此方法，加上一个长度(int)，就可以实现了字数限制, block是编辑结束后的厚点
 *
 *  length
 *  block
 */
- (void)limitTextLength:(int)length block:(HYLEditEndBlock)block;

/**
 *  uitextField 抖动效果
 */
- (void)shake;

@end
