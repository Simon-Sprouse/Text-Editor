#import "AppDelegate.h"

@implementation AppDelegate

// LIFECYCLE METHOD - Called by NSApp when app is ready to run
- (void) applicationDidFinishLaunching:(NSNotification *)notification {
    NSRect frame = NSMakeRect(200, 200, 800, 600);

    self.window = [[NSWindow alloc]
        initWithContentRect:frame 
        styleMask:( 
            NSWindowStyleMaskTitled |
            NSWindowStyleMaskClosable | 
            NSWindowStyleMaskResizable
        ) 
        backing:NSBackingStoreBuffered
        defer:NO
    ];

    [self.window setTitle:@"Simple Text Editor"];
    [self.window makeKeyAndOrderFront:nil];
}


// LIFECYCLE METHOD - Called by NSApp when last window is closed
- (BOOL) applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
return YES;
}

@end