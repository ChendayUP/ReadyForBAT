//
//  ViewController.m
//  runtime
//
//  Created by mac on 2018/9/11.
//  Copyright © 2018年 com.xinmem.editor. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *newss = @"ssss";
    id ddd = object_getClass(newss);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
