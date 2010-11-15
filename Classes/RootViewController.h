//
//  RootViewController.h
//  timer
//
//  Created by Lenny Burdette on 11/14/10.
//  Copyright 2010 Lenny Burdette. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UITableViewController {
	NSArray *files;
}

@property (nonatomic, retain) NSArray *files;

@end
