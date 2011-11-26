#include "setjmp.h"
#import <Foundation/Foundation.h>
#import <AppKit/NSBitmapImageRep.h>
#import <WebKit/WebKit.h>
#import <WebKit/WebView.h>
#import <WebKit/WebFrame.h>
#import <WebKit/WebFrameLoadDelegate.h>

extern jmp_buf RShot_finishedEnv;

@interface RShot : NSObject
{
	WebView* webView;
	NSString* path;
}

@property (retain) WebView* webView;
@property (retain) NSString* path;

- (void)renderUrl:(NSString*)url toFile:(NSString*)file;
- (void)webView:(WebView*)sender didFinishLoadForFrame:(WebFrame*)frame;
- (void)webView:(WebView*)sender didFailProvisionalLoadWithError:(NSError*)error forFrame:(WebFrame*)frame;
- (void)webView:(WebView*)sender didFailLoadWithError:(NSError*)error forFrame:(WebFrame*)frame;
- (void)dealloc;

@end