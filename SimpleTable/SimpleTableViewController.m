//
//  SimpleTableViewController.m
//  SimpleTable
//
//  Created by  Chuns on 11-9-1.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "SimpleTableViewController.h"

@implementation SimpleTableViewController
@synthesize listData;
@synthesize season;
@synthesize names;
@synthesize keys;

- (void)dealloc
{
    [listData release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    self.listData = [[NSArray alloc] initWithObjects:@"Chuns", @"Xia", @"Qiu", @"Dong", nil];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"SeasonList" ofType:@"plist"];
    //self.season = [[NSArray alloc] initWithContentsOfFile:path];
    
    self.names = [[NSDictionary alloc]initWithContentsOfFile:path];
    
    self.keys = [names allKeys];
    
    [super viewDidLoad];
}

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    self.listData = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark Table View Data Source Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
   
    return [keys count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *key = [keys objectAtIndex:section];
    NSArray *nameSection = [names objectForKey:key];
    return [nameSection count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger section = [indexPath section];
    NSUInteger row = [indexPath row];
    NSString *key = [keys objectAtIndex:section];
    NSArray *nameSection = [names objectForKey:key];
    
    static NSString *SectionsTableIdentifier = @"SectionsTableIdentifier";
                           
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SectionsTableIdentifier];
    
    if (cell == nil)
    {
        cell = [[[UITableViewCell alloc] 
                 initWithStyle:UITableViewCellStyleDefault
               reuseIdentifier:SectionsTableIdentifier] autorelease];
    }
    
    cell.textLabel.text = [nameSection objectAtIndex:row];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *key = [keys objectAtIndex:section];
    return key;
}

/*
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSAlert
}
*/

 
@end
