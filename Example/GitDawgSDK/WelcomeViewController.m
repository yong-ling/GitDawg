#import "WelcomeViewController.h"
#import <React/RCTRootView.h>
#import <React/RCTBridgeDelegate.h>
#import <React/RCTBridge.h>

// Let this View Controller handle getting the URL for the JS
@interface WelcomeViewController () <RCTBridgeDelegate>
@end

@implementation WelcomeViewController

// Set self.view on the VC to be an RCTRootView
- (void)loadView
{
    RCTBridge *bridge = [[RCTBridge alloc] initWithDelegate:self launchOptions:@{}];
    self.view = [[RCTRootView alloc] initWithBridge:bridge
                                             moduleName:@"GitDawg"
                                    initialProperties:@{}];
}

// Just use our packaged JS for now
- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
    NSBundle *emissionBundle = [NSBundle bundleForClass:WelcomeViewController.class];
    return [emissionBundle URLForResource:@"GitDawg" withExtension:@"js"];
}

@end
