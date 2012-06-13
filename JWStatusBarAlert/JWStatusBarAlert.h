//
//  JWStatusBarAlert.h
//  JWStatusBarAlert
//
//  Created by 지웅 허 on 12. 6. 12..
//  Copyright (c) 2012년 SELab. All rights reserved.
//


/**
 @brief JWStatusBarAlert
 @author JWHeo(jwheo@selab.co.kr)
 @todo Class Method 추가, Animation에 대한 Customization 소스
 */

#import <UIKit/UIKit.h>

typedef enum 
{
	JWStatusBarAlertAnimationVerticalSlide = 0,
	JWStatusBarAlertAnimationHorizontalSlide = 1
} JWStatusBarAlertAnimation;

@interface JWStatusBarAlert : UIWindow
{
	UILabel* _statusMsgLabel;
	
}

+ (JWStatusBarAlert *) showStatusMessage:(NSString*) message;
+ (JWStatusBarAlert *) showStatusMessage:(NSString*) message whthDuration:(NSTimeInterval)duration;
+ (JWStatusBarAlert *) showStatusMessage:(NSString *)message whthDuration:(NSTimeInterval)duration withAnimation:(JWStatusBarAlertAnimation) animation;


- (void) showStatusMessage:(NSString*) message withAnimation:(JWStatusBarAlertAnimation) animation;

//- (void) showStatusMessage:(NSString *)message withDirection:(NSNumber) direction;

- (void) hide;

@end
