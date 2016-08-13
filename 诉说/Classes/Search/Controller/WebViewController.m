//
//  WebViewController.m
//  诉说
//
//  Created by qingyun on 16/8/8.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@property (nonatomic, weak) UIWebView *web;

@end

@implementation WebViewController

- (void)loadView {
    UIWebView *web = [[UIWebView alloc] init];
    self.view = web;
    _web = web;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadDefaultSetting];
}

/**加载默认设置和UI*/
- (void)loadDefaultSetting
{
    NSURL *url = [NSURL URLWithString:self.strURL];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [self.web loadRequest:request];
}



@end
