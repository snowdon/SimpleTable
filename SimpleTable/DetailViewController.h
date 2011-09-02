//
//  DetailViewController.h
//  SimpleTable
//
//  Created by  Chuns on 11-9-2.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DetailViewController : UIViewController {
    
    UITextView *bio;
    UILabel *artname;
    NSDictionary *artists;
}

@property (nonatomic, retain) IBOutlet UITextView *bio;
@property (nonatomic, retain) IBOutlet UILabel *artname;
@property (nonatomic, retain) NSDictionary *artists;

@end
