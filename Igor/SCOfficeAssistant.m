//
//  SCOfficeAssistant.m
//  Igor
//
//  Created by Thaddeus Ternes on 12/11/14.
//  Copyright (c) 2014 Sococo. All rights reserved.
//

#import "SCOfficeAssistant.h"
#import "SCOfficeConnection.h"

@interface SCOfficeAssistant ()
@property (strong) SCOfficeConnection *office;
@end

@implementation SCOfficeAssistant

- (void)hello
{
    // begin handling events
    self.office = [[SCOfficeConnection alloc] init];
}

- (void)goodbye
{
    // finish handling events
    self.office = nil;
}

@end
