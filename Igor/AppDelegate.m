//
//  AppDelegate.m
//  Igor
//
//  Created by Thaddeus Ternes on 12/11/14.
//  Copyright (c) 2014 Sococo. All rights reserved.
//

#import "AppDelegate.h"
#import "SCOfficeAssistant.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (strong) SCOfficeAssistant *igor;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    self.igor = [[SCOfficeAssistant alloc] init];
    [self.igor hello];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification
{
    [self.igor goodbye];
    self.igor = nil;
}

@end
