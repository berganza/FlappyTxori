//
//  Menu.m
//  FlappyTxori
//
//  Created by Berganza on 08/09/14.
//  Copyright (c) 2014 Berganza. All rights reserved.
//

#import "Menu.h"
#import "Juego.h"

    AVAudioPlayer * musicaInicial;

@implementation Menu

- (void)didMoveToView: (SKView *) view
{
    if (!self.creacionDeEscena)
    {
        // Método propio
        [self crearContenidoDeEscena];
        self.creacionDeEscena = YES;
        
        [self startMusica];
        
    }
}

// Selector de método propio para incorporar a la escena el contenido
- (void)crearContenidoDeEscena {
    
    //self.backgroundColor = [SKColor blueColor];
    SKSpriteNode * fondo =[SKSpriteNode spriteNodeWithImageNamed:@"ikurrina.png"];
    fondo.position = CGPointMake (CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    [self addChild:fondo];
    
    self.scaleMode = SKSceneScaleModeAspectFit;
    [self addChild:self.pantallaMenu];
    [self addChild:self.juego];
    [self addChild:self.creditos];
    
}

- (SKLabelNode *)pantallaMenu {
    SKLabelNode *pantallaMenu = [SKLabelNode labelNodeWithFontNamed:@"Futura-Medium"];
    pantallaMenu.text = @"Flappy Txori";
    pantallaMenu.fontSize = 30;
    pantallaMenu.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame) * 1/3 - 40);
    return pantallaMenu;
}

- (SKLabelNode *)juego {
    SKLabelNode *juego = [SKLabelNode labelNodeWithFontNamed:@"Futura-CondensedExtraBold"];
    juego.text = @"- Jugar";
    juego.fontSize = 20;
    juego.position = CGPointMake(CGRectGetMinX(self.frame)+250,CGRectGetMidY(self.frame) * 8/6);
    juego.name=@"juego";
    return juego;
    
    
}

- (SKLabelNode *) creditos {
    SKLabelNode * imagenCreditos = [SKLabelNode labelNodeWithFontNamed:@"Futura-CondensedExtraBold"];
    imagenCreditos.text = @"- Créditos";
    imagenCreditos.fontSize = 20;
    imagenCreditos.position = CGPointMake(CGRectGetMinX(self.frame)+250,CGRectGetMidY(self.frame) * 4/6);
    imagenCreditos.name = @"imagenCreditos";
    return imagenCreditos;
}





-(void) startMusica {
    
    
    NSURL * rutaMusica = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Euskara oi Euskara" ofType:@"m4a"]];
    musicaInicial = [[AVAudioPlayer alloc] initWithContentsOfURL:rutaMusica error:nil];
    
    [musicaInicial prepareToPlay];
    
    musicaInicial.numberOfLoops = 3;
    //[_backgroundAudioPlayer setVolume:1.0];
    [musicaInicial play];
}

-(void) stopMusica {
    
    [musicaInicial stop];
    
}









- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * toque = [touches anyObject];
    CGPoint tocarLabel = [toque locationInNode:self];
    SKNode * nodo = [self nodeAtPoint:tocarLabel];
    
    
    if ([nodo.name isEqualToString:@"juego"]) {
        
        SKTransition * transicion = [SKTransition doorsOpenVerticalWithDuration:2];
        Juego * escena1 = [Juego sceneWithSize:self.frame.size];
        [self.view presentScene:escena1 transition: transicion];
        
        [self stopMusica];
        
    }
    
    
    if ([nodo.name isEqualToString:@"imagenCreditos"]) {
        
        SKTransition * transicion = [SKTransition doorsOpenVerticalWithDuration:2];
        Creditos * escena2 = [Creditos sceneWithSize:self.frame.size];
        [self.view presentScene:escena2 transition: transicion];
        
        [self stopMusica];
        
    }
    
}




@end
