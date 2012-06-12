//
//  ViewController.m
//  JWStatusBarAlert
//
//  Created by 지웅 허 on 12. 6. 12..
//  Copyright (c) 2012년 SELab. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	_alert = [[JWStatusBarAlert alloc] initWithFrame:self.view.frame];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)show:(id)sender {
	
	//[_alert showStatusMessage:@"Maecenas faucibus mollis interdum."];
	[JWStatusBarAlert showStatusMessage:@"Hello World"];
	
}

- (IBAction)hide:(id)sender {
	[_alert hide];
}
@end
