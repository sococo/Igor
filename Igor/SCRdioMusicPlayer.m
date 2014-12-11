//
//  SCRdioMusicPlayer.m
//  Igor
//
//  Created by Thaddeus Ternes on 12/11/14.
//  Copyright (c) 2014 Sococo. All rights reserved.
//

#import "SCRdioMusicPlayer.h"
#import "SCRdioScriptInterface.h"

@interface SCRdioMusicPlayer ()
@property (strong) RdioApplication *rdio;
@end

@implementation SCRdioMusicPlayer

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        self.rdio = [SBApplication applicationWithBundleIdentifier:@"com.rdio.desktop"];
    }
    
    return self;
}

- (void)dealloc
{
    self.rdio = nil;
}

#pragma mark - SCMusicPlayer

- (void)play
{
    if([self.rdio isRunning] && self.rdio.playerState != RdioEPSSPlaying)
    {
        [self.rdio playpause];
    }
}

- (void)pause
{
    if([self.rdio isRunning] && self.rdio.playerState == RdioEPSSPlaying)
    {
        [self.rdio pause];
    }
}

- (void)setVolume:(CGFloat)volume
{
    if([self.rdio isRunning])
    {
        [self.rdio setSoundVolume:(volume * 100)];
    }
}

@end
