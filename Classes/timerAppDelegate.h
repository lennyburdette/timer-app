//
//  timerAppDelegate.h
//  timer
//
//  Created by Lenny Burdette on 11/14/10.
//  Copyright 2010 Lenny Burdette. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface timerAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

