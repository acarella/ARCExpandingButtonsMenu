//
//  ARCExpandingButtonsMenu.m
//  Created by Antonio Carella on 9/11/15.
//
//

#import "ARCExpandingButtonsMenu.h"

@interface ARCExpandingButtonsMenu()

@end

@implementation ARCExpandingButtonsMenu{
    
    NSMutableArray *rolledOutPositions;
    BOOL rollRightToLeft;
    BOOL shouldSpin;
    int direction;
}

-(instancetype)initWithFrame:(CGRect)frame buttons:(NSArray *)buttons{
    
    self.animationDelay = 0.0;
    self.animationDuration = 0.2;
    
    direction = ARCExpandingButtonsDirectionLeftToRight;
    
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
    
    int frameDeltaDirection;
    
    if (direction == ARCExpandingButtonsDirectionLeftToRight || direction == ARCExpandingButtonsDirectionTopToBottom) {
        frameDeltaDirection = 1;
    } else {
        frameDeltaDirection = -1;
    }

    
    [UIView animateWithDuration:self.animationDuration delay:self.animationDelay options:UIViewAnimationOptionCurveLinear animations:^{
        
        float coordConstant = 0;
        
        for (int i = 0; i < self.buttons.count; i++) {
            UIButton *button = [self.buttons objectAtIndex:i];
            
            if (i > 0) {
                UIButton *previousButton = [self.buttons objectAtIndex:i-1];
                if ((direction == ARCExpandingButtonsDirectionLeftToRight || direction == ARCExpandingButtonsDirectionRightToLeft)) {
                    coordConstant += previousButton.frame.size.width + self.padding;
                } else {
                    coordConstant += previousButton.frame.size.height + self.padding;
                }

                
                if (shouldSpin) {
                    CABasicAnimation *fullRotation;
                    fullRotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
                    fullRotation.fromValue = [NSNumber numberWithFloat:0];
                    fullRotation.toValue = [NSNumber numberWithFloat:((360 * M_PI) / -180)];
                    
                    [button.layer addAnimation:fullRotation forKey:@"360"];
                }
            }
            
            if (direction == ARCExpandingButtonsDirectionLeftToRight || direction == ARCExpandingButtonsDirectionRightToLeft) {
                 button.frame = CGRectMake(button.frame.origin.x + (coordConstant * frameDeltaDirection), button.frame.origin.y, button.frame.size.height, button.frame.size.width);
            } else {
                 button.frame = CGRectMake(button.frame.origin.x, button.frame.origin.y + (coordConstant * frameDeltaDirection), button.frame.size.height, button.frame.size.width);
            }
            
        }
        
    } completion:^(BOOL finished) {
        
        NSLog(@"Animate Out Finished");
    }];
    
}

-(void)animateButtonsIn{
    
    [UIView animateWithDuration:self.animationDuration delay:self.animationDelay options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        for (int i = 0; i < self.buttons.count; i++) {
            UIButton *button = [self.buttons objectAtIndex:i];
            button.frame = CGRectMake(0, 0, button.frame.size.height, button.frame.size.width);
        }
        
    } completion:^(BOOL finished) {
        NSLog(@"Animate Out Finished");
    }];
    
}

-(void)chooseDirection:(ARCExpandingButtonsEnum)directionEnum{

    direction = directionEnum;
}

@end
