//
//  UITextView+HYLPlaceHolder.h
//  HYLOCFramework
//
//  Created by JF on 2017/5/16.
//  Copyright © 2017年 HYL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (HYLPlaceHolder)

@property (nonatomic, readonly) UILabel *hyl_placeholderLabel;

@property (nonatomic, strong) NSString *hyl_placeholder;
@property (nonatomic, strong) NSAttributedString *hyl_attributedPlaceholder;
@property (nonatomic, strong) UIColor *hyl_placeholderColor;

+ (UIColor *)hyl_defaultPlaceholderColor;

@end
