//
//  DetailViewController.m
//  SimpleTable
//
//  Created by  Chuns on 11-9-2.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"


@implementation DetailViewController

@synthesize artname;
@synthesize bio;
@synthesize artists;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [artname release];
    [bio release];
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
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)viewWillAppear:(BOOL)animated 
{
    [super viewWillAppear:animated];
    self.artname.text = [self.artists objectForKey:@"name"];
    self.bio.text = [self.artists objectForKey:@"bio"];
}


@end
