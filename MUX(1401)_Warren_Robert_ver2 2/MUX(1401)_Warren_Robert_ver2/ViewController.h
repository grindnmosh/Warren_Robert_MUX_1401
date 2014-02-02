//
//  ViewController.h
//  MUX(1401)_Warren_Robert_ver2
//
//  Created by Robert Warren on 1/16/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SavingWishes.h"
#import "SecondViewController.h"

@interface ViewController : UIViewController
{
    SavingWishes *optSingleton;
    UITableViewCell *grabIt;
    NSString *itemName;
    NSString *textFieldVal;
    NSMutableArray *wishArray;
    NSMutableArray *prodImage;
    NSMutableArray *descripArray;
    NSMutableArray *url1Array;
    NSMutableArray *url2Array;
    NSMutableArray *phoneArray;
    NSMutableArray *continuous1;
    NSMutableArray *continuous2;
    NSMutableArray *continuous3;
    NSMutableArray *continuous4;
    NSMutableArray *continuous5;
    NSMutableArray *continuous6;
    NSString *theName;
    NSString *wishName;
    IBOutlet UILabel *swiper;
    UISwipeGestureRecognizer *rightSwipe;
}
@property (weak, nonatomic) IBOutlet UITableView *onChart;
@property (weak, nonatomic) IBOutlet UIButton *editButton;

-(IBAction)onClick:(UIButton*)button;
-(void)onSwipe:(UISwipeGestureRecognizer*)recognized;

@end
