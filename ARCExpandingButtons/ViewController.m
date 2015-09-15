//
//  ViewController.m
//  ARCExpandingButtons
//
//  Created by Antonio Carella on 9/12/15.
//  Copyright (c) 2015 SuperflousJazzHands. All rights reserved.
//

#import "ViewController.h"
#import "ARCExpandingButtonsMenu.h"

@interface ViewController ()

@property (strong, nonatomic) ARCExpandingButtonsMenu *buttonsMenu;
@property (strong, nonatomic) ARCExpandingButtonsMenu *buttonsMenuTwo;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *buttonsArray = [[NSMutableArray alloc]init];
    NSMutableArray *buttonsArrayTwo = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < 5; i++) {
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
        [button setTitle:[NSString stringWithFormat:@"%d", i] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont fontWithName:@"Arial" size:15.0];
        [button setBackgroundColor:[self randomColor]];
        [buttonsArray addObject:button];
    }
    
    
    for (int i = 0; i < 5; i++) {
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
        [button setTitle:[NSString stringWithFormat:@"%d", i] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont fontWithName:@"Arial" size:15.0];
        [button setBackgroundColor:[self randomColor]];
        [buttonsArrayTwo addObject:button];
    }
    
    self.buttonsMenu = [[ARCExpandingButtonsMenu alloc]initWithFrame:CGRectMake(10, 150, 50, 50) buttons:buttonsArray];
    [self.buttonsMenu setAnimationDelay:0.0];
    [self.buttonsMenu setPadding:2.0];
    [self.buttonsMenu chooseDirection:ARCExpandingButtonsDirectionTopToBottom];
    [self.view addSubview:self.buttonsMenu];
    
    self.buttonsMenuTwo = [[ARCExpandingButtonsMenu alloc]initWithFrame:CGRectMake(310, 250, 50, 50) buttons:buttonsArrayTwo];
    [self.buttonsMenuTwo setAnimationDelay:0.0];
    [self.buttonsMenuTwo setPadding:2.0];
    [self.buttonsMenuTwo chooseDirection:ARCExpandingButtonsDirectionBottomToTop];
    [self.view addSubview:self.buttonsMenuTwo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)animateOutButtonPressed:(UIButton *)sender {
    [self.buttonsMenu animateButtonsOut];
    [self.buttonsMenuTwo animateButtonsOut];
}
- (IBAction)animateInButton:(UIButton *)sender {
    [self.buttonsMenu animateButtonsIn];
    [self.buttonsMenuTwo animateButtonsIn];
}

-(UIColor *)randomColor{
    
    srand48(arc4random());
    
    CGFloat randomRed = drand48();
    CGFloat randomGreen = drand48();
    CGFloat randomBlue = drand48();
    
    return [UIColor colorWithRed:randomRed green:randomGreen blue:randomBlue alpha:1.0];
}


@end
