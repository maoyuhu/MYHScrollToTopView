//
//  MYHToTopView.m
//  划到顶部test
//
//  Created by myh on 16/6/28.
//  Copyright © 2016年 myh. All rights reserved.
//

#import "MYHScrollToTopView.h"
#import <UIKit/UIKit.h>
@implementation MYHScrollToTopView

static UIWindow *window;

+ (void)initialize{
    
    window = [[UIWindow alloc]init];
    window.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20);
    window.backgroundColor = [UIColor clearColor];
    window.windowLevel = UIWindowLevelAlert;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(click)];
    [window addGestureRecognizer:tap];
    
    
}


+ (void)show{
    
    window.hidden = NO;
    
}
+ (void)click{
    
    UIWindow *keywindow = [UIApplication sharedApplication].keyWindow;
    [self searScrollViewInView:keywindow];
    
}

+ (void)searScrollViewInView:(UIView *)superView{
    
    //  窗口的window的bounds
    CGRect windowBounds = [UIApplication sharedApplication].keyWindow.bounds;
    for (UIScrollView *sc in superView.subviews) {
        // 得到subview在窗口中得frame 把subview.superview转到window frame上 nil = window
        CGRect newFrame = [sc.superview convertRect:sc.frame toView:nil];
        
        BOOL isShowInWindow = !sc.isHidden && sc.alpha > 0.01 && CGRectIntersectsRect(newFrame, windowBounds) && sc.window == [UIApplication sharedApplication].keyWindow;
        
        if ([sc isKindOfClass:[UIScrollView class]]&&isShowInWindow) {
            CGPoint offset = sc.contentOffset;
            offset.y = -sc.contentInset.top;
            [sc setContentOffset:offset animated:YES];
        }
        // 利用递归思想遍历
        [self searScrollViewInView:sc];
    }
}

@end
