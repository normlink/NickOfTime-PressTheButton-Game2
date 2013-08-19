//
//  ColorButtons.h
//  NickOfTime-PressTheButton-Game2
//
//  Created by Yaniv Kerem on 8/16/13.
//  Copyright (c) 2013 Norm Gershon. All rights reserved.
//
#import "ClickDelegate.h"
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ColorButtons : UIView

@property (strong, nonatomic) id <ClickDelegate> pressButtonsDelegate;

@end
