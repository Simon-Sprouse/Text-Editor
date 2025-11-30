#include <AppKit/AppKit.h>
#import <Cocoa/Cocoa.h>
#include <Foundation/Foundation.h>
#import "AppDelegate.h"

int main(int argc, const char* argv[]) { 

    // for memory management
    @autoreleasepool { 

        // set up NSApplication singleton
        [NSApplication sharedApplication];
        [NSApp setActivationPolicy:NSApplicationActivationPolicyRegular];

        // create app delegate object (to handle termination)
        AppDelegate* delegate = [[AppDelegate alloc] init];
        [NSApp setDelegate:delegate];

        // create view
        NSRect frame = NSMakeRect(200, 200, 800, 600);

        NSWindow* window = [[NSWindow alloc]
            initWithContentRect:frame 
            styleMask:( 
                NSWindowStyleMaskTitled |
                NSWindowStyleMaskClosable | 
                NSWindowStyleMaskResizable
            ) 
            backing:NSBackingStoreBuffered
            defer:NO
        ];

        [window setTitle:@"Simple Text Editor"];
        [window makeKeyAndOrderFront:nil];

        [NSApp activateIgnoringOtherApps:YES];

        [NSApp run];




    }
}