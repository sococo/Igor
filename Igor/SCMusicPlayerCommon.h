//
//  SCMusicPlayerCommon.h
//  Igor
//
//  Created by Thaddeus Ternes on 12/11/14.
//  Copyright (c) 2014 Sococo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SCMusicPlayer.h"

@interface SCMusicPlayerCommon : NSObject <SCMusicPlayer>

@property (weak) id<SCMusicPlayerDelegate> delegate;

/**
 *  Name of the distributed notification that should be observed. Subclasses should implement this and return the appropriate value for their application.
 *  The default implementation returns nil, which prevents any observation from occurring (-playerStateChangedNotification: will never be sent).
 *
 *  @return NSDistributedNotificationCenter notification name (e.g. @"com.apple.iTunes.playerInfo" for iTunes)
 */
- (NSString *)playerStateNotificationName;

/**
 *  Sent when the playback state of the music application changes. Subclasses should implement this to notify the delegate of playback changes.
 *  In order for this message to be sent, subclasses my implement -playerStateNotificationName:.
 *
 *  @param notification Application-specific notification details (userInfo will vary for each player)
 */
- (void)playerStateChangedNotification:(NSNotification *)notification;

@end
