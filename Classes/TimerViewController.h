//
//  TimerViewController.h
//  timer
//
//  Created by Lenny Burdette on 11/14/10.
//  Copyright 2010 Lenny Burdette. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>


@interface TimerViewController : UIViewController {
	NSArray *steps;
	UILabel *label;
	UIProgressView *progressIndicator;
	
	int currentStepIndex;
	float progress;
	NSDate *zeroTime;
	NSTimer *timer;
	
	CFURLRef		soundFileURLRef;
	SystemSoundID	soundFileObject;
}

@property (nonatomic, retain) NSArray *steps;
@property (nonatomic, retain) IBOutlet UILabel *label;
@property (nonatomic, retain) IBOutlet UIProgressView *progressIndicator;
@property (nonatomic, retain) NSDate *zeroTime;
@property (nonatomic, retain) NSTimer *timer;

@property (readwrite)	CFURLRef		soundFileURLRef;
@property (readonly)	SystemSoundID	soundFileObject;

@end
