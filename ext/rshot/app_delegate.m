#include "app_delegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification*)notice
{
    NSLog(@"applicationDidFinishLaunching");
}

- (void)threadStart:(NSApplication*)application
{
    [application run];
}

@end