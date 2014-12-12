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

- (NSString *)playerStateNotificationName
{
    return @"com.apple.iTunes.playerInfo";
}

- (void)playerStateChangedNotification:(NSNotification *)notification
{
    // iTunes event includes the following userInfo:
    //    {
    //        Album = "This Is What We Believe (Deluxe Edition)";
    //        "Album Artist" = "Aaron Shust";
    //        "Album Rating" = 0;
    //        "Album Rating Computed" = 1;
    //        Artist = "Aaron Shust";
    //        "Artwork Count" = 1;
    //        Composer = "April Geesbreght";
    //        "Disc Count" = 2;
    //        "Disc Number" = 1;
    //        Genre = "Christian & Gospel";
    //        "Library PersistentID" = 1151968263003735445;
    //        Name = "My Hope Is In You";
    //        PersistentID = "-4706977198637229877";
    //        "Play Count" = 17;
    //        "Play Date" = "2013-08-28 00:58:08 +0000";
    //        "Player State" = Playing;
    //        "Playlist PersistentID" = 5295523809000774152;
    //        "Rating Computed" = 1;
    //        "Skip Count" = 1;
    //        "Skip Date" = "2013-08-28 00:23:09 +0000";
    //        "Store URL" = "itms://itunes.com/album?p=453886964&s=143441&i=453886967";
    //        "Total Time" = 254453;
    //        "Track Count" = 10;
    //        "Track Number" = 2;
    //        Year = 2011;
    //    }
    
    NSString *artist = [[self.itunes currentTrack] artist];
    NSString *track = [[self.itunes currentTrack] name];
    
    if([self.itunes playerState] == iTunesEPlSPlaying)
    {
        [self.delegate musicPlayer:self startTrack:track byArtist:artist withInfo:notification.userInfo];
    }
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
