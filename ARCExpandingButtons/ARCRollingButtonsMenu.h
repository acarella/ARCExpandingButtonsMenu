//
//  ARCRollingButtonsMenu.h
//  Created by Antonio Carella on 9/11/15.
//
//

#import <UIKit/UIKit.h>

@protocol ARCExpandingButtonsViewDelegate <NSObject>

@required

-(void)buttonPresssedWithTag:(NSUInteger) tag;

@end

@interface ARCRollingButtonsMenu : UIView

@property (nonatomic, weak) id <ARCExpandingButtonsViewDelegate> delegate;
@property UIViewAnimationOptions *animationOptions;
@property NSTimeInterval animationDelay;
@property NSTimeInterval animationDuration;
@property (strong, nonatomic) NSArray *buttons;
@property float padding;

-(instancetype)initWithFrame:(CGRect)frame buttons:(NSArray *)buttons;

-(void)animateButtonsOut;
-(void)animateButtonsIn;

-(void)rollOutLeftToRight;

@end
