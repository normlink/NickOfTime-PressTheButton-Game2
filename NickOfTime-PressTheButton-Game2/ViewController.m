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
{   //int clickCounter;
    int gameCounter;
    int distance;
    UIColor *color1;
    UIColor *color2;
    UIColor *color3;
    UIColor *color4;
    UIColor *color5;
    UIColor *color6;
    UIColor *color7;
    UIColor *color8;
    UIColor *color9;
    UIColor *color10;
    UIColor *black;
    UIView *button1;
    ColorButtons *button2;
    ColorButtons *button3;
    ColorButtons *button4;
    ColorButtons *button5;
    ColorButtons *button6;
    ColorButtons *button7;
    ColorButtons *button8;
    ColorButtons *button9;
    ColorButtons *button10;
    NSArray *colorArray;
    NSArray *buttonArray;
    NSMutableArray *randomColorArray;
    NSMutableArray *playColorArray;
    __weak IBOutlet UILabel *notificationLabel;
    __weak IBOutlet ColorButtons *buttonTest;
    
}

@property (nonatomic, assign) BOOL shouldAnimate;
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
//    color1 = [UIColor colorWithRed:242/255.0f green:71/255.0f blue:63/255.0f alpha:1.0];
//    color2 = [UIColor colorWithRed:140/255.0f green:93/255.0f blue:228/255.0f alpha:1.0];
//    color3 = [UIColor colorWithRed:255/255.0f green:20/255.0f blue:147/255.0f alpha:1.0];
//    color4 = [UIColor colorWithRed:139/255.0f green:117/255.0f blue:18/255.0f alpha:1.0];
//    color5 = [UIColor colorWithRed:247/255.0f green:145/255.0f blue:55/255.0f alpha:1.0];
//    color6 = [UIColor colorWithRed:138/255.0f green:54/255.0f blue:15/255.0f alpha:1.0];
//    color7 = [UIColor colorWithRed:1/255.0f green:152/255.0f blue:117/255.0f alpha:1.0];
//    color8 = [UIColor colorWithRed:112/255.0f green:219/255.0f blue:219/255.0f alpha:1.0];
     color10 =[UIColor colorWithRed:89/255.0f green:113/255.0f blue:173/255.0f alpha:1.0];
    black = [UIColor blackColor];
    colorArray = @[color1,color2,color3,color4,color5,color6,color7,color8,color9,color10];
    distance = 105;
    [super viewDidLoad];
    //CGPoint center = CGPointMake(CGRectGetMidX(self.view.frame), CGRectGetMidY(self.view.frame));
    CGPoint center = self.view.center;
    button1 = [[UIView alloc] initWithFrame: CGRectMake(center.x - 30, center.y - 20-30,70,70)];
   [self.view addSubview:button1];
    //button1.backgroundColor = color1;
    //button1.center = self.view.center;
   [button1 setCenter: self.view.center];

    button2 = [[ColorButtons alloc] initWithFrame: CGRectOffset(button1.frame, distance* cosf(1*(2*M_PI)/9), distance* sinf(1*(2*M_PI)/9))];
    button3 = [[ColorButtons alloc] initWithFrame: CGRectOffset(button1.frame, distance* cosf(2*(2*M_PI)/9), distance* sinf(2*(2*M_PI)/9))];
    button4 = [[ColorButtons alloc] initWithFrame: CGRectOffset(button1.frame, distance* cosf(3*(2*M_PI)/9), distance* sinf(3*(2*M_PI)/9))];
    button5 = [[ColorButtons alloc] initWithFrame: CGRectOffset(button1.frame, distance* cosf(4*(2*M_PI)/9), distance* sinf(4*(2*M_PI)/9))];
    button6 = [[ColorButtons alloc] initWithFrame: CGRectOffset(button1.frame, distance* cosf(5*(2*M_PI)/9), distance* sinf(5*(2*M_PI)/9))];
    button7 = [[ColorButtons alloc] initWithFrame: CGRectOffset(button1.frame, distance* cosf(6*(2*M_PI)/9), distance* sinf(6*(2*M_PI)/9))];
    button8 = [[ColorButtons alloc] initWithFrame: CGRectOffset(button1.frame, distance* cosf(7*(2*M_PI)/9), distance* sinf(7*(2*M_PI)/9))];
    button9 = [[ColorButtons alloc] initWithFrame: CGRectOffset(button1.frame, distance* cosf(8*(2*M_PI)/9), distance* sinf(8*(2*M_PI)/9))];
    button10 = [[ColorButtons alloc] initWithFrame: CGRectOffset(button1.frame, distance* cosf(9*(2*M_PI)/9), distance* sinf(9*(2*M_PI)/9))];
    [self.view addSubview:button10];
    //button10.backgroundColor = color10;
    
    buttonArray = [[NSArray alloc] initWithObjects:button2, button3, button4, button5, button6, button7, button8, button9, button10, nil];
    
//    NSLog(@"x%f, y%f", center.x, center.y);
    //ColorButtons *button1 = [[ColorButtons alloc] initWithFrame: CGRectMake (CGRectGetMidX(self.view.frame),CGRectGetMidY(self.view.frame),60,60)];
    
//    buttonTest.center = self.view.center;
//    buttonTest.backgroundColor = color1;
    
//    [UIView animateWithDuration:2.0 animations:^{
//        
//        button1.center = self.view.center;
//    }];
    for (ColorButtons* obj in buttonArray) {
        [self.view addSubview:obj];
    }
    
	   int element = 0;
    for (UIView * subview in self.view.subviews){
        if ([subview isKindOfClass:[ColorButtons class]]) {
         
            subview.tag = element;
            subview.backgroundColor = colorArray[element];
            element++;
            [subview setUserInteractionEnabled:YES];
            [subview setHidden:YES];
            [self.view addSubview:subview];
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
            view.layer.cornerRadius = 35;
            view.center = self.view.center;
            subview.transform = CGAffineTransformScale(subview.transform, 0.01, 0.01);
            [subview setHidden:NO];
            [UIView animateWithDuration:1.0 animations:^{
                subview.transform = CGAffineTransformScale(subview.transform, 100, 100);
                //button4.frame = CGRectOffset(button1.frame, distance * cosf(3*(2*M_PI)/9), distance * sinf(3*(2*M_PI)/9));
            }completion:^(BOOL finished) {
                [UIView animateWithDuration:1.0 animations:^{
                    //subview.transform = CGAffineTransformScale(subview.transform, 100, 100);
                    button4.frame = CGRectOffset(button1.frame, distance * cosf(3*(2*M_PI)/9), distance * sinf(3*(2*M_PI)/9));
                    button2.frame = CGRectOffset(button1.frame, distance* cosf(1*(2*M_PI)/9), distance* sinf(1*(2*M_PI)/9));
                    button3.frame = CGRectOffset(button1.frame, distance* cosf(2*(2*M_PI)/9), distance* sinf(2*(2*M_PI)/9));
                    button4.frame = CGRectOffset(button1.frame, distance * cosf(3*(2*M_PI)/9), distance * sinf(3*(2*M_PI)/9));
                    button5.frame = CGRectOffset(button1.frame, distance* cosf(4*(2*M_PI)/9), distance* sinf(4*(2*M_PI)/9));
                    button6.frame = CGRectOffset(button1.frame, distance* cosf(5*(2*M_PI)/9), distance* sinf(5*(2*M_PI)/9));
                    button7.frame = CGRectOffset(button1.frame, distance* cosf(6*(2*M_PI)/9), distance* sinf(6*(2*M_PI)/9));
                    button8.frame = CGRectOffset(button1.frame, distance* cosf(7*(2*M_PI)/9), distance* sinf(7*(2*M_PI)/9));
                    button9.frame = CGRectOffset(button1.frame, distance* cosf(8*(2*M_PI)/9), distance* sinf(8*(2*M_PI)/9));
                    button10.frame = CGRectOffset(button1.frame, distance* cosf(9*(2*M_PI)/9), distance* sinf(9*(2*M_PI)/9));
                
                                    }];
                 }];
            }
        }
    notificationLabel.text = @"Extinguish all the lights";
