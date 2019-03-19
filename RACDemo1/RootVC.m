//
//  RootVC.m
//  RACDemo
//
//  Created by 阿兹尔 on 3/10/19.
//  Copyright © 2019 王博. All rights reserved.
//

#import "RootVC.h"

@interface RootVC ()

@end

@implementation RootVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)actionToVC1:(id)sender {
    FirstViewController *fVC = [[FirstViewController alloc]init];
    [self.navigationController pushViewController:fVC animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
