//
//  AppDelegate.h
//  S2-016-EXP
//
//  Created by sun on 12/1/13.
//  Copyright (c) 2013 suu. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate, NSTextFieldDelegate>

@property (assign) IBOutlet NSWindow *window;

@property (weak) IBOutlet NSTextField *url;
@property (weak) IBOutlet NSTextField *command;
@property (strong) IBOutlet NSTextView *display;
    
    
@end
