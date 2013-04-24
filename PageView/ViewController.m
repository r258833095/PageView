//
//  ViewController.m
//  PageView
//
//  Created by 斌 on 13-4-24.
//  Copyright (c) 2013年 斌. All rights reserved.
//

#import "ViewController.h"
#import "contentViewController.h"
@interface ViewController ()

@end

@implementation ViewController
@synthesize pageController, pageContent;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self createContentPages];//生成 数据
    
    
    //实例化UIPageViewController
    
    //options，用于page controrller对象的初始化选项。
    //UIPageViewControllerOptionSpineLocationKey 指定spine位于屏幕左侧
    NSDictionary *options =[NSDictionary dictionaryWithObject:
                            [NSNumber numberWithInteger:UIPageViewControllerSpineLocationMin]
                            forKey: UIPageViewControllerOptionSpineLocationKey];
    
    self.pageController = [[UIPageViewController alloc]
                           initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl
                           navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
                           options: options];
    
    pageController.dataSource = self;
    
    [[pageController view] setFrame:[[self view] bounds]];
    
    
    
    contentViewController *initialViewController = [self viewControllerAtIndex:0];
    
    NSArray *viewControllers =
    
    [NSArray arrayWithObject:initialViewController];
    
    [pageController setViewControllers:viewControllers
     
                             direction:UIPageViewControllerNavigationDirectionForward
     
                              animated:NO
     
                            completion:nil];
    
    [self addChildViewController:pageController];
    
    [[self view] addSubview:[pageController view]];
    
    [pageController didMoveToParentViewController:self];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void) createContentPages {//生成 数据
    
    NSMutableArray *pageStrings = [[NSMutableArray alloc] init];//动态数组：pageStrings
    
    for (int i = 1; i < 11; i++){//循环十次
        
        NSString *contentString = [[NSString alloc]initWithFormat:@"<html><head></head><body><h1>第%d章</h1><p>当前第%d页。目前使用的是UIPageViewController显示其内容。</p></body></html>", i, i];
        
        [pageStrings addObject:contentString];//添加进动态数组
    }
    
    pageContent = [[NSArray alloc] initWithArray:pageStrings];//存入 pageContent 静态数组
    
}



- (contentViewController *)viewControllerAtIndex:(NSUInteger)index {
    
    //是否为第一页或最后一页？
    
    if (([self.pageContent count] == 0) || (index >= [self.pageContent count])) {
        
        return nil;
        
    }
    
    // 实例化，设置相应的数据
    
    contentViewController *dataViewController = [[contentViewController alloc] initWithNibName:@"contentViewController" bundle:nil];
    
    dataViewController.dataObject = [self.pageContent objectAtIndex:index];
    
    return dataViewController;
    
}

- (NSUInteger)indexOfViewController:(contentViewController *)viewController {
    
    //指定一个viewController作为参数，并返回这个viewController的索引
    
    return [self.pageContent indexOfObject:viewController.dataObject];
    
}

- (UIViewController *)pageViewController: (UIPageViewController *)pageViewController viewControllerBeforeViewController: (UIViewController *)viewController {
    
    //右翻，上一页。判断内容可以参考前面，不再备注
    
    NSUInteger index = [self indexOfViewController:(contentViewController *)viewController];
    
    if ((index == 0) || (index == NSNotFound)) {
        
        return nil;
        
    }
    
    index--;
    
    return [self viewControllerAtIndex:index];
    
}

- (UIViewController *)pageViewController: (UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    //左翻，下一页。判断内容可以参考前面，不再备注
    
    NSUInteger index = [self indexOfViewController:(contentViewController *)viewController];
    
    if (index == NSNotFound) {
        
        return nil;
        
    }
    
    index++;
    
    if (index == [self.pageContent count]) {
        
        return nil;
        
    }
    
    return [self viewControllerAtIndex:index];
    
}

@end
