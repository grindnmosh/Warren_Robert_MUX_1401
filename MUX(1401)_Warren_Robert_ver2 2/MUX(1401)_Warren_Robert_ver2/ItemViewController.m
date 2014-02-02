//
//  ItemViewController.m
//  Warren_Robert_MUX_1401
//
//  Created by Robert Warren on 1/9/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import "ItemViewController.h"

@interface ItemViewController ()

@end

@implementation ItemViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    //swipe gesture
    leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(onSwipe:)];
    leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    [swiper addGestureRecognizer:leftSwipe];
    
    [super viewDidLoad];
    self.itemimg.image = self.insertImage;
    //self.itemimg.frame = CGRectMake(8.0f, 103.0f, 200.0f, 150.0f);
    //Product Name
    self.name.text = self.insertName;
    //Product Details
    //self.descrip.text = self.InsertInfo;
    
    //self.url1.text = self.InsertUrl1;
    //self.url2.text = self.InsertUrl2;
    //self.phone.text = self.InsertPhone;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)onSwipe:(UISwipeGestureRecognizer *)recognized
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)onClick:(UIButton*)button
{
    itemArray = [[NSMutableArray alloc] initWithObjects:
                 _itemimg.image,
                 _name.text,
                 _descrip.text,
                 _url1.text,
                 _url2.text,
                 nil];
    if (button.tag == 0)
    {
       //share
        UIActivityViewController *controller = [[UIActivityViewController alloc] initWithActivityItems:itemArray applicationActivities:nil];
        [self presentViewController:controller animated:YES completion:nil];
    }
    else if (button.tag == 1)
    {
        //close
        [self dismissViewControllerAnimated:YES completion:nil];
    }

}

@end
