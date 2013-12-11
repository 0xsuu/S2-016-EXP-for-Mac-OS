//
//  AppDelegate.m
//  S2-016-EXP
//
//  Created by sun on 12/1/13.
//  Copyright (c) 2013 suu. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    self.url.delegate = self;
}

- (IBAction)execute:(id)sender
{
    NSMutableArray *indexs = [[NSMutableArray alloc] init];
    int blankCount = 0;
    
    for(int i=1;i<=[self.command.stringValue length];i++)
    {//Analyse command string
        
        NSString *tempString = [[self.command.stringValue substringToIndex:i]substringFromIndex:(i-1)];
        
        if([tempString isEqualToString:@" "])
        
        {
            [indexs addObject:[NSString stringWithFormat:@"%d",i]];
            blankCount ++;
        }
    }
    
    NSLog(@"%@",indexs);
    NSLog(@"%d",blankCount);
    
    switch (blankCount)
    {
        case 0:
        {
            NSTask *task;
            task = [[NSTask alloc] init];
            [task setLaunchPath: @"/usr/bin/python"];
            
            NSString *resPath = [[NSBundle mainBundle] resourcePath];
            
            NSArray *arguments;
            arguments = [NSArray arrayWithObjects: [NSString stringWithFormat:@"%@%@",resPath,@"/S2-016-1.py"], self.url.stringValue, self.command.stringValue, nil];
            [task setArguments: arguments];
            
            NSPipe *pipe;
            pipe = [NSPipe pipe];
            [task setStandardOutput: pipe];
            
            NSFileHandle *file;
            file = [pipe fileHandleForReading];
            
            [task launch];
            
            NSData *data;
            data = [file readDataToEndOfFile];
            
            NSString *string;
            string = [[NSString alloc] initWithData: data
                                           encoding: NSUTF8StringEncoding];
            
            if (string == nil)
            {
                string = @"Nothing Returned";
            }
            
            [self.display setString:string];
        }
        
        break;
        
        case 1:
        {
            NSTask *task;
            task = [[NSTask alloc] init];
            [task setLaunchPath: @"/usr/bin/python"];
            
            NSString *resPath = [[NSBundle mainBundle] resourcePath];
            
            NSArray *arguments;
            arguments = [NSArray arrayWithObjects: [NSString stringWithFormat:@"%@%@",resPath,@"/S2-016-2.py"],
                         self.url.stringValue,
                         [self.command.stringValue substringToIndex:([[indexs objectAtIndex:0] intValue] - 1)],
                          [self.command.stringValue substringFromIndex:[[indexs objectAtIndex:0] intValue]], nil];
            [task setArguments: arguments];
            
            NSPipe *pipe;
            pipe = [NSPipe pipe];
            [task setStandardOutput: pipe];
            
            NSFileHandle *file;
            file = [pipe fileHandleForReading];
            
            [task launch];
            
            NSData *data;
            data = [file readDataToEndOfFile];
            
            NSString *string;
            string = [[NSString alloc] initWithData: data
                                           encoding: NSUTF8StringEncoding];
            
            if (string == nil)
            {
                string = @"Nothing Returned";
            }
            
            [self.display setString:string];
        }
        
        break;
        
        case 2:
        {
            NSTask *task;
            task = [[NSTask alloc] init];
            [task setLaunchPath: @"/usr/bin/python"];
            
            NSString *resPath = [[NSBundle mainBundle] resourcePath];
            
            NSArray *arguments;
            arguments = [NSArray arrayWithObjects: [NSString stringWithFormat:@"%@%@",resPath,@"/S2-016-3.py"],
                         self.url.stringValue,
                         [self.command.stringValue substringToIndex:([[indexs objectAtIndex:0] intValue] - 1)],
                         [self.command.stringValue substringWithRange:NSMakeRange([[indexs objectAtIndex:0] intValue],
                                                                                  self.command.stringValue.length - [[indexs objectAtIndex:1] intValue])],
                         [self.command.stringValue substringFromIndex:[[indexs objectAtIndex:1] intValue]], nil];
            
            [task setArguments: arguments];
            NSLog(@"%@",arguments);
            
            NSPipe *pipe;
            pipe = [NSPipe pipe];
            [task setStandardOutput: pipe];
            
            NSFileHandle *file;
            file = [pipe fileHandleForReading];
            
            [task launch];
            
            NSData *data;
            data = [file readDataToEndOfFile];
            
            NSString *string;
            string = [[NSString alloc] initWithData: data
                                           encoding: NSUTF8StringEncoding];
            
            if (string == nil)
            {
                string = @"Nothing Returned";
            }
            
            [self.display setString:string];
        }
        
        break;
        
        default:
        break;
    }
}
    
- (IBAction)getWebPath:(id)sender
{
    NSTask *task;
    task = [[NSTask alloc] init];
    [task setLaunchPath: @"/usr/bin/python"];
    
    NSString *resPath = [[NSBundle mainBundle] resourcePath];
    
    NSArray *arguments;
    arguments = [NSArray arrayWithObjects: [NSString stringWithFormat:@"%@%@",resPath,@"/S2-016-GetWebPath.py"], self.url.stringValue, nil];
    [task setArguments: arguments];
    
    NSPipe *pipe;
    pipe = [NSPipe pipe];
    [task setStandardOutput: pipe];
    
    NSFileHandle *file;
    file = [pipe fileHandleForReading];
    
    [task launch];
    
    NSData *data;
    data = [file readDataToEndOfFile];
    
    NSString *string;
    string = [[NSString alloc] initWithData: data
                                   encoding: NSUTF8StringEncoding];
    
    if (string == nil)
    {
        string = @"Nothing Returned";
    }
    
    [self.display setString:string];
}
    
- (void)controlTextDidEndEditing:(NSNotification *)obj
{/*
    if ([[obj object] isEqual:self.url] && [[[obj userInfo] objectForKey:@"NSTextMovement"] intValue] == NSReturnTextMovement)
    {//url
        [self getWebPath:nil];
    }
    
    if ([[obj object] isEqual:self.command] && [[[obj userInfo] objectForKey:@"NSTextMovement"] intValue] == NSReturnTextMovement)
    {//command
        [self execute:nil];
    }*/
}

@end
