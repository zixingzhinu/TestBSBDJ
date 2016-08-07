//
//  PlaceholderColorTextField.m
//  BaiSiBuDeJie
//
//  Created by James on 16/8/5.
//  Copyright © 2016年 James. All rights reserved.
//

#import "PlaceholderColorTextField.h"
#import <objc/runtime.h>

static NSString * const PlaceholderColorKeyPath = @"_placeholderLabel.textColor";

@implementation PlaceholderColorTextField

- (void)testTextFieldIvar {
    unsigned int outCount;
    Ivar *ivars = class_copyIvarList([UITextField class], &outCount);
    for (int i = 0; i < outCount; i++) {
        Ivar ivar = ivars[i];
        NSLog(@"%s <--> %s", ivar_getName(ivar), ivar_getTypeEncoding(ivar));
    }
    free(ivars);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setValue:[UIColor grayColor] forKeyPath:PlaceholderColorKeyPath];
}

- (BOOL)becomeFirstResponder {
    [self setValue:[UIColor whiteColor] forKeyPath:PlaceholderColorKeyPath];
    return [super becomeFirstResponder];
}

- (BOOL)resignFirstResponder {
    [self setValue:[UIColor grayColor] forKeyPath:PlaceholderColorKeyPath];
    return [super resignFirstResponder];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
