//
//  RQViewController.m
//  RQKit
//
//  Created by CoderXie on 05/26/2020.
//  Copyright (c) 2020 CoderXie. All rights reserved.
//

#import "RQViewController.h"
#import <RQKit/RQKit.h>

#import "RQTestViewController.h"

@interface RQViewController ()

@end

@implementation RQViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

}

- (IBAction)buttonClick:(id)sender
{    
    RQTestViewController * vc = [RQTestViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
