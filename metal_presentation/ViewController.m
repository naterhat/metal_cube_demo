//
//  ViewController.m
//  metal_presentation
//
//  Created by Nate on 12/7/14.
//  Copyright (c) 2014 ifcantel. All rights reserved.
//

#import "ViewController.h"

@import QuartzCore.CADisplayLink;

@interface ViewController ()
@property (nonatomic) CADisplayLink *ticker;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _ticker = [CADisplayLink displayLinkWithTarget:self selector:@selector(update)];
}

- (void)update
{
    
}

@end
