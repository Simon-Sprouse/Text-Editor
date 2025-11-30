#import <Cocoa/Cocoa.h>
#import "AppDelegate.h"

int main(int argc, const char* argv[]) { 

    // for memory management
    @autoreleasepool { 

        // set up NSApplication singleton
        [NSApplication sharedApplication];
        [NSApp setActivationPolicy:NSApplicationActivationPolicyRegular];

        // create app delegate object (to handle events)
        AppDelegate* delegate = [[AppDelegate alloc] init];
        [NSApp setDelegate:delegate];

        // activate app and start main event loop
        [NSApp activateIgnoringOtherApps:YES];
        [NSApp run];

    }

    return 0;
}