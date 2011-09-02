//
//  SimpleTableViewController.m
//  SimpleTable
//
//  Created by  Chuns on 11-9-1.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "SimpleTableViewController.h"
#import "DetailViewController.h"

@implementation SimpleTableViewController
@synthesize listData;
@synthesize season;
@synthesize names;
@synthesize keys;
@synthesize dvController;
@synthesize arts;


- (void)dealloc
{
    [arts release];
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
  //  self.arts = [[NSMutableArray alloc] initWithObjects:@"chuns", @"xia", @"qiu", nil];
    
    
    self.listData = [[NSArray alloc] initWithObjects:@"Chuns", @"Xia", @"Qiu", @"Dong", nil];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"SeasonList" ofType:@"plist"];
    
   
    NSString *artspath = [[NSBundle mainBundle] pathForResource:@"arts" ofType:@"plist"];
    self.arts = [[NSArray alloc] initWithContentsOfFile:artspath];
    
    
    //self.season = [[NSArray alloc] initWithContentsOfFile:path];
    
    self.names = [[NSDictionary alloc]initWithContentsOfFile:path];
    
    self.keys = [names allKeys];
    
    [super viewDidLoad];
}

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
    
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.arts count];
}

/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
   
    return [keys count];
}
 */
/*
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *key = [keys objectAtIndex:section];
    NSArray *nameSection = [names objectForKey:key];
    return [nameSection count];
}
*/


/*
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
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
*/
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    cell.textLabel.text = [[self.arts objectAtIndex:indexPath.row] objectForKey:@"name"];
    return cell;
}
    

/*
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *key = [keys objectAtIndex:section];
    return key;
}
 */

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
        
    DetailViewController *dvController = [[[DetailViewController alloc]
                                           init ] autorelease];
    dvController.artists = [self.arts objectAtIndex:indexPath.row];
    
    [[self navigationController] pushViewController:dvController 
                                           animated:YES];
}




/*
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
       
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"you selected"
                                                    message:@"hello"
                                                   delegate:nil
                                          cancelButtonTitle:@"yes"
                                          otherButtonTitles:nil,nil];
    [alert show];
    
    [alert release];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
 
    
}
 */
 
@end
