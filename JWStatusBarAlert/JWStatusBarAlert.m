//
//  JWStatusBarAlert.m
//  JWStatusBarAlert
//
//  Created by 지웅 허 on 12. 6. 12..
//  Copyright (c) 2012년 SELab. All rights reserved.
//

#import "JWStatusBarAlert.h"

@implementation JWStatusBarAlert

- (void) dealloc
{
	[_statusMsgLabel release];
	_statusMsgLabel = nil;
	
	[super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.windowLevel = UIWindowLevelStatusBar + 1.0f;
		self.frame = [UIApplication sharedApplication].statusBarFrame;
		self.backgroundColor = [UIColor blackColor];
		
		_statusMsgLabel = [[UILabel alloc] initWithFrame:self.frame];
		_statusMsgLabel.backgroundColor = [UIColor clearColor];
		_statusMsgLabel.textColor = [UIColor whiteColor];
		_statusMsgLabel.font = [UIFont boldSystemFontOfSize:11.0f];
		_statusMsgLabel.textAlignment = UITextAlignmentCenter;
		[self addSubview:_statusMsgLabel];
    }
    return self;
}



- (void) showStatusMessage:(NSString*) message withAnimation:(JWStatusBarAlertAnimation)animation;
{
	self.hidden = NO;
	self.alpha = 1.0f;
	_statusMsgLabel.text = @"";
	
	CGSize totalSize = self.frame.size;

	CGRect startFrame;
	CGRect endFrame;
	
	if (animation == JWStatusBarAlertAnimationVerticalSlide) {
		startFrame = (CGRect){self.frame.origin, totalSize.width, 0};
		endFrame = (CGRect){ self.frame.origin, totalSize};
	}
	else if (animation == JWStatusBarAlertAnimationHorizontalSlide) {
		startFrame = (CGRect){self.frame.origin, 0, totalSize.height};
		endFrame = (CGRect){ self.frame.origin, totalSize};
	}
	
	self.frame = startFrame;
	
	[UIView animateWithDuration:0.5f
					 animations:^{
						 self.frame = endFrame;
					 }
					 completion:^(BOOL finished){
						  _statusMsgLabel.text = message;
					 }];
}


- (void) hide;
{
	self.alpha = 1.0f;
	//CGSize totalSize = self.frame.size;
	[UIView animateWithDuration:0.5f
					 animations:^{
						 //self.frame = (CGRect){self.frame.origin, totalSize.width, 0};
						 self.alpha = 0.0f;
					 }
					 completion:^(BOOL finished){
						 _statusMsgLabel.text = @"";
						 self.hidden = YES;
					}];;
}

+ (JWStatusBarAlert *) showStatusMessage:(NSString *)message whthDuration:(NSTimeInterval)duration withAnimation:(JWStatusBarAlertAnimation) animation
{	
	JWStatusBarAlert* alert = [[JWStatusBarAlert alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
	
	[alert showStatusMessage:message withAnimation:animation];
	
	[alert performSelector:@selector(hide) withObject:nil afterDelay:duration];
	
	return [alert autorelease];
}

+ (JWStatusBarAlert *) showStatusMessage:(NSString*) message whthDuration:(NSTimeInterval)duration
{
	return [JWStatusBarAlert showStatusMessage:message
								  whthDuration:duration
								 withAnimation:JWStatusBarAlertAnimationVerticalSlide];
}

+ (JWStatusBarAlert *) showStatusMessage:(NSString*) message
{
	return [JWStatusBarAlert showStatusMessage:message
								  whthDuration:5
								 withAnimation:JWStatusBarAlertAnimationVerticalSlide];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
