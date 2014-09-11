//
//  GameViewController.m
//  FlappyTxori
//
//  Created by Berganza on 08/09/14.
//  Copyright (c) 2014 Berganza. All rights reserved.
//

#import "GameViewController.h"
#import "Menu.h"
#import "Juego.h"


@implementation GameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Configurar la vista.
    SKView * skView = (SKView *)self.view;
    //skView.showsFPS = YES;
    //skView.showsNodeCount = YES;
    
    // SpriteKit aplica optimizaciones adicionales para mejorar el rendimieno del renderizado
    skView.ignoresSiblingOrder = YES;
    
    // Crear y configurar la vista
    Menu *pantallaMenu = [Menu sceneWithSize:skView.bounds.size];
    pantallaMenu.scaleMode = SKSceneScaleModeAspectFill;
    
    // Presentar la escena
    [skView presentScene:pantallaMenu];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Liberar caché, imágenes...etc, que no están en uso
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
