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
@property (assign) NSUInteger roomMemberCount;
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

- (void)setStatusMessage:(NSString *)statusMessage
{
    if([self.sococoApp isRunning])
    {
        [self.sococoApp setStatusMessage:statusMessage];
    }
}

#pragma mark - Events

- (void)enteredRoomNotification:(NSNotification *)notification
{
    __unused NSArray *members = [notification.userInfo valueForKey:@"members"];

    NSString *roomName = notification.userInfo[@"name"];
    if(![self.currentRoomName isEqualToString:roomName])
        self.currentRoomName = roomName;
    
    if(self.roomMemberCount != members.count)
        self.roomMemberCount = members.count;
}

@end
