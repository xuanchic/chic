//
//  ProfileViewController.m
//  诉说
//
//  Created by qingyun on 16/8/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ProfileViewController.h"
#import "SVProgressHUD.h"
#import "LBClearCacheTool.h"

#define filePath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject]

@interface ProfileViewController ()

@property (nonatomic, copy) NSArray *arrTitle;

@end

@implementation ProfileViewController

- (NSArray *)arrTitle
{
    if (_arrTitle == nil) {
        _arrTitle = @[@"清理缓存",@"关于我们",@"信息版本"];
    }
    return _arrTitle;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor lightGrayColor];
    self.tableView.scrollEnabled = NO;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   return self.arrTitle.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [UITableViewCell new];
    cell.backgroundColor = [UIColor lightGrayColor];
    cell.textLabel.text = self.arrTitle[indexPath.row];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 40)];
    view.backgroundColor = [UIColor whiteColor];
    [cell setSelectedBackgroundView:view];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        [self putBufferBtnClicked:indexPath];
    }else if (indexPath.row == 1) {
        [self aboutUs];
    }else {
        [self info];
    }
}

- (void)putBufferBtnClicked:(NSIndexPath *)indexPath
{
    NSString *fileSize = [LBClearCacheTool getCacheSizeWithFilePath:filePath];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:[NSString stringWithFormat:@"清除缓存(%@)",fileSize] preferredStyle:UIAlertControllerStyleActionSheet];
     //创建一个取消和一个确定按钮
    UIAlertAction *actionCanle = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *actionOK = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        //清楚缓存
        BOOL isSuccess = [LBClearCacheTool clearCacheWithFilePath:filePath];
        if (isSuccess) {
            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
            [SVProgressHUD showSuccessWithStatus:@"清除成功"];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [SVProgressHUD dismiss];
            });
        }
    }];
    //将取消和确定按钮添加进弹框控制器
    [alert addAction:actionCanle];
    [alert addAction:actionOK];
    //添加一个文本框到弹框控制器
    //显示弹框控制器
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)aboutUs
{
    NSString *strmess = @"唯美的插图，暖心的话语，这是一款让大家诉说内心的净土";
    UIAlertController *alerUs = [UIAlertController alertControllerWithTitle:nil message:strmess preferredStyle:UIAlertControllerStyleAlert];
     UIAlertAction *actionCanle = [UIAlertAction actionWithTitle:@"返回" style:UIAlertActionStyleCancel handler:nil];
    [alerUs addAction:actionCanle];
    [self presentViewController:alerUs animated:YES completion:nil];
}

- (void)info
{
    UIAlertController *alerInfo = [UIAlertController alertControllerWithTitle:nil message:[NSString stringWithFormat:@"版本1.0"] preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *actionCanle = [UIAlertAction actionWithTitle:@"返回" style:UIAlertActionStyleCancel handler:nil];
    
    [alerInfo addAction:actionCanle];
    [self presentViewController:alerInfo animated:YES completion:nil];
}

@end
