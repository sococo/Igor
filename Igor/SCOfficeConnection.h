//
//  SCOfficeConnection.h
//  Igor
//
//  Created by Thaddeus Ternes on 12/11/14.
//  Copyright (c) 2014 Sococo. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Manages connection to the virtual office application, including receiving events and status, and sending requests.
 */
@interface SCOfficeConnection : NSObject

@property (strong, readonly) NSString *currentRoomName;
@property (assign, readonly) NSUInteger roomMemberCount;

@end
