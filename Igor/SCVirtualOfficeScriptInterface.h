/*
 * Sococo.h
 */

#import <AppKit/AppKit.h>
#import <ScriptingBridge/ScriptingBridge.h>


@class SococoApplication, SococoApplication;



/*
 * Sococo Suite
 */

// Sococo application scripting
@interface SococoApplication : SBObject

@property (copy, readonly) NSString *roomName;  // Current room name
@property (copy) NSString *statusMessage;  // Local user status message
@property BOOL busy;  // Local user busy indicator
@property BOOL headset;  // Headset status
@property BOOL microphone;  // Microphone status
@property BOOL camera;  // Video status


@end



/*
 * Standard Suite
 */

@interface SococoApplication (StandardSuite)

@end

