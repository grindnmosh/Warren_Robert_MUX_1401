//
//  ViewController.m
//  MUX(1401)_Warren_Robert_ver2
//
//  Created by Robert Warren on 1/16/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import "ViewController.h"
#import "ItemViewController.h"
#import "SecondViewController.h"


@interface ViewController ()
{
    UIImage *toInsertImage;
    NSString *toInsertName;
    NSString *toInsertInfo;
    NSString *toInsertUrl1;
    NSString *toInsertUrl2;
    NSString *toInsertPhone;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    
    //singleton calls
    optSingleton = [SavingWishes singleOBJ];
    
    //swipe gesture
    rightSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(onSwipe:)];
    rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    [swiper addGestureRecognizer:rightSwipe];

    //check for previous data
    /*NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
     if (defaults != nil);
     {
         wishArray = [defaults objectForKey:@"filedNames"];
         prodImage = [defaults objectForKey:@"filedImages"];
         descripArray = [defaults objectForKey:@"filedInfo"];
         url1Array = [defaults objectForKey:@"filedURL1"];
         url2Array = [defaults objectForKey:@"filedURL2"];
         phoneArray = [defaults objectForKey:@"filedPhone"];
     }*/
    
    wishArray = [[NSMutableArray alloc] initWithObjects:
                 @"27\" iMac",
                 @"2 24\" Samsung LED Monitors",
                 @"Samsung Galaxy Note 10.1",
                 @"Nexus 10 Tablet",
                 @"Apple Time Capsule",
                 @"PlayStation 4",
                 @"XBox One",
                 @"Nintendo Wii U Deluxe Set",
                 @"Nintendo 3DS",
                 @"PlayStation Vita",
                 @"iPad Air Wifi",
                 @"iPad Mini Retina Wifi",
                 @"iPhone 5s Unlocked",
                 @"Apple Tv",
                 @"Turtle Beach Ear Force X42",
                 @"Samsung Galaxy Gear",
                 @"Pebble SmartWatch",
                 @"Google Glass",
                 @"Call of Duty Ghost",
                 @"Pair of Nike Cortez",
                 nil];
    prodImage = [[NSMutableArray alloc] initWithObjects:
                 @"imac.jpg",
                 @"monitor.jpg",
                 @"Note10.jpg",
                 @"Nexus10.png",
                 @"timeCapsule.jpg",
                 @"ps4.jpg",
                 @"xbox.jpg",
                 @"wii.jpg",
                 @"3DS.jpg",
                 @"vita.jpg",
                 @"iPadAir.jpg",
                 @"ipadmini.jpg",
                 @"iphone5s.png",
                 @"appletv.jpg",
                 @"turtle.gif",
                 @"gear.jpg",
                 @"Pebble.jpg",
                 @"GoogleGlass.jpg",
                 @"codg.jpg",
                 @"nike.jpg",
                 nil];

        //set row height
    self->_onChart.rowHeight = 100.0f;
    
    //set editing to off on load
    [_onChart setEditing:false animated:true];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    //singleton data from EventsViewController
    itemName = [optSingleton itemName];
    //UIImage *itemImage = [optSingleton itemImage];
    //NSString *itemDescrip = [optSingleton itemDescrip];
    //NSString *url1 = [optSingleton url1];
    //NSString *url2 = [optSingleton url2];
    //NSString *itemPhone = [optSingleton itemPhone];
    /*if (itemName != nil) {
        if (wishArray == nil)
        {
            continuous1 =[[NSMutableArray alloc] init];
            [continuous1 addObject:itemName];
            wishArray = continuous1;
            //continuous2 =[[NSMutableArray alloc] init];
            //[continuous2 addObject:itemImage.images];
            //prodImage = continuous2;
            continuous3 =[[NSMutableArray alloc] init];
            [continuous3 addObject:itemDescrip];
            descripArray = continuous3;
            continuous4 =[[NSMutableArray alloc] init];
            [continuous4 addObject:url1];
            url1Array = continuous4;
            continuous5 =[[NSMutableArray alloc] init];
            [continuous5 addObject:url2];
            url2Array = continuous5;
            continuous6 =[[NSMutableArray alloc] init];
            [continuous6 addObject:itemPhone];
            phoneArray = continuous6;
        }
        //previously saved assignments
        else if (wishArray != nil)
        {
            
            continuous1 =[[NSMutableArray alloc] init];
            [continuous1 addObjectsFromArray:wishArray];
            [continuous1 addObject:itemName];
            wishArray = continuous1;
            //continuous2 =[[NSMutableArray alloc] init];
            //[continuous2 addObjectsFromArray:prodImage];
            //[continuous2 addObject:itemImage.images];
            //prodImage = continuous2;
            continuous3 =[[NSMutableArray alloc] init];
            [continuous3 addObjectsFromArray:descripArray];
            [continuous3 addObject:itemDescrip];
            descripArray = continuous3;
            continuous4 =[[NSMutableArray alloc] init];
            [continuous4 addObjectsFromArray:url1Array];
            [continuous4 addObject:url1];
            url1Array = continuous4;
            continuous5 =[[NSMutableArray alloc] init];
            [continuous4 addObjectsFromArray:url2Array];
            [continuous5 addObject:url2];
            url2Array = continuous5;
            continuous6 =[[NSMutableArray alloc] init];
            [continuous4 addObjectsFromArray:phoneArray];
            [continuous6 addObject:itemPhone];
            phoneArray = continuous6;
        }
        optSingleton.itemName = nil;
        optSingleton.itemImage = nil;
        optSingleton.itemDescrip = nil;
        optSingleton.url1 = nil;
        optSingleton.url2 = nil;
        optSingleton.itemPhone = nil;
    }*/
    
    [_onChart reloadData];

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (defaults != nil)
    {
        //savedWishes = wishArray;
        //[defaults setObject:savedWishes forKey:@"filed"];
        //[defaults synchronize];
    }
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//set number of labels based on title array size.
- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    return [wishArray count];
}

//commit to the delete here.
-(void)tableView:(UITableView*)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //verify editing style
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        //remove object from UI
        [wishArray removeObjectAtIndex:indexPath.section];
        [prodImage removeObjectAtIndex:indexPath.section];
        //[descripArray removeObjectAtIndex:indexPath.section];
        //[url1Array removeObjectAtIndex:indexPath.section];
        //[url2Array removeObjectAtIndex:indexPath.section];
        //[phoneArray removeObjectAtIndex:indexPath.section];
        
        //remove from arrays
        [_onChart deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        [_onChart reloadData];
    }
}

//create tags and insert data
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //create tags
    static NSString *cellId = @"Test";
    UITableViewCell *wishCell = [_onChart dequeueReusableCellWithIdentifier: cellId];
    if (wishCell == nil)
    {
        wishCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        [wishCell.textLabel setNumberOfLines:6];
        wishCell.textLabel.textAlignment = NSTextAlignmentCenter;
    }
    //add image to label
    UIImageView *imv = [[UIImageView alloc]initWithFrame:CGRectMake(10, 0, 120, 85)];
    imv.image = [UIImage imageNamed:[prodImage objectAtIndex:indexPath.row]];
    [wishCell.contentView addSubview:imv];
    wishCell.textLabel.text = (NSMutableString*)[wishArray objectAtIndex:indexPath.row];
    //return label
    return wishCell;
    
}

//universal segue call to pass the custom data to detail page
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"detail"])
    {
        ItemViewController *destination = segue.destinationViewController;
        destination.insertImage = toInsertImage;
        destination.insertName = toInsertName;
        //destination.InsertInfo = toInsertInfo;
        //destination.InsertUrl1 = toInsertUrl1;
        //destination.InsertUrl2 = toInsertUrl2;
        //destination.InsertPhone = toInsertPhone;
    }
}

//selected row calls
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    grabIt = (UITableViewCell*)[_onChart cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row  inSection:0]];
    textFieldVal = [grabIt.textLabel text];
    //cells check to see if they are the selected cell
    toInsertImage = [UIImage imageNamed:[prodImage objectAtIndex:indexPath.row]];
    toInsertName = (NSMutableString*)[wishArray objectAtIndex:indexPath.row];
    //toInsertInfo = (NSMutableString*)[descripArray objectAtIndex:indexPath.row];
    //toInsertUrl1 = (NSMutableString*)[url1Array objectAtIndex:indexPath.row];
    //toInsertUrl2 = (NSMutableString*)[url2Array objectAtIndex:indexPath.row];
    //toInsertPhone = (NSMutableString*)[phoneArray objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier: @"detail" sender: self];

}

-(void)onSwipe:(UISwipeGestureRecognizer *)recognized
{
    [self performSegueWithIdentifier: @"newness" sender: self];
}


-(IBAction)onClick:(UIButton*)button
{
    if (button.tag == 0)
    {
        //share
        UIActivityViewController *controller = [[UIActivityViewController alloc] initWithActivityItems:wishArray applicationActivities:nil];
        [self presentViewController:controller animated:YES completion:nil];
    }
    else if (button.tag == 1)
    {
        //close
        if (!_onChart.editing)
        {
            [_onChart setEditing:true animated:true];
            [button setTitle:@"Done Editing List" forState:UIControlStateNormal];
        }
        else
        {
            [_onChart setEditing:false animated:true];
            [button setTitle:@"Remove Item" forState:UIControlStateNormal];
        }
    }
    
}


@end
