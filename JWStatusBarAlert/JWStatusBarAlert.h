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

enum JWStatusBarAlertDirection {
	JWStatusBarAlertDirectionVertical = 0,
	JWStatusBarAlertDirectionHorizontal = 1
	};

@interface JWStatusBarAlert : UIWindow
{
	UILabel* _statusMsgLabel;
}

+ (JWStatusBarAlert *) showStatusMessage:(NSString*) message;


- (void) showStatusMessage:(NSString*) message;

//- (void) showStatusMessage:(NSString *)message withDirection:(NSNumber) direction;

- (void) hide;

@end
