//
//  ViewController.h
//  JWStatusBarAlert
//
//  Created by 지웅 허 on 12. 6. 12..
//  Copyright (c) 2012년 SELab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JWStatusBarAlert.h"

@interface ViewController : UIViewController
{
	NSInteger _selectedDirection;
	NSTimeInterval _selectedInterval;
	
	UILabel* _labelTime;
}
- (IBAction)show:(id)sender;

@end
