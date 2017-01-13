//
//  AppDelegate.m
//  CCSpotlightDemo
//
//  Created by idechao on 2017/1/12.
//  Copyright © 2017年 idechao. All rights reserved.
//

#import "AppDelegate.h"
#import "CCSpotlight.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (BOOL)application:(nonnull UIApplication *)application continueUserActivity:(nonnull NSUserActivity *)userActivity restorationHandler:(nonnull void (^)(NSArray * _Nullable))restorationHandler {
    
    NSString *identifier = userActivity.userInfo[CCSpotlightIdentifier];
    
    NSString *str = [NSString stringWithFormat:@"item id is : %@", identifier];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"CCSpotlight" message:str preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:action];
    [self.window.rootViewController presentViewController:alert animated:YES completion:nil];
    
    return YES;
}

@end
