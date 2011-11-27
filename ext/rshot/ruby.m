#import <AppKit/AppKit.h>
#include <ruby/ruby.h>
#import "rshot.h"
#import "app_delegate.h"

jmp_buf RShot_finishedEnv;

static VALUE rb_cRShot = Qundef;
static VALUE RShot_alloc(VALUE class);
static void RShot_free(void* rshot);
static VALUE RShot_render_url(VALUE self, VALUE url, VALUE png);
static VALUE RShot_gogogo(VALUE self);
static NSAutoreleasePool* pool;
static NSThread* app_thread;
static AppDelegate* app_delegate;

void Init_rshot()
{
    pool = [[NSAutoreleasePool alloc] init];
    [NSApplication sharedApplication];
    app_delegate = [[AppDelegate alloc] init];
    [NSApp setDelegate: app_delegate];

    rb_cRShot = rb_define_class("RShot", rb_cObject);
    rb_define_alloc_func(rb_cRShot, RShot_alloc);
    rb_define_method(rb_cRShot, "render_url", RShot_render_url, 2);
}

static void RShot_free(void* rshot)
{
    [(RShot*)rshot release];
    [pool drain];
}

static VALUE RShot_alloc(VALUE class)
{
    RShot* rshot = [[RShot alloc] init];
    return Data_Wrap_Struct(class, 0, RShot_free, rshot);
}

static VALUE RShot_render_url(VALUE self, VALUE url, VALUE png)
{
    RShot* rshot;
    NSString* nsurl = [NSString stringWithUTF8String: rb_string_value_cstr(&url)];
    NSString* nspng = [NSString stringWithUTF8String: rb_string_value_cstr(&png)];
    Data_Get_Struct(self, RShot, rshot);
    [rshot renderUrl: nsurl toFile: nspng];
    if(!setjmp(RShot_finishedEnv)) {
        [NSApp run];
    }
    return Qtrue;
}