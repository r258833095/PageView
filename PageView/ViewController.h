//
//  ViewController.h
//  PageView
//
//  Created by 斌 on 13-4-24.
//  Copyright (c) 2013年 斌. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPageViewControllerDataSource> {
    
    UIPageViewController *pageController; 
    
    NSArray *pageContent; 
    
}

@property (strong, nonatomic) UIPageViewController *pageController;

@property (strong, nonatomic) NSArray *pageContent;



@end
