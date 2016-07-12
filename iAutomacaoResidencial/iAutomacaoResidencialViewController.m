//
//  iAutomacaoResidencialViewController.m
//  iAutomacaoResidencial
//
//  Created by William Yamamoto on 02/02/13.
//  Copyright (c) 2013 William Shiniti Yamamoto. All rights reserved.
//

#import "iAutomacaoResidencialViewController.h"

@interface iAutomacaoResidencialViewController ()

@end

@implementation iAutomacaoResidencialViewController
@synthesize myWebView;
@synthesize myWebCamView;

- (void)viewDidLoad
{
    NSString *deviceType = [UIDevice currentDevice].model;
    
    if([deviceType isEqualToString:@"iPhone"])
    {
        [super viewDidLoad];
        NSURL *url = [NSURL URLWithString:@"http://192.168.0.254:8080/videostream.cgi?user=admin&pwd=sgc33&resolution=8&rate=0"];
        NSURLRequest *req = [NSURLRequest requestWithURL:url];
        [myWebCamView loadRequest:req];
    }
    else
    {
        [super viewDidLoad];
        NSURL *url = [NSURL URLWithString:@"http://192.168.0.254:8080/videostream.cgi?user=admin&pwd=sgc33&resolution=32&rate=0"];
        NSURLRequest *req = [NSURLRequest requestWithURL:url];
        [myWebCamView loadRequest:req];
    }

}

-(IBAction)btnCamReload:(id)sender{
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.254:8080/videostream.cgi?user=admin&pwd=sgc33&resolution=8&rate=0"];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [myWebCamView loadRequest:req];
}

- (IBAction)btnCamUP:(id)sender
{
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.254:8080/decoder_control.cgi?command=0&user=admin&pwd=sgc33"];
    
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [myWebView loadRequest:req];
}

- (IBAction)btnCamDOWN:(id)sender
{
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.254:8080/decoder_control.cgi?command=2&user=admin&pwd=sgc33"];
    
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [myWebView loadRequest:req];
}

- (IBAction)btnCamLEFT:(id)sender
{
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.254:8080/decoder_control.cgi?command=6&user=admin&pwd=sgc33"];
    
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [myWebView loadRequest:req];
}

- (IBAction)btnCamRIGHT:(id)sender
{
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.254:8080/decoder_control.cgi?command=4&user=admin&pwd=sgc33"];
    
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [myWebView loadRequest:req];
}

- (IBAction)btnCamSTOP:(id)sender
{
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.254:8080/decoder_control.cgi?command=1&user=admin&pwd=sgc33"];
    
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [myWebView loadRequest:req];
}

- (IBAction)switchArCondicionado:(id)sender
{
    UISwitch *theSwitch = (UISwitch *) sender;
    
    if (theSwitch.isOn)
    {
        // turn the LED on
        NSURL *url = [NSURL URLWithString:@"http://192.168.0.253/?cmd1=on"];
        NSURLRequest *req = [NSURLRequest requestWithURL:url];
        [myWebView loadRequest:req];
    }
    else
    {
        // turn the LED off
        NSURL *url = [NSURL URLWithString:@"http://192.168.0.253/?cmd1=off"];
        NSURLRequest *req = [NSURLRequest requestWithURL:url];
        [myWebView loadRequest:req];
    }
}

- (IBAction)switchLampada:(id)sender
{
    UISwitch *theSwitch = (UISwitch *) sender;
    
    if (theSwitch.isOn)
    {
        // turn the LED on
        NSURL *url = [NSURL URLWithString:@"http://192.168.0.253/?cmd2=on"];
        NSURLRequest *req = [NSURLRequest requestWithURL:url];
        [myWebView loadRequest:req];
    }
    else
    {
        // turn the LED off
        NSURL *url = [NSURL URLWithString:@"http://192.168.0.253/?cmd2=off"];
        NSURLRequest *req = [NSURLRequest requestWithURL:url];
        [myWebView loadRequest:req];
    }
}

@end