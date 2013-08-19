//
//  ViewController.m
//  NickOfTime-PressTheButton-Game2
//
//  Created by Yaniv Kerem on 8/16/13.
//  Copyright (c) 2013 Norm Gershon. All rights reserved.
//

#import "ColorButtons.h"
#import "ViewController.h"

@interface ViewController ()
{
    int gameCounter;
    UIColor *color1;
    UIColor *color2;
    UIColor *color3;
    UIColor *color4;
    UIColor *color5;
    UIColor *color6;
    UIColor *color7;
    UIColor *color8;
    UIColor *color9;
    UIColor *black;
    NSArray *colorArray;
    NSMutableArray *randomColorArray;
    __weak IBOutlet UILabel *notificationLabel;
    
}
- (IBAction)startDemoGame2:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    color1 =[UIColor colorWithRed:13/255.0f green:168/255.0f blue:185/255.0f alpha:1.0f];
    color2 =[UIColor colorWithRed:255/255.0f green:60/255.0f blue:75/255.0f alpha:1.0f];
    color3 =[UIColor colorWithRed:62/255.0f green:243/255.0f blue:73/255.0f alpha:1.0f];
    color4 =[UIColor colorWithRed:57/255.0f green:247/255.0f blue:252/255.0f alpha:1.0f];
    color5 =[UIColor colorWithRed:234/255.0f green:33/255.0f blue:209/255.0f alpha:1.0f];
    color6 =[UIColor colorWithRed:239/255.0f green:188/255.0f blue:78/255.0f alpha:1.0f];
    color7 =[UIColor colorWithRed:135/255.0f green:32/255.0f blue:192/255.0f alpha:1.0f];
    color8 =[UIColor colorWithRed:135/255.0f green:252/255.0f blue:192/255.0f alpha:1.0f];
    color9 =[UIColor colorWithRed:151/255.0f green:168/255.0f blue:49/255.0f alpha:1.0f];
    black = [UIColor blackColor];
    colorArray = @[color1,color2,color3,color4,color5,color6,color7,color8,color9];
    
    [super viewDidLoad];
	
    for (UIView * subview in self.view.subviews){
        if ([subview isKindOfClass:[ColorButtons class]]) {
            ColorButtons * colorButton = (ColorButtons *) subview;
            colorButton.pressButtonsDelegate = self;
        }}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)startDemoGame2:(id)sender
{
    gameCounter = 0;
    //playColorArray = [[NSMutableArray alloc] initWithArray:colorArray];
    for (UIView * subview in self.view.subviews){
        if ([subview isKindOfClass:[ColorButtons class]]){
            [subview setAlpha:1.0];
            ColorButtons *view = (ColorButtons*) subview;
            view.layer.borderWidth = 2;
            view.layer.cornerRadius = 40;
            [UIView animateWithDuration:0.0 animations:^{
                subview.transform = CGAffineTransformScale(subview.transform, 0.01, 0.01);
                
            }]; 
        }}
    notificationLabel.text = @"Extinguish all the lights";
    NSMutableArray* gameColorArray = [[NSMutableArray alloc] initWithArray:colorArray];
    randomColorArray = [[NSMutableArray alloc] initWithCapacity:10];
    for (int num = 0; num < ([colorArray count]); num++) {
        int colorCounter = arc4random()%([colorArray count]-num);
        //int altCounter = arc4random()%(3-num);
        [randomColorArray addObject:gameColorArray[colorCounter]];
        [gameColorArray removeObjectAtIndex:colorCounter];
        NSLog(@" playcolorarray %lu",(unsigned long)[randomColorArray count]);
    }
    for (UIView * subview in self.view.subviews){
        for (int counter = 0; counter < [colorArray count]; counter++) {
            if ([subview isKindOfClass:[ColorButtons class]]){
                if (subview.tag == counter){
                    subview.backgroundColor = randomColorArray[counter];
                   [UIView animateWithDuration:1.0 animations:^{
                        subview.transform = CGAffineTransformScale(subview.transform, 100, 100);
                    }]; 
                    
                }
            }
        }
    }
}

-(void) didClickGame2View: (ColorButtons *) thisView
{
    for (UIView * subview in self.view.subviews){
            if ([subview isKindOfClass:[ColorButtons class]]){
                [subview.layer removeAllAnimations];}}
    if (thisView.backgroundColor != black) {
        //thisView.backgroundColor = black;
        [randomColorArray replaceObjectAtIndex:thisView.tag withObject:black];
        gameCounter++;
        
        if (gameCounter == colorArray.count) {
            notificationLabel.text = @"Winner, winner!";

            
            
        }//Add for continuous shuffle
        else{
            [self shuffleLights];
        }
    }//comment out all below and use shuffle lights method for continuous shuffle
    //NSMutableArray *playColorArray = [[NSMutableArray alloc] initWithArray:randomColorArray];
    for (NSInteger i = randomColorArray.count-1; i > 0; i--)
    {
        [randomColorArray exchangeObjectAtIndex:i withObjectAtIndex:arc4random_uniform(i+1)];
    }
    //NSLog(@"%@,%@", playColorArray[0], playColorArray[8]);
    for (UIView * subview in self.view.subviews){
        for (int counter = 0; counter < [colorArray count]; counter++) {
            if ([subview isKindOfClass:[ColorButtons class]]){
                if (subview.tag == counter){
                    subview.backgroundColor = randomColorArray[counter];
                }}}}
    
}
-(void)shuffleLights
{
    
    [UIView animateWithDuration:0.0 delay:0.5 options:0 animations:^{
        NSMutableArray *playColorArray = [[NSMutableArray alloc] initWithArray:randomColorArray];
        for (NSInteger i = playColorArray.count-1; i > 0; i--)
        {
            [playColorArray exchangeObjectAtIndex:i withObjectAtIndex:arc4random_uniform(i+1)];
        }
        //NSLog(@"%@,%@", playColorArray[0], playColorArray[8]);
        for (UIView * subview in self.view.subviews){
            for (int counter = 0; counter < [colorArray count]; counter++) {
                if ([subview isKindOfClass:[ColorButtons class]]){
                    if (subview.tag == counter){
                        subview.backgroundColor = playColorArray[counter];
                    }}}}
        
    }completion:^(BOOL finished) {
        [self shuffleLights];
    }];
    

}

@end
