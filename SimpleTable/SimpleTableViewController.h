//
//  SimpleTableViewController.h
//  SimpleTable
//
//  Created by  Chuns on 11-9-1.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"
@class DetailViewController;

@interface SimpleTableViewController : UIViewController 
    <UITableViewDelegate, UITableViewDataSource>
{
    NSArray *listData;
    NSArray *season;
    NSDictionary *names;
    NSArray *keys;
    DetailViewController *dvController;
}

@property (nonatomic, retain) NSArray *listData;
@property (nonatomic, retain) NSArray *season;
@property (nonatomic, retain) NSDictionary *names;
@property (nonatomic, retain) NSArray *keys;
@property (nonatomic, retain) DetailViewController *dvController;
@end
