//
//  ARCRollingButtonsMenu.m
//  Created by Antonio Carella on 9/11/15.
//  
//

#import "ARCRollingButtonsMenu.h"

@interface ARCRollingButtonsMenu()

@end

@implementation ARCRollingButtonsMenu{

    NSMutableArray *rolledOutPositions;
    BOOL rollRightToLeft;
    
}

-(instancetype)initWithFrame:(CGRect)frame buttons:(NSArray *)buttons{

    self.animationDelay = 0.0;
    self.animationDuration = 0.2;
    
    if( self = [super initWithFrame:frame]) {
        for (int i = 0; i < buttons.count; i++) {
            UIButton *button = [buttons objectAtIndex:i];
            button.layer.cornerRadius = button.frame.size.height / 2;
            button.clipsToBounds = YES;
            [self addSubview:button];
            [self sendSubviewToBack:button];
        }
        
    }
    
    self.buttons = buttons;
    return self;
}

-(void)animateButtonsOut{
    
    int frameXDirection = 1;
    
    if (rollRightToLeft){
        frameXDirection = -1;
    }
    
    [UIView animateWithDuration:self.animationDuration delay:self.animationDelay options:UIViewAnimationOptionCurveLinear animations:^{
        
        float xCoordConstant = 0;
        
        for (int i = 0; i < self.buttons.count; i++) {
            UIButton *button = [self.buttons objectAtIndex:i];
            
            if (i > 0) {
                UIButton *previousButton = [self.buttons objectAtIndex:i-1];
                xCoordConstant += previousButton.frame.size.width + self.padding;
            }
            
            button.frame = CGRectMake(button.frame.origin.x + (xCoordConstant * frameXDirection), button.frame.origin.y, button.frame.size.height, button.frame.size.width);
        }
        
    } completion:^(BOOL finished) {
        NSLog(@"Animate Out Finished");
    }];

}

-(void)animateButtonsIn{

    [UIView animateWithDuration:self.animationDuration delay:self.animationDelay options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        for (int i = 0; i < self.buttons.count; i++) {
            UIButton *button = [self.buttons objectAtIndex:i];
            NSLog(@"Before Button Frame: %@", button);
            button.frame = CGRectMake(0, button.frame.origin.y, button.frame.size.height, button.frame.size.width);
            NSLog(@"After Button Frame: %@", button);
        }
        
    } completion:^(BOOL finished) {
        NSLog(@"Animate Out Finished");
    }];

    

}

-(void)rollOutLeftToRight{

    rollRightToLeft = YES;
}

@end