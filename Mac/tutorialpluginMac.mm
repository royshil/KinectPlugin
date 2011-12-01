/*
 *  tutorialpluginMac.mm
 *  FireBreath
 *
 *  Created by Roy Shilkrot on 11/30/11.
 *  Copyright 2011 MIT. All rights reserved.
 *
 */

#include "tutorialpluginMac.h"

#import <AppKit/AppKit.h>

#include "Mac/PluginWindowMac.h"
#include "Mac/PluginWindowMacQD.h"
#include "Mac/PluginWindowMacCG.h"
#include "Mac/PluginWindowMacCA.h"
#include "Mac/PluginWindowMacICA.h"

#include <iostream>
using namespace std;

#include "tutorialpluginMac.h"

void glutDisplay (void);

@interface MyCAOpenGLLayer : CAOpenGLLayer {
    GLfloat m_angle;
}
@end

@implementation MyCAOpenGLLayer

- (id) init {
    if ([super init]) {
        m_angle = 0;
    }
    return self;
}

- (void)drawInCGLContext:(CGLContextObj)ctx pixelFormat:(CGLPixelFormatObj)pf forLayerTime:(CFTimeInterval)t displayTime:(const CVTimeStamp *)ts {
    //m_angle += 1;
    GLsizei width = CGRectGetWidth([self bounds]), height = CGRectGetHeight([self bounds]);
    GLfloat halfWidth = width / 2, halfHeight = height / 2;
	
    glViewport(0, 0, width, height);

	glutDisplay(); //let NITE draw it's stuff
    
    [super drawInCGLContext:ctx pixelFormat:pf forLayerTime:t displayTime:ts];
}

@end

tutorialpluginMac::tutorialpluginMac() : m_layer(NULL) {}

tutorialpluginMac::~tutorialpluginMac()
{
    if (m_layer) {
        [(CALayer*)m_layer removeFromSuperlayer];
        [(CALayer*)m_layer release];
        m_layer = NULL;
    }
}

bool tutorialpluginMac::onWindowAttached(FB::AttachedEvent* evt, FB::PluginWindowMac* wnd)
{
	cout << "tutorialpluginMac::onWindowAttached" << endl;
    if (FB::PluginWindowMac::DrawingModelCoreAnimation == wnd->getDrawingModel() || 
		FB::PluginWindowMac::DrawingModelInvalidatingCoreAnimation == wnd->getDrawingModel()) 
	{
        cout << " Setup CAOpenGL drawing. "<<endl;
        MyCAOpenGLLayer* layer = [MyCAOpenGLLayer new];
        layer.asynchronous = (FB::PluginWindowMac::DrawingModelInvalidatingCoreAnimation == wnd->getDrawingModel()) ? NO : YES;
        layer.autoresizingMask = kCALayerWidthSizable | kCALayerHeightSizable;
        layer.needsDisplayOnBoundsChange = YES;
        m_layer = layer;
        if (FB::PluginWindowMac::DrawingModelInvalidatingCoreAnimation == wnd->getDrawingModel())
            wnd->StartAutoInvalidate(1.0/30.0);
        [(CALayer*) wnd->getDrawingPrimitive() addSublayer:layer];
	}
    return tutorialplugin::onWindowAttached(evt,wnd);
}

bool tutorialpluginMac::onWindowDetached(FB::DetachedEvent* evt, FB::PluginWindowMac* wnd)
{
    return tutorialplugin::onWindowDetached(evt,wnd);
}
