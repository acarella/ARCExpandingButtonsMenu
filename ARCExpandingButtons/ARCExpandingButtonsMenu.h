//
//  ARCExpandingButtonsMenu
//  Created by Antonio Carella on 9/11/15.
//
//

#import <UIKit/UIKit.h>
#import "ARCExpandingButtonsEnum.h"

@protocol ARCExpandingButtonsViewDelegate <NSObject>

@required

-(void)buttonPresssedWithTag:(NSUInteger) tag;

@end

@interface ARCExpandingButtonsMenu : UIView

@property (nonatomic, weak) id <ARCExpandingButtonsViewDelegate> delegate;
@property UIViewAnimationOptions *animationOptions;
@property NSTimeInterval animationDelay;
@property NSTimeInterval animationDuration;
@property (strong, nonatomic) NSArray *buttons;
@property float padding;
@property BOOL addSpin;


-(instancetype)initWithFrame:(CGRect)frame buttons:(NSArray *)buttons;
-(void)chooseDirection:(ARCExpandingButtonsEnum)directionEnum;
-(void)animateButtonsOut;
-(void)animateButtonsIn;

@end
