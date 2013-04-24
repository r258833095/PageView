//
//  contentViewController.m
//  PageView
//
//  Created by 斌 on 13-4-24.
//  Copyright (c) 2013年 斌. All rights reserved.
//

#import "contentViewController.h"

@interface contentViewController ()

@end

@implementation contentViewController
@synthesize webView, dataObject;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [webView loadHTMLString:dataObject baseURL:[NSURL URLWithString:@""]];
    
}
    
@end
