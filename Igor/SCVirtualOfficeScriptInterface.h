/*
 * Sococo.h
 */

#import <AppKit/AppKit.h>
#import <ScriptingBridge/ScriptingBridge.h>


@class SococoApplication, SococoApplication;



/*
 * Standard Suite
 */

// The application's top level scripting object.
@interface SococoApplication : SBApplication

@property (copy, readonly) NSString *name;  // The name of the application.
@property (readonly) BOOL frontmost;  // Is this the frontmost (active) application?
@property (copy, readonly) NSString *version;  // The version of the application.

- (void) moveHome;  // Move to your home room
- (void) moveToRoom:(NSString *)toRoom;  // Move to the specified room
- (void) signinUsername:(NSString *)username password:(NSString *)password;  // Sign in to Sococo
- (void) signout;  // Sign out of the current space

@end



/*
 * Sococo Suite
 */

// Sococo application scripting
@interface SococoApplication (SococoSuite)

@property (copy, readonly) NSString *roomName;  // Current room name
@property (copy) NSString *statusMessage;  // Local user status message
@property BOOL busy;  // Local user busy indicator
@property BOOL headset;  // Headset status
@property BOOL microphone;  // Microphone status
@property BOOL camera;  // Video status

@end

