//
//  AppTableViewController.m
//  诉说
//
//  Created by qingyun on 16/8/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "AppTableViewController.h"
#import "AFNetworking.h"
#import "appModel.h"
#import "AppCell.h"
#define URL0 @"http://app.xiaolann.com/app/qqsay/v1/query.php?type=103&page=0"
#define URL1 @"http://app.xiaolann.com/app/qqsay/v1/query.php?type=902&page=0"
#define URL2 @"http://app.xiaolann.com/app/qqsay/v1/query.php?type=1646&page=0"
#define URL3 @"http://app.xiaolann.com/app/qqsay/v1/query.php?type=889&page=0"
#define URL4 @"http://app.xiaolann.com/app/qqsay/v1/query.php?type=888&page=0"
#define URL5 @"http://app.xiaolann.com/app/qqsay/v1/query.php?type=838&page=0"
#define URL6 @"http://app.xiaolann.com/app/qqsay/v1/query.php?type=1262&page=0"
#define URL7 @"http://app.xiaolann.com/app/qqsay/v1/query.php?type=2267&page=0"

@interface AppTableViewController ()

@property (nonatomic, strong) NSMutableArray *arrModels;
@property (nonatomic, copy) NSString *publcUrl;
@property (nonatomic, strong) UIButton *footerBtn;
@property (nonatomic, assign) NSInteger page;

@end

@implementation AppTableViewController

- (void)loadUrl {
    switch (_index) {
        case 0:
            _publcUrl = URL0;
            break;
        case 1:
            _publcUrl = URL1;
            break;
        case 2:
            _publcUrl = URL2;
            break;
        case 3:
            _publcUrl = URL3;
            break;
        case 4:
            _publcUrl = URL4;
            break;
        case 5:
            _publcUrl = URL5;
            break;
        case 6:
            _publcUrl = URL6;
            break;
        case 7:
            _publcUrl = URL7;
            break;
        default:
            break;
    }
}
- (NSArray *)arrModels
{
    if (!_arrModels) {
        [self loadUrl];
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/plain",@"application/json", nil];
        [manager GET:_publcUrl parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSArray *data = responseObject[@"data"];
            //[data writeToFile:@"/Users/qingyun/Desktop/QQ.plist" atomically:YES];
            NSInteger count = data.count;
            NSMutableArray *arrTemp = [NSMutableArray arrayWithCapacity:count];
            for (NSInteger index = 0; index < count; index++) {
                NSDictionary *dict = data[index];
                appModel *model = [appModel initWithDict:dict];
                [arrTemp addObject:model];
            }
            //加载数据
            [self.tableView reloadData];
            _arrModels = [NSMutableArray arrayWithArray:arrTemp];
//            _arrModels = arrTemp;
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (error) {
                
            }
        }];
    }
    return _arrModels;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.estimatedRowHeight = 150;
    self.tableView.sectionFooterHeight = 30;
    [self loadDefaultSetting];
}

/**加载默认设置和UI*/
- (void)loadDefaultSetting
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 15, 15);
    [btn setImage:[UIImage imageNamed:@"shuaxin.png"] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    [btn addTarget:self action:@selector(refresh) forControlEvents:UIControlEventTouchUpInside];

    //加载更多
    UIButton *footerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [footerBtn setTitle:@"加载更多" forState:UIControlStateNormal];
    
    [footerBtn setBackgroundColor:[UIColor grayColor]];
    
    footerBtn.frame = CGRectMake(0, 0, 0, 44);
    
    self.tableView.tableFooterView = footerBtn;
    _footerBtn = footerBtn;
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, -44, 0);
}

- (void)refresh
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"请等待加载！" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
    
    _page += 1;
    NSString *str0 = [NSString stringWithFormat:@"http://app.xiaolann.com/app/qqsay/v1/query.php?type=103&page=%ld",_page];
    NSString *str1 = [NSString stringWithFormat:@"http://app.xiaolann.com/app/qqsay/v1/query.php?type=902&page=%ld",_page];
    NSString *str2 = [NSString stringWithFormat:@"http://app.xiaolann.com/app/qqsay/v1/query.php?type=1646&page=%ld",_page];
    NSString *str3 = [NSString stringWithFormat:@"http://app.xiaolann.com/app/qqsay/v1/query.php?type=103&page=%ld",_page];
    NSString *str4 = [NSString stringWithFormat:@"http://app.xiaolann.com/app/qqsay/v1/query.php?type=889&page=%ld",_page];
    NSString *str5 = [NSString stringWithFormat:@"http://app.xiaolann.com/app/qqsay/v1/query.php?type=838&page=%ld",_page];
    NSString *str6 = [NSString stringWithFormat:@"http://app.xiaolann.com/app/qqsay/v1/query.php?type=1262&page=%ld",_page];
    NSString *str7 = [NSString stringWithFormat:@"http://app.xiaolann.com/app/qqsay/v1/query.php?type=2267&page=%ld",_page];
    NSArray *arrStr = @[str0,str1,str2,str3,str4,str5,str6,str7];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/plain",@"application/json", nil];
    [manager GET:arrStr[_index] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *data = responseObject[@"data"];
        //[data writeToFile:@"/Users/qingyun/Desktop/QQ.plist" atomically:YES];
        NSInteger count = data.count;
        NSMutableArray *arrTemp = [NSMutableArray arrayWithCapacity:count];
        for (NSInteger index = 0; index < count; index++) {
            NSDictionary *dict = data[index];
            appModel *model = [appModel initWithDict:dict];
            [arrTemp addObject:model];
        }
        //加载数据
        [self.arrModels addObjectsFromArray:arrTemp];
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"网络连接失败，请点击重试！" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.arrModels.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AppCell *cell = [AppCell cellWithTableView:tableView];
    appModel *model = self.arrModels[indexPath.section];
    cell.status = model;
   
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y > scrollView.contentSize.height - scrollView.frame.size.height) {
        [_footerBtn setTitle:@"松手加载更多" forState:UIControlStateNormal];
    }else {
        [_footerBtn setTitle:@"加载更多" forState:UIControlStateNormal];
    }
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (scrollView.contentOffset.y > scrollView.contentSize.height - scrollView.frame.size.height) {
        [self refresh];
    }
}

@end
