//
//  SCOfficeAssistant.h
//  Igor
//
//  Created by Thaddeus Ternes on 12/11/14.
//  Copyright (c) 2014 Sococo. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Igor, the virtual office assistant, takes care of all the little nicetites that make your virtual office a pleasure to work in.
 */
@interface SCOfficeAssistant : NSObject

/**
 *  Tell your office assistant to being handling tasks in the office.
 */
- (void)hello;

/**
 *  Send your assistant home for the day.
 */
- (void)goodbye;

@end
