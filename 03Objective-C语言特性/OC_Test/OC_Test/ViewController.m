//
//  ViewController.m
//  OC_Test
//
//  Created by mac on 2018/8/25.
//  Copyright © 2018年 com.xinmem.editor. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

static NSString* key = @"newKey";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    objc_setAssociatedObject(self, &key, @"hello", OBJC_ASSOCIATION_COPY);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
