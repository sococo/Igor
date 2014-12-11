//
//  SCOfficeConnection.m
//  Igor
//
//  Created by Thaddeus Ternes on 12/11/14.
//  Copyright (c) 2014 Sococo. All rights reserved.
//

#import "SCOfficeConnection.h"
#import "SCVirtualOfficeScriptInterface.h"

#define kEnteredRoomEvent @"com.sococo.client.enteredRoom"

@interface SCOfficeConnection ()
@property (strong) SococoApplication *sococoApp;

@property (strong) NSString *currentRoomName;
@end

@implementation SCOfficeConnection

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        // register for office notifications
        [[NSDistributedNotificationCenter defaultCenter] addObserver:self
                                                            selector:@selector(enteredRoomNotification:)
                                                                name:kEnteredRoomEvent
                                                              object:nil
                                                  suspensionBehavior:NSNotificationSuspensionBehaviorDeliverImmediately];
        
        self.sococoApp = [SBApplication applicationWithBundleIdentifier:@"com.sococo.Sococo"];
        
        self.currentRoomName = self.sococoApp.roomName;
    }
    
    return self;
}

- (void)dealloc
{
    // unregister for notifications
    [[NSDistributedNotificationCenter defaultCenter] removeObserver:self name:kEnteredRoomEvent object:nil];
}


#pragma mark - Events

- (void)enteredRoomNotification:(NSNotification *)notification
{
    __unused NSArray *members = [notification.userInfo valueForKey:@"members"];

    self.currentRoomName = notification.userInfo[@"name"];
}

@end
