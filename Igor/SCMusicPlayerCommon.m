//
//  SCMusicPlayerCommon.m
//  Igor
//
//  Created by Thaddeus Ternes on 12/11/14.
//  Copyright (c) 2014 Sococo. All rights reserved.
//

#import "SCMusicPlayerCommon.h"

@implementation SCMusicPlayerCommon

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        NSString *playerStateNotificationName = [self playerStateNotificationName];
        if(playerStateNotificationName)
        {
            [[NSDistributedNotificationCenter defaultCenter] addObserver:self
                                                                selector:@selector(playerStateChangedNotification:)
                                                                    name:playerStateNotificationName
                                                                  object:nil
                                                      suspensionBehavior:NSNotificationSuspensionBehaviorDeliverImmediately];
        }
    }
    return self;
}

- (void)dealloc
{
    if([self playerStateNotificationName])
    {
        [[NSDistributedNotificationCenter defaultCenter] removeObserver:self];
    }
}

#pragma mark - Play State Notifications

- (NSString *)playerStateNotificationName
{
    return nil;
}

- (void)playerStateChangedNotification:(NSNotification *)notification
{
    // implement in subclasses
}

#pragma mark - SCMusicPlayer

- (void)play
{
    // implement in subclasses
}

- (void)pause
{
    // implement in subclasses
}

- (void)setVolume:(CGFloat)volume
{
    // implement in subclasses
}



@end
