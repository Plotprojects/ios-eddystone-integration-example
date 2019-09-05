//
//  AppDelegate.m
//  EddystoneExample
//
//  Copyright © 2019 Plot Projects. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //This method must be called before the end of the application:didFinishLaunchingWithOptions: method
    //initializes the Plot library:
    [Plot initializeWithDelegate:self];
    
    return YES;
}

@end
