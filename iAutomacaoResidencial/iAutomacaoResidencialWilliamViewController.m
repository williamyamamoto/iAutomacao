//
//  iAutomacaoResidencialWilliamViewController.m
//  iAutomacaoResidencial
//
//  Created by William Yamamoto on 02/02/13.
//  Copyright (c) 2013 William Shiniti Yamamoto. All rights reserved.
//

#import "iAutomacaoResidencialWilliamViewController.h"

@interface iAutomacaoResidencialWilliamViewController ()

@end

@implementation iAutomacaoResidencialWilliamViewController
@synthesize myWebView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:@"http://www.williamyamamoto.com.br/"];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [myWebView loadRequest:req];
}

@end
