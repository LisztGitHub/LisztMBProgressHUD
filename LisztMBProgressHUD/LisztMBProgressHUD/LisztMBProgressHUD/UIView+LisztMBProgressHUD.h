//
//  UIView+LisztMBProgressHUD.h
//  LisztMBProgressHUD
//
//  Created by LaoDie on 2018/11/12.
//  Copyright © 2018 LisztMBProgressHUD. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^LisztProgressHelpCompleteBlock)(void);

@interface UIView (LisztMBProgressHUD)

/** 文本提醒 */
- (void)showMessage:(NSString *)message canTouch:(BOOL)touch;
- (void)showMessage:(NSString *)message canTouch:(BOOL)touch duration:(NSTimeInterval)duration;
- (void)showMessage:(NSString *)message canTouch:(BOOL)touch duration:(NSTimeInterval)duration complection:(LisztProgressHelpCompleteBlock)completion;

/** 加载中... */
- (void)showIndeterminateWithMessage:(NSString *)message canTouch:(BOOL)touch;
- (void)showIndeterminateWithMessage:(NSString *)message canTouch:(BOOL)touch duration:(NSTimeInterval)duration;
- (void)showIndeterminateWithMessage:(NSString *)message canTouch:(BOOL)touch duration:(NSTimeInterval)duration complection:(LisztProgressHelpCompleteBlock)completion;

/** 加载成功 */
- (void)showSuccessWithMessage:(NSString *)message canTouch:(BOOL)touch;
- (void)showSuccessWithMessage:(NSString *)message canTouch:(BOOL)touch duration:(NSTimeInterval)duration;
- (void)showSuccessWithMessage:(NSString *)message canTouch:(BOOL)touch duration:(NSTimeInterval)duration complection:(LisztProgressHelpCompleteBlock)completion;

/** 加载失败 */
- (void)showErrorWithMessage:(NSString *)message canTouch:(BOOL)touch;
- (void)showErrorWithMessage:(NSString *)message canTouch:(BOOL)touch duration:(NSTimeInterval)duration;
- (void)showErrorWithMessage:(NSString *)message canTouch:(BOOL)touch duration:(NSTimeInterval)duration complection:(LisztProgressHelpCompleteBlock)completion;

@end

NS_ASSUME_NONNULL_END