//    NSMutableArray* gameColorArray = [[NSMutableArray alloc] initWithArray:colorArray];
//    randomColorArray = [[NSMutableArray alloc] initWithCapacity:10];
//    for (int num = 0; num < ([colorArray count]); num++) {
//        int colorCounter = arc4random()%([colorArray count]-num);
//        //int altCounter = arc4random()%(3-num);
//        [randomColorArray addObject:gameColorArray[colorCounter]];
//        [gameColorArray removeObjectAtIndex:colorCounter];
//        //NSLog(@" randomcolorarray %lu",(unsigned long)[randomColorArray count]);
//    }
//    for (UIView * subview in self.view.subviews){
//        for (int counter = 0; counter < [colorArray count]; counter++) {
//            if ([subview isKindOfClass:[ColorButtons class]]){
//                if (subview.tag == counter){
//                  subview.backgroundColor = randomColorArray[counter];
//                    [UIView animateWithDuration:1.0 animations:^{
//                        subview.transform = CGAffineTransformScale(subview.transform, 100, 100);
//                    }];
//                    
//                }
//            }
//        }
//    }
}

-(void) didClickGame2View: (ColorButtons *) thisView
{
    if (thisView.backgroundColor != black) {
        //thisView.backgroundColor = black;
        playColorArray = [[NSMutableArray alloc] initWithArray:randomColorArray];
        [randomColorArray replaceObjectAtIndex:thisView.tag withObject:black];
        [playColorArray removeObjectAtIndex:thisView.tag];
        gameCounter++;
        
        if (gameCounter == colorArray.count) {
            notificationLabel.text = @"Winner, winner!";
        }
        
        
        
        //Add for continuous shuffle
        //        else{
        //            [self shuffleLights];
        //        }
        //comment out all below and use shuffle lights method for continuous shuffle
        //NSMutableArray *playColorArray = [[NSMutableArray alloc] initWithArray:randomColorArray];
        
        for (NSInteger i = playColorArray.count-1; i > 0; i--)
        {
            [playColorArray exchangeObjectAtIndex:i withObjectAtIndex:arc4random_uniform(i+1)];
            NSLog(@"%@, %i X", playColorArray[i], i);
        }
        [playColorArray insertObject:black atIndex:thisView.tag];
        
        //NSLog(@"%@,%@", playColorArray[0], playColorArray[8]);
        for (UIView * subview in self.view.subviews){
            for (int counter = 0; counter < [colorArray count]; counter++) {
                if ([subview isKindOfClass:[ColorButtons class]]){
                    if (subview.tag == counter){
                        subview.backgroundColor = playColorArray[counter];
                        NSLog(@"%@, %i F", playColorArray[counter], counter);
                    }}}}
        
        randomColorArray = playColorArray;
    }
}
//-(void)shuffleLights
//{
//    if (self.shouldAnimate == YES) {
//        [UIView animateWithDuration:0.0 delay:0.5 options:0 animations:^{
//            NSMutableArray *playColorArray = [[NSMutableArray alloc] initWithArray:randomColorArray];
//            for (NSInteger i = playColorArray.count-1; i > 0; i--)
//            {
//                [playColorArray exchangeObjectAtIndex:i withObjectAtIndex:arc4random_uniform(i+1)];
//            }
//            //NSLog(@"%@,%@", playColorArray[0], playColorArray[8]);
//            for (UIView * subview in self.view.subviews){
//                for (int counter = 0; counter < [colorArray count]; counter++) {
//                    if ([subview isKindOfClass:[ColorButtons class]]){
//                        if (subview.tag == counter){
//                            subview.backgroundColor = playColorArray[counter];
//                        }}}}
//
//        }completion:^(BOOL finished) {
//            if (clickCounter<5) {
//                [self shuffleLights];
//            }
//
//        }];
//    }
//    else {
//
//    }
//}
//
//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//    self.shouldAnimate = NO;
//}
//
//-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
//    self.shouldAnimate = YES;
//}

@end