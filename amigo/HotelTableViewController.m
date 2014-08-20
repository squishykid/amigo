//
//  HotelTableViewController.m
//  amigo
//
//  Created by Robin Wohlers-Reichel on 20/08/2014.
//  Copyright (c) 2014 robinwohlers. All rights reserved.
//

#import "HotelTableViewController.h"
#import <Parse/Parse.h>

@interface HotelTableViewController ()

@end

@implementation HotelTableViewController

NSMutableArray *allObjects;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    allObjects = [NSMutableArray array];
    PFQuery *query = [PFQuery queryWithClassName:@"hotel"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded. Add the returned objects to allObjects
            [allObjects addObjectsFromArray:objects];
            [self.tableView reloadData];
            NSLog(@"Reloaded Datas");
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [allObjects count];
}

- (HotelTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HotelTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    PFObject *cellData = [allObjects objectAtIndex:[indexPath row]];

    cell.roomTitle.text = cellData[@"roomTitle"];//@"hectic seaside";
    cell.roomType.text = cellData[@"roomType"];//@"yolo";
    NSUInteger reviewCount = [[cellData objectForKey:@"reviewCount"] intValue];
    if (reviewCount == 1) {
        cell.reviewNumber.text = [NSString stringWithFormat:@"%i review",reviewCount];
    } else {
        cell.reviewNumber.text = [NSString stringWithFormat:@"%i reviews",reviewCount];
    }
    cell.location.text = cellData[@"locationName"];//@"yolo";
    cell.price.text = [NSString stringWithFormat:@"$%i",[[cellData objectForKey:@"price"] intValue]];
//    PFFile* large = cellData[@"hotelImage"];
//    cell.largeImage.file = (PFFile *)large;
//    [cell.largeImage loadInBackground];
    
    
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
