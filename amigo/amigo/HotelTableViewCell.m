//
//  HotelTableViewCell.m
//  amigo
//
//  Created by Robin Wohlers-Reichel on 20/08/2014.
//  Copyright (c) 2014 robinwohlers. All rights reserved.
//

#import "HotelTableViewCell.h"

@implementation HotelTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
