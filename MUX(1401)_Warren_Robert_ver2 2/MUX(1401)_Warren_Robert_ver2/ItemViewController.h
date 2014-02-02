//
//  ItemViewController.h
//  Warren_Robert_MUX_1401
//
//  Created by Robert Warren on 1/9/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemViewController : UIViewController
{
    NSArray *itemArray;
    IBOutlet UILabel *swiper;
    UISwipeGestureRecognizer *leftSwipe;
}
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UITextView *descrip;
@property (weak, nonatomic) IBOutlet UITextView *url1;
@property (weak, nonatomic) IBOutlet UITextView *url2;
@property (weak, nonatomic) IBOutlet UIImageView *itemimg;
@property (weak, nonatomic) IBOutlet UITextView *phone;
-(IBAction)onClick:(UIButton*)button;
@property (strong, nonatomic) UIImage *insertImage;
@property (strong, nonatomic) NSString *insertName;
@property (strong, nonatomic) NSString *InsertInfo;
@property (strong, nonatomic) NSString *InsertUrl1;
@property (strong, nonatomic) NSString *InsertUrl2;
@property (strong, nonatomic) NSString *InsertPhone;

-(void)onSwipe:(UISwipeGestureRecognizer*)recognized;

@end
