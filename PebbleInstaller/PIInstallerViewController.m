//
//  PIInstallerViewController.m
//  PebbleInstaller
//
//  Created by Thomas Sarlandie on 1/15/14.
//  Copyright (c) 2014 Pebble. All rights reserved.
//

#import "PIInstallerViewController.h"

@interface PIInstallerViewController ()

@property (strong) UIDocumentInteractionController *uidocumentInteractionController;

@end

@implementation PIInstallerViewController

- (void) installPebbleApplication
{
    NSURL *pbwUrl = [[NSBundle mainBundle] URLForResource:@"simplicity" withExtension:@"pbw"];
    self.uidocumentInteractionController = [UIDocumentInteractionController interactionControllerWithURL:pbwUrl];
    self.uidocumentInteractionController.UTI = @"com.getpebble.bundle.watchface";
    self.uidocumentInteractionController.delegate = self;
    
    // presentOptionsMenu works all the time
    //[self.uidocumentInteractionController presentOptionsMenuFromRect:self.view.frame inView:self.view animated:YES];
    
    // presentOpenInMenu is better (only shows compatible apps) but only works
    // if the Pebble app is installed (so not in the simulator)
    [self.uidocumentInteractionController presentOpenInMenuFromRect:self.view.frame inView:self.view animated:YES];
    
    // For more information see presentOpenInMenuFromRect documentation:
    // https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIDocumentInteractionController_class/Reference/Reference.html#//apple_ref/doc/uid/TP40009304-CH1-SW13
}

- (void)viewDidAppear:(BOOL)animated
{
    [self installPebbleApplication];
}

@end
