//
//  contentViewController.h
//  PageView
//
//  Created by 斌 on 13-4-24.
//  Copyright (c) 2013年 斌. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface contentViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIWebView *webView;

@property (strong, nonatomic) id dataObject;

@end