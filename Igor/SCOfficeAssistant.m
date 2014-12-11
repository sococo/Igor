//
//  SCOfficeAssistant.m
//  Igor
//
//  Created by Thaddeus Ternes on 12/11/14.
//  Copyright (c) 2014 Sococo. All rights reserved.
//

#import "SCOfficeAssistant.h"
#import "SCOfficeConnection.h"

#import "SCiTunesMusicPlayer.h"
#import "SCSpotifyMusicPlayer.h"
#import "SCRdioMusicPlayer.h"

static void *CONTEXT_OFFICE_ROOM_NAME=&CONTEXT_OFFICE_ROOM_NAME;
static void *CONTEXT_OFFICE_MEMBER_COUNT=&CONTEXT_OFFICE_MEMBER_COUNT;

@interface SCOfficeAssistant ()
@property (strong) SCOfficeConnection *office;
@property (strong) NSDictionary *musicPlayers;
@end

@implementation SCOfficeAssistant

- (void)hello
{
    // begin handling events
    self.office = [[SCOfficeConnection alloc] init];
    
    self.musicPlayers = @{
        @"iTunes" : [[SCiTunesMusicPlayer alloc] init],
        @"Spotify" : [[SCSpotifyMusicPlayer alloc] init],
        @"Rdio" : [[SCRdioMusicPlayer alloc] init]
    };
    
    [self.office addObserver:self forKeyPath:@"currentRoomName" options:NSKeyValueObservingOptionInitial|NSKeyValueObservingOptionNew context:CONTEXT_OFFICE_ROOM_NAME];
    [self.office addObserver:self forKeyPath:@"roomMemberCount" options:NSKeyValueObservingOptionInitial|NSKeyValueObservingOptionNew context:CONTEXT_OFFICE_MEMBER_COUNT];
}

- (void)goodbye
{
    // finish handling events
    [self.office removeObserver:self forKeyPath:@"roomMemberCount" context:CONTEXT_OFFICE_MEMBER_COUNT];
    [self.office removeObserver:self forKeyPath:@"currentRoomName" context:CONTEXT_OFFICE_ROOM_NAME];
    
    self.musicPlayers = nil;
    
    self.office = nil;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if(context == CONTEXT_OFFICE_ROOM_NAME)
    {
        NSLog(@"room name: %@", self.office.currentRoomName);
    }
    
    // cases where we want to modify music state
    if(context == CONTEXT_OFFICE_MEMBER_COUNT || context == CONTEXT_OFFICE_ROOM_NAME)
    {
        if(self.office.roomMemberCount > 1)
        {
            for(id<SCMusicPlayer> player in self.musicPlayers.allValues)
            {
                // pull the volume down
                [player setVolume:0.3];
                
                // or just pause altogether
                // [player pause];
            }
        }
        else
        {
            for(id<SCMusicPlayer> player in self.musicPlayers.allValues)
            {
                // play the music
                [player play];
                
                // at a comfortable level
                [player setVolume:0.8];
            }
        }
    }
}

@end
