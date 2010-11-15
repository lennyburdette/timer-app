//
//  DetailViewController.h
//  timer
//
//  Created by Lenny Burdette on 11/14/10.
//  Copyright 2010 Lenny Burdette. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DetailViewController : UITableViewController {
	NSString *filePath;
	NSArray *steps;
}

@property (nonatomic, retain) NSString *filePath;
@property (nonatomic, retain) NSArray *steps;

- (void)getStepsFromFile:(NSString *)path;

@end
