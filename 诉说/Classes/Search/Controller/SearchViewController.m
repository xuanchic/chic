//
//  SearchViewController.m
//  诉说
//
//  Created by qingyun on 16/8/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "SearchViewController.h"
#import "ItemInfoModel.h"
#import "AFNetworking.h"
#import "ItemInfoCell.h"
#import "WebViewController.h"

#define URLSerch @"http://www.wumii.com/app/mobile/auto/site/items?obSiteId=2uRkHJ3P&ord=TIME_DESC"

@interface SearchViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *arrItemInfoModel;

@property (nonatomic, weak) UITableView *tableView;

@end

@implementation SearchViewController

- (void)loadDatas {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", nil];
    [manager GET:URLSerch parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *arrData = responseObject[@"readerModule"][@"itemInfos"];
        NSUInteger count = arrData.count;
        NSMutableArray *mArrData = [NSMutableArray arrayWithCapacity:count];
        for (NSInteger index = 0; index < count; index++) {
            NSDictionary *dictData = arrData[index];
            ItemInfoModel *model = [ItemInfoModel modelWithDictionary:dictData];
            [mArrData addObject:model];
        }
        self.arrItemInfoModel = [NSMutableArray arrayWithArray:mArrData];
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"网络连接失败，请点击重试！" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
            [alert addAction:action];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDatas];
    [self loadDefaultSetting];
}

- (void)loadDefaultSetting
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 15, 15);
    [btn setImage:[UIImage imageNamed:@"shuaxin.png"] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    [btn addTarget:self action:@selector(refresh) forControlEvents:UIControlEventTouchUpInside];
    
    UITableView *table = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:table];
    table.estimatedRowHeight = 220;
    table.delegate = self;
    table.dataSource = self;
    self.tableView = table;
   
    }

- (void)refresh
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"请等待加载！" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", nil];
    [manager GET:URLSerch parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *arrData = responseObject[@"readerModule"][@"itemInfos"];
        NSUInteger count = arrData.count;
        NSMutableArray *mArrData = [NSMutableArray arrayWithCapacity:count];
        for (NSInteger index = 0; index < count; index++) {
            NSDictionary *dictData = arrData[index];
            ItemInfoModel *model = [ItemInfoModel modelWithDictionary:dictData];
            [mArrData addObject:model];
        }
        self.arrItemInfoModel = [NSMutableArray arrayWithArray:mArrData];
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"网络连接失败，请点击重试！" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
            [alert addAction:action];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.arrItemInfoModel.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ItemInfoCell *cell = [ItemInfoCell cellWithTablView:tableView];
    [cell setSelectionStyle:UITableViewCellSelectionStyleBlue];
//    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 40)];
//    view.backgroundColor = [UIColor clearColor];
//    [cell setSelectedBackgroundView:view];
    ItemInfoModel *models = self.arrItemInfoModel[indexPath.section];
    cell.itemModels = models;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WebViewController *webVC = [WebViewController new];
    ItemInfoModel *models = self.arrItemInfoModel[indexPath.section];
    webVC.strURL = models.strNameHtml;
    [self.navigationController pushViewController:webVC animated:YES];
    
}

@end
