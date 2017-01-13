//
//  ViewController.m
//  CCSpotlightDemo
//
//  Created by idechao on 2017/1/12.
//  Copyright © 2017年 idechao. All rights reserved.
//

#import "ViewController.h"
#import "CCSpotlight.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self p_createData];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"id"];
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    
    CCSpotlightModel *mm = (CCSpotlightModel *)self.dataSource[indexPath.row];
    cell.textLabel.text = mm.cc_title;
    
    return cell;
}

- (void)p_createData {
    UIImage *image = [UIImage imageNamed:@"g"];
    
    CCSpotlightModel *model1 = [[CCSpotlightModel alloc] init];
    model1.cc_id = @"11";
    model1.cc_title = @"git pull";
    model1.cc_image = image;
    model1.cc_description = @"this is git pull.";
    
    CCSpotlightModel *model2 = [[CCSpotlightModel alloc] init];
    model2.cc_id = @"12";
    model2.cc_title = @"git push";
    model2.cc_image = image;
    model2.cc_description = @"this is git push.";
    
    CCSpotlightModel *model3 = [[CCSpotlightModel alloc] init];
    model3.cc_id = @"13";
    model3.cc_title = @"git fetch";
    model3.cc_image = image;
    model3.cc_description = @"this is git fetch.";
    
    self.dataSource = @[model1, model2, model3];
    
    [[CCSpotlight sharedInstance] cc_saveToSpotlight:self.dataSource completionHandler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", error.description);
        } else {
            NSLog(@"success");
        }
    }];
}

@end
