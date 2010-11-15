//
//  TimerViewController.m
//  timer
//
//  Created by Lenny Burdette on 11/14/10.
//  Copyright 2010 Lenny Burdette. All rights reserved.
//

#import "TimerViewController.h"

@interface TimerViewController (Private)

- (void)start;
- (void)stop;
- (void)playSound;

@end


@implementation TimerViewController

@synthesize steps, label, progressIndicator, zeroTime, timer;
@synthesize soundFileURLRef;
@synthesize soundFileObject;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

- (void)start {
	currentStepIndex = 0;
	
	NSDictionary *currentStep = [steps objectAtIndex:currentStepIndex];
	NSNumber *duration = [currentStep objectForKey:@"Duration"];
	self.zeroTime = [NSDate dateWithTimeIntervalSinceNow:[duration doubleValue]];
	
	self.timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(onTimer:) userInfo:nil repeats:YES];
}

- (void)stop {
	if ([timer isValid]) {
		[timer invalidate];
	}
}

- (void)onTimer:(NSTimer*)theTimer {
	NSDictionary *currentStep = [steps objectAtIndex:currentStepIndex];
	NSNumber *duration = [currentStep objectForKey:@"Duration"];
	
	if ([[zeroTime earlierDate:[NSDate date]] isEqualToDate:zeroTime]) {
		
		if (currentStepIndex + 1 >= [steps count]) {
			[self stop];
		} else {
			currentStepIndex = currentStepIndex + 1;
			
			currentStep = [steps objectAtIndex:currentStepIndex];
			duration = [currentStep objectForKey:@"Duration"];
			self.zeroTime = [NSDate dateWithTimeIntervalSinceNow:[duration doubleValue]];
			
			[self playSound];
		}
	}
	
	NSTimeInterval diff = [zeroTime timeIntervalSinceDate:[NSDate date]];
	progressIndicator.progress = 1.0 - (float)diff / [duration floatValue];
	label.text = [currentStep objectForKey:@"Title"];
}

- (void)playSound {
	if (! soundFileObject) {
		// Create the URL for the source audio file. The URLForResource:withExtension: method is
		//    new in iOS 4.0.
		NSURL *tapSound   = [[NSBundle mainBundle] URLForResource: @"next" withExtension: @"mp3"];
		
		// Store the URL as a CFURLRef instance
		self.soundFileURLRef = (CFURLRef) [tapSound retain];
		
		// Create a system sound object representing the sound file.
		AudioServicesCreateSystemSoundID(soundFileURLRef, &soundFileObject);
	}
	AudioServicesPlaySystemSound (soundFileObject);
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	[self start];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewWillDisappear:(BOOL)animated {
	[self stop];
}

- (void)viewDidUnload {
    [super viewDidUnload];
	[self stop];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[steps release];
	[label release];
	[progressIndicator release];
	[zeroTime release];
	[timer release];
    [super dealloc];
}


@end
