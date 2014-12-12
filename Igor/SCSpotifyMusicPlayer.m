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

- (NSString *)playerStateNotificationName
{
    return @"com.spotify.client.PlaybackStateChanged";
}

- (void)playerStateChangedNotification:(NSNotification *)notification
{
    // Spotify user info:
    //    {
    //        Album = "No Funny Hats";
    //        "Album Artist" = "Buddy Rich";
    //        Artist = "Buddy Rich";
    //        "Disc Number" = 1;
    //        Duration = 241;
    //        "Has Artwork" = 1;
    //        Name = "Bugle Call Rag";
    //        "Play Count" = 4;
    //        "Playback Position" = 0;
    //        "Player State" = Playing;
    //        Popularity = 13;
    //        Starred = 0;
    //        "Track ID" = "spotify:track:6nt9JIYmlJkkiFLAVIGlxe";
    //        "Track Number" = 3;
    //    }
    
    // Spotify event includes details; we'll ask the script interface to avoid magic string here
    NSString *artist = [[self.spotify currentTrack] artist];
    NSString *track = [[self.spotify currentTrack] name];
    
    if([self.spotify playerState] == SpotifyEPlSPlaying)
    {
        [self.delegate musicPlayer:self startTrack:track byArtist:artist withInfo:notification.userInfo];
    }
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
