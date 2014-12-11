//
//  SCiTunesMusicPlayer.m
//  Igor
//
//  Created by Thaddeus Ternes on 12/11/14.
//  Copyright (c) 2014 Sococo. All rights reserved.
//

#import "SCiTunesMusicPlayer.h"
#import "SCiTunesScriptInterface.h"

@interface SCiTunesMusicPlayer ()
@property (strong) iTunesApplication *itunes;
@end

@implementation SCiTunesMusicPlayer

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        self.itunes = [SBApplication applicationWithBundleIdentifier:@"com.apple.iTunes"];
    }
    
    return self;
}

- (void)dealloc
{
    self.itunes = nil;
}

#pragma mark - SCMusicPlayer

- (void)play
{
    if([self.itunes isRunning])
    {
        if([self.itunes playerState] != iTunesEPlSPlaying)
            [self.itunes playpause];
    }
}

- (void)pause
{
    if([self.itunes isRunning])
    {
        if([self.itunes playerState] == iTunesEPlSPlaying)
            [self.itunes playpause];
    }
}

- (void)setVolume:(CGFloat)volume
{
    if([self.itunes isRunning])
    {
        [self.itunes setSoundVolume:(volume * 100)];
    }
}

@end
