//
//  SCMusicPlayer.h
//  Igor
//
//  Created by Thaddeus Ternes on 12/11/14.
//  Copyright (c) 2014 Sococo. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Describes a music application that is capable of receiving commands, as well as notifying applications of playback status changes.
 */
@protocol SCMusicPlayer <NSObject>

/**
 *  Play current / next track (exact behavior defined by the scripting interface of the application)
 */
- (void)play;

/**
 *  Pause current music track
 */
- (void)pause;

/**
 *  Set playback volume of music application. May be no-op if the application doesn't support volume control
 *
 *  @param volume 0.0f - 1.0f where 0.0 is muted and 1.0f is full volume
 */
- (void)setVolume:(CGFloat)volume;

@end

/**
 *  Events sent by a music player (object conforming to SCMusicPlayer) to notify of music playback changes
 */
@protocol SCMusicPlayerDelegate <NSObject>

- (void)musicPlayer:(id)player startTrack:(NSString *)trackName byArtist:(NSString *)artistName withInfo:(id)info;

@end