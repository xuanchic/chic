//
//  ViewController.m
//  诉说
//
//  Created by qingyun on 16/8/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ShowViewController.h"
#import "HeaderSeting.h"
#import "AppDelegate.h"
#import "Masonry.h"

@interface ShowViewController ()<UITableViewDelegate>
@property (nonatomic, copy) NSArray *arrImagesName;
@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageCtl;
@property (nonatomic) NSInteger currentpage;

@end

@implementation ShowViewController

- (NSArray *)arrImagesName
{
    if (!_arrImagesName) {
        NSUInteger count = 3;
        NSMutableArray *arrMImages = [NSMutableArray arrayWithCapacity:count];
        for (NSUInteger index = 0; index < count ; index++) {
            NSString *strImage = [NSString stringWithFormat:@"new_feature_%ld.jpg",index + 1];
            [arrMImages addObject:strImage];
        }
        _arrImagesName = [arrMImages copy];
    }
    return _arrImagesName;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDefaultSetting];
}

/**加载默认设置和UI*/
- (void)loadDefaultSetting
{
#pragma UIScrollView
    //添加ScrollView
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = self.view.bounds;
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    //代理设置，否则不能使用代理方法
    scrollView.delegate = self;
    CGFloat imageWidth = self.scrollView.frame.size.width;
    CGFloat imageHeight = self.scrollView.frame.size.height;
    NSUInteger count = self.arrImagesName.count;
    /**通过遍历取出每个图片添加到图片视图上*/
    for (NSUInteger index = 0; index < count; index++) {
        UIImageView *imageView = [UIImageView new];
        [imageView setImage:[UIImage imageNamed:self.arrImagesName[index]]];
        imageView.frame = CGRectMake(index * imageWidth, 0, imageWidth, imageHeight);
        [scrollView addSubview:imageView];
        //让图片成为可以点击的
        imageView.userInteractionEnabled = YES;
        //在最后一个视图界面添加点击按钮
        if (index == count - 1) {
            [self loadEnjoyButton:imageView];
        }
    }
    //设置ScrollView的ContentSize
    scrollView.contentSize = CGSizeMake(count * imageWidth, 1);
    
#pragma UIPageControl
    UIPageControl *pageCtr = [[UIPageControl alloc] init];
    [pageCtr setNumberOfPages:count];
    [pageCtr setPageIndicatorTintColor:[UIColor whiteColor]];
    [pageCtr setCurrentPageIndicatorTintColor:[UIColor orangeColor]];
    [self.view addSubview:pageCtr];
    self.pageCtl = pageCtr;
    [pageCtr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@100);
        make.trailing.mas_equalTo(-100);
        make.bottom.equalTo(self.view).offset(-30);
        make.height.equalTo(@20);
    }];
    //通过添加事件方法的调用，完成UIScrollView 和pageCtroller的关联
    [pageCtr addTarget:self action:@selector(valuechanged:) forControlEvents:UIControlEventValueChanged];
}
//代理的方法，让让scrollVIew视图滑动时有方法响应pageControl的切换
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.pageCtl.currentPage = scrollView.contentOffset.x / scrollView.frame.size.width;
}

/**通过这个方法让pageCtrl可以控制图片的切换*/
- (void)valuechanged:(UIPageControl *)pagecotrol
{
    NSInteger currentpage = pagecotrol.currentPage;
    CGPoint offset = CGPointMake(currentpage * self.scrollView.frame.size.width, 0);
    [self.scrollView setContentOffset:offset];
}
                                                                              
- (void)loadEnjoyButton:(UIImageView *)imageView
{
    UIButton *btnEnjoy = [UIButton buttonWithType:UIButtonTypeSystem];
    [btnEnjoy setTitle:@"点击进入" forState:UIControlStateNormal];
    [btnEnjoy setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    btnEnjoy.titleLabel.font = [UIFont italicSystemFontOfSize:20];
    [self.scrollView addSubview:btnEnjoy];
    CGFloat width = 150;
    CGFloat X = (QLScreenWidth - width) * 0.5 +CGRectGetMinX(imageView.frame);
    CGFloat Y = QLScreenHeight - 100;
    btnEnjoy.frame = CGRectMake(X, Y, width, 50);
    [btnEnjoy.layer setCornerRadius:5.0];
    [btnEnjoy.layer setBorderColor:[UIColor orangeColor].CGColor];
    [btnEnjoy.layer setBorderWidth:1.0];
    [btnEnjoy.layer setMasksToBounds:YES];
    [btnEnjoy addTarget:self action:@selector(tapEnjoyAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)tapEnjoyAction
{
    // 保存版本号
    // NSUserDefaults:单例, 用法类似NSDictionary 就是能把信息存储到Bundle中的一个plist文件中
    NSString *strVersion = [[NSBundle mainBundle]objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    [[NSUserDefaults standardUserDefaults]setObject:strVersion forKey:@"oldVersionKey"];
    // 强制现在就写入plist
    [[NSUserDefaults standardUserDefaults]synchronize];
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    [delegate loadMainController];
}

@end
