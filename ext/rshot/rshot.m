#import "rshot.h"

@implementation RShot

@synthesize webView, path;

- (void)renderUrl:(NSString*)url toFile:(NSString*)file
{    
    NSRect rect = NSMakeRect(0, 0, 800, 600);
    NSWindow* window = [[NSWindow alloc]
        initWithContentRect: rect
        styleMask: NSBorderlessWindowMask
        backing: NSBackingStoreBuffered
        defer: NO];
    
    path = file;	
    webView = [[WebView alloc] initWithFrame: rect];
    [window setContentView: webView];
    [webView setFrameLoadDelegate: self];
    [[webView mainFrame] loadRequest: [NSURLRequest requestWithURL: [NSURL URLWithString: url]]];
}

- (void)webView:(WebView*)sender didFinishLoadForFrame:(WebFrame*)frame
{
    NSBitmapImageRep* bmp;
    NSView* view = [[[webView mainFrame] frameView] documentView];
    [[view window] setContentSize: [view bounds].size];
    [view lockFocus];

    bmp = [[NSBitmapImageRep alloc] initWithFocusedViewRect: [view bounds]];
    [view unlockFocus];
    NSLog(@"%@", path);
    [[bmp representationUsingType: NSPNGFileType properties: nil] writeToFile: path atomically: YES];
    
    [NSApp stop: self];
    longjmp(RShot_finishedEnv, 0);
}

- (void)webView:(WebView*)sender didFailProvisionalLoadWithError:(NSError*)error forFrame:(WebFrame*)frame
{
    NSLog(@"Error: %@", [error localizedDescription]);
}

- (void)webView:(WebView*)sender didFailLoadWithError:(NSError*)error forFrame:(WebFrame*)frame
{
    NSLog(@"Error: %@", [error localizedDescription]);
}

- (void)dealloc
{
    [webView release];
    [path release];
    [super dealloc];
}

@end