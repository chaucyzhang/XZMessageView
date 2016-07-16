//
//  XZViewController.m
//  XZMessageView
//
//  Created by tringappsXiZhang on 07/14/2016.
//  Copyright (c) 2016 tringappsXiZhang. All rights reserved.
//

#import "XZViewController.h"
#import "XZMessageView.h"

@interface XZViewController ()

@end

@implementation XZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    XZMessageView *messageView = [[XZMessageView alloc] initWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, 44.0)];
//    [messageView setFontColor:[UIColor blueColor]];
//    [messageView setBgColor:[UIColor redColor]];
//    [messageView setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:17.0]];
//    [messageView setAutoHideDelay:10.0];
//    [messageView setAnimationDuration:4.0];
     [messageView displayErrorMsgViewWithText:@"Error msg 1"];
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(NSEC_PER_SEC*1.0));
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
        [messageView displayErrorMsgViewWithText:@"This is a message"];
    });
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
