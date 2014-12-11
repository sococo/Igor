//
//  SCSpotifyMusicPlayer.m
//  Igor
//
//  Created by Thaddeus Ternes on 12/11/14.
//  Copyright (c) 2014 Sococo. All rights reserved.
//

#import "SCSpotifyMusicPlayer.h"
#import "SCSpotifyScriptInterface.h"

@interface SCSpotifyMusicPlayer ()
@property (strong) SpotifyApplication *spotify;
@end

@implementation SCSpotifyMusicPlayer

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        self.spotify = [SBApplication applicationWithBundleIdentifier:@"com.spotify.client"];
    }
    
    return self;
}

- (void)dealloc
{
    self.spotify = nil;
}

#pragma mark - SCMusicPlayer

- (void)play
{
    if([self.spotify isRunning])
    {
        [self.spotify play];
    }
}

- (void)pause
{
    if([self.spotify isRunning])
    {
        [self.spotify pause];
    }
}

- (void)setVolume:(CGFloat)volume
{
    if([self.spotify isRunning])
    {
        [self.spotify setSoundVolume:(volume * 100)];
    }
}

@end
