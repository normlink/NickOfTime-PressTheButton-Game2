//
//  ClickDelegate.h
//  NickOfTime-PressTheButton-Game2
//
//  Created by Yaniv Kerem on 8/16/13.
//  Copyright (c) 2013 Norm Gershon. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ColorButtons;

@protocol ClickDelegate <NSObject>

-(void) didClickGame2View: (ColorButtons *) thisView;

@end
