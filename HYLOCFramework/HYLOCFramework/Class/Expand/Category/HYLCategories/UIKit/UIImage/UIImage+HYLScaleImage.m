//
//  UIImage+HYLScaleImage.m
//  HYLOCFramework
//
//  Created by JF on 2017/5/16.
//  Copyright © 2017年 HYL. All rights reserved.
//

#import "UIImage+HYLScaleImage.h"

@implementation UIImage (HYLScaleImage)

+ (UIImage *)hyl_scaleImage:(UIImage *)image toKb:(NSInteger)kb {
    
    if (!image) {
        return image;
    }
    if (kb < 1) {
        return image;
    }
    
    kb *= 1024;
    
    CGFloat compression = 0.9f;
    CGFloat maxCompression = 0.1f;
    NSData *imageData = UIImageJPEGRepresentation(image, compression);
    while ([imageData length] > kb && compression > maxCompression) {
        compression -= 0.1;
        imageData = UIImageJPEGRepresentation(image, compression);
    }
    
//    NSLog(@"当前大小:%fkb",(float)[imageData length]/1024.0f);
    
    UIImage *compressedImage = [UIImage imageWithData:imageData];
    
    return compressedImage;
    
}

@end
