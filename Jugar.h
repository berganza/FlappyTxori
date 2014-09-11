//
//  Jugar.h
//  FlappyBird
//
//  Created by Berganza on 08/09/14.
//  Copyright (c) 2014 Berganza. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "CapaOverlay.h"

typedef NS_ENUM(NSUInteger, StartGameLayerButtonType)
{
    StartGameLayerPlayButton = 0
};


@protocol StartGameLayerDelegate;
@interface Jugar : CapaOverlay
@property (nonatomic, assign) id<StartGameLayerDelegate> delegate;
@end


//**********************************************************************
@protocol StartGameLayerDelegate <NSObject>
@optional

- (void) startGameLayer:(Jugar*)sender tapRecognizedOnButton:(StartGameLayerButtonType) startGameLayerButton;
@end