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

@end
