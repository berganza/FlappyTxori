//
//  Tximpum.h
//  FlappyTxori
//
//  Created by Imanol Terán on 10/09/14.
//  Copyright (c) 2014 Berganza. All rights reserved.
//


#import <SpriteKit/SpriteKit.h>
#import "CapaOverlay.h"

typedef NS_ENUM(NSUInteger, GameOverLayerButtonType)
{
    GameOverLayerPlayButton = 0
};


@protocol GameOverLayerDelegate;
@interface Tximpum : CapaOverlay
@property (nonatomic, assign) id<GameOverLayerDelegate> delegate;
@end


//**********************************************************************
@protocol GameOverLayerDelegate <NSObject>
@optional

- (void) gameOverLayer:(Tximpum*)sender tapRecognizedOnButton:(GameOverLayerButtonType) gameOverLayerButtonType;
@end