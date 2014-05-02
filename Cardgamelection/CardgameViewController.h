//
//  CardgameViewController.h
//  Cardgamelection
//
//  Created by Jonas Lauritsen on 14/02/14.
//  Copyright (c) 2014 Jonas Lauritsen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardgameViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentController;

- (IBAction)changePlayMode:(id)sender;
@end
