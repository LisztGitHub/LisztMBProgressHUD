//
//  UIView+LisztMBProgressHUD.m
//  LisztMBProgressHUD
//
//  Created by LaoDie on 2018/11/12.
//  Copyright © 2018 LisztMBProgressHUD. All rights reserved.
//

#import "UIView+LisztMBProgressHUD.h"
#import "LisztProgressHUD.h"

#define LISZTHUDTAG 10089

@implementation UIView (LisztMBProgressHUD)

- (LisztProgressHUD *)createHUD{
    LisztProgressHUD *oldHUD = [self viewWithTag:LISZTHUDTAG];
    if(oldHUD){
        return oldHUD;
    }
    LisztProgressHUD *hud = [LisztProgressHUD showHUDAddedTo:self animated:YES];
    hud.tag = LISZTHUDTAG;
    hud.bezelView.blurEffectStyle = UIBlurEffectStyleDark;
    hud.bezelView.style = LisztProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.layer.cornerRadius = 8.f;
    hud.offset = CGPointMake(0.f, -[UIApplication sharedApplication].statusBarFrame.size.height);
    hud.bezelView.color = [UIColor colorWithRed:0/255.f green:0/255.f blue:0/255.f alpha:0.9f];
    hud.label.font = [UIFont systemFontOfSize:16.f];
    hud.detailsLabel.font = [UIFont systemFontOfSize:14.f];
    hud.contentColor = [UIColor whiteColor];
    hud.animationType = LisztProgressHUDAnimationZoomOut;
    hud.margin = 15;
    return hud;
}

/** 文本提醒 */
- (void)showMessage:(NSString *)message canTouch:(BOOL)touch{
    [self showMessage:message canTouch:touch duration:1.f];
}
- (void)showMessage:(NSString *)message canTouch:(BOOL)touch duration:(NSTimeInterval)duration{
    [self showMessage:message canTouch:touch duration:duration complection:^{}];
}
- (void)showMessage:(NSString *)message canTouch:(BOOL)touch duration:(NSTimeInterval)duration complection:(LisztProgressHelpCompleteBlock)completion{
    LisztProgressHUD *hud = [self createHUD];
    hud.userInteractionEnabled = !touch;
    hud.mode = LisztProgressHUDModeText;
    hud.label.text = message;
    // Move to bottm center.
    [hud hideAnimated:YES afterDelay:duration];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if(completion){
            completion();
        }
    });
}

/** 加载中... */
- (void)showIndeterminateWithMessage:(NSString *)message canTouch:(BOOL)touch{
    [self showIndeterminateWithMessage:message canTouch:touch duration:10000];
}
- (void)showIndeterminateWithMessage:(NSString *)message canTouch:(BOOL)touch duration:(NSTimeInterval)duration{
    [self showIndeterminateWithMessage:message canTouch:touch duration:duration complection:^{}];
}
- (void)showIndeterminateWithMessage:(NSString *)message canTouch:(BOOL)touch duration:(NSTimeInterval)duration complection:(LisztProgressHelpCompleteBlock)completion{
    LisztProgressHUD *hud = [self createHUD];
    hud.userInteractionEnabled = !touch;
    hud.mode = LisztProgressHUDModeIndeterminate;
    hud.label.text = message;
    // Move to bottm center.
    [hud hideAnimated:YES afterDelay:duration];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if(completion){
            completion();
        }
    });
}

/** 加载成功 */
- (void)showSuccessWithMessage:(NSString *)message canTouch:(BOOL)touch{
    [self showSuccessWithMessage:message canTouch:touch duration:1.f];
}
- (void)showSuccessWithMessage:(NSString *)message canTouch:(BOOL)touch duration:(NSTimeInterval)duration{
    [self showSuccessWithMessage:message canTouch:touch duration:duration complection:^{}];
}
- (void)showSuccessWithMessage:(NSString *)message canTouch:(BOOL)touch duration:(NSTimeInterval)duration complection:(LisztProgressHelpCompleteBlock)completion{
    LisztProgressHUD *hud = [self createHUD];
    hud.userInteractionEnabled = !touch;
    hud.mode = LisztProgressHUDModeCustomView;
    UIImage *image = [UIImage imageNamed:@"liszthud_checkmark_icon"];
    hud.customView = [[UIImageView alloc] initWithImage:image];
    hud.label.text = message;
    [hud hideAnimated:YES afterDelay:duration];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if(completion){
            completion();
        }
    });
}

/** 加载失败 */
- (void)showErrorWithMessage:(NSString *)message canTouch:(BOOL)touch{
    [self showErrorWithMessage:message canTouch:touch duration:1.f];
}
- (void)showErrorWithMessage:(NSString *)message canTouch:(BOOL)touch duration:(NSTimeInterval)duration{
    [self showErrorWithMessage:message canTouch:touch duration:1.f complection:^{}];
}
- (void)showErrorWithMessage:(NSString *)message canTouch:(BOOL)touch duration:(NSTimeInterval)duration complection:(LisztProgressHelpCompleteBlock)completion{
    LisztProgressHUD *hud = [self createHUD];
    hud.userInteractionEnabled = !touch;
    hud.mode = LisztProgressHUDModeCustomView;
    UIImage *image = [UIImage imageNamed:@"liszthud_error_icon"];
    hud.customView = [[UIImageView alloc] initWithImage:image];
    hud.label.text = message;
    [hud hideAnimated:YES afterDelay:duration];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if(completion){
            completion();
        }
    });
}


@end
