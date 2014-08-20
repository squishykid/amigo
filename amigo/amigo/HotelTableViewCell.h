//
//  HotelTableViewCell.h
//  amigo
//
//  Created by Robin Wohlers-Reichel on 20/08/2014.
//  Copyright (c) 2014 robinwohlers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface HotelTableViewCell : UITableViewCell
@property IBOutlet UILabel *roomTitle;
@property IBOutlet UILabel *roomType;
@property IBOutlet UILabel *reviewNumber;
@property IBOutlet UILabel *location;
@property IBOutlet UILabel *price;
@property IBOutlet PFImageView *largeImage;
@property IBOutlet PFImageView *userImage;

@end
