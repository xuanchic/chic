//
//  HomeViewController.m
//  诉说
//
//  Created by qingyun on 16/8/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "HomeViewController.h"
#import "AFNetworking.h"
#import "InfoModel.h"
#import "StatusCell.h"

#define URLQQ @"http://xiaolann.com/qqsay/v1/query.php?type=hot&page=0"

@interface HomeViewController ()
/** 很多条数据的模型 */
@property (nonatomic, strong) NSMutableArray *arrDatasModel;
@property (nonatomic, assign) NSInteger page;

@end

@implementation HomeViewController

- (NSArray *)arrDatasModel
{
    if (!_arrDatasModel) {
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/plain",@"application/json", nil];
        [manager GET:URLQQ parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSArray *data = responseObject[@"data"];
            //[data writeToFile:@"/Users/qingyun/Desktop/QQ.plist" atomically:YES];
            NSInteger count = data.count;
            NSMutableArray *arrTemp = [NSMutableArray arrayWithCapacity:count];
            for (NSInteger index = 0; index < count; index++) {
                NSDictionary *dict = data[index];
                InfoModel *model = [InfoModel initWithDict:dict];
                [arrTemp addObject:model];
            }
            _arrDatasModel = arrTemp ;
            //加载数据
            [self.tableView reloadData];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (error) {
                
            }
        }];
    }
    return _arrDatasModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDefaultSetting];
}
/**加载默认设置和UI*/
- (void)loadDefaultSetting
{
    // 自动设置当前控制器中的ScrollView的内边距(UIEdgeInsets)
    //[self setAutomaticallyAdjustsScrollViewInsets:NO];
    self.tableView.estimatedRowHeight = 40;
    self.tableView.sectionFooterHeight = 30;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 15, 15);
    [btn setImage:[UIImage imageNamed:@"shuaxin.png"] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    [btn addTarget:self action:@selector(refresh) forControlEvents:UIControlEventTouchUpInside];
    
}
- (void)refresh
{
    _page +=1;
    NSString *str = [NSString stringWithFormat:@"http://xiaolann.com/qqsay/v1/query.php?type=hot&page=%ld",_page];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/plain",@"application/json", nil];
    [manager GET:str parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *data = responseObject[@"data"];
        //[data writeToFile:@"/Users/qingyun/Desktop/QQ.plist" atomically:YES];
        NSInteger count = data.count;
        NSMutableArray *arrTemp = [NSMutableArray arrayWithCapacity:count];
        for (NSInteger index = 0; index < count; index++) {
            NSDictionary *dict = data[index];
            InfoModel *model = [InfoModel initWithDict:dict];
            [arrTemp addObject:model];
        }
        [self.arrDatasModel addObjectsFromArray:arrTemp];
        //加载数据
        [self.tableView reloadData];
    }failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

#pragma mark - Delegate
/** TableView中有多少个Section(分组) */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.arrDatasModel.count;
}
/** 在当前的Section中有多少cell(row) */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
// 只要dequeue的方法中有IndexPath, 就说明, 这个cell不是通过注册, 就是通过Storyboard中ProtoType类型创建的
/** 在IndexPath位置显示的cell */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    StatusCell *cell = [StatusCell cellWithTableView:tableView];
    InfoModel *status = self.arrDatasModel[indexPath.section];
    cell.status = status;
    // textLabel是懒加载的
    //cell.textLabel.text = status.strText;
   
    return cell;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (scrollView.contentOffset.y > scrollView.contentSize.height - scrollView.frame.size.height) {
        [self refresh];
    }
}
@end
