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
	
	
	NSArray* segmentItems = [NSArray arrayWithObjects:@"Vertical", @"Horizontal", nil];
	UISegmentedControl* segmentControl = [[UISegmentedControl alloc] initWithItems:segmentItems];

	[segmentControl setFrame:CGRectMake(50, 100, 200, 50)];
	[segmentControl setSegmentedControlStyle:UISegmentedControlStyleBordered];
	[segmentControl setSelectedSegmentIndex:0];
	
	[segmentControl addTarget:self
					   action:@selector(directionButtonChanged:)
			 forControlEvents:UIControlEventValueChanged];
	
	[self.view addSubview:segmentControl];
	[segmentControl release];
	
	
	
	UISlider* slider = [[UISlider alloc] initWithFrame:CGRectMake(50, 170, 200, 50)];

	[slider addTarget:self
			   action:@selector(sliderChanged:)
	 forControlEvents:UIControlEventValueChanged];
	
	[self.view addSubview:slider];

	
	_labelTime = [[UILabel alloc] initWithFrame:CGRectMake(50, 230, 200, 50)];
	[_labelTime setTextAlignment:UITextAlignmentCenter];
	[_labelTime setBackgroundColor:[UIColor clearColor]];
	_labelTime.text = [NSString stringWithString:[[NSNumber numberWithInt:([slider value] * 10)] stringValue]];
	[self.view addSubview:_labelTime];
	
	[slider release];
	
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void) directionButtonChanged:(UISegmentedControl*)sender
{
	_selectedDirection = [sender selectedSegmentIndex];
}

- (void) sliderChanged:(UISlider*)sender
{
	NSNumber* value = [NSNumber numberWithInt:([sender value] * 10)];
	
	_labelTime.text = [value stringValue];
	_selectedInterval = [value intValue];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)show:(id)sender {
	[JWStatusBarAlert showStatusMessage:@"Maecenas faucibus mollis interdum."
						   whthDuration:_selectedInterval
						  withAnimation:_selectedDirection];
}
@end
