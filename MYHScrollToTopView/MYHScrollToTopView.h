//
//  MYHScrollToTopView.h
//  划到顶部test
//
//  Created by myh on 16/6/30.
//  Copyright © 2016年 myh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MYHScrollToTopView : NSObject


/**
 *  在appdelegate调用show 点击状态栏回到最顶部 ios9之后主窗口需要一个rootviewController 所以需要延迟加载 否则会崩溃
 */
+ (void)show;

@end