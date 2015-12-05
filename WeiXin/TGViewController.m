//
//  TGViewController.m
//  WeiXin
//
//  Created by qingyun on 15/12/4.
//  Copyright © 2015年 qingyun. All rights reserved.
//

#import "TGViewController.h"

#define QYScreenW [UIScreen mainScreen].bounds.size.width
#define QYScreenH [UIScreen mainScreen].bounds.size.height
#define ImageViewCount 3

@interface TGViewController ()<UIScrollViewDelegate>

@property (nonatomic,strong) UIScrollView *scrollView;

@end

@implementation TGViewController
//设定屏宽和屏高
#define QYScreenW [UIScreen mainScreen].bounds.size.width
#define QYScreenH [UIScreen mainScreen].bounds.size.height
//设定相册的照片数量
#define ImageViewCount 3

- (void)viewDidLoad {
    [super viewDidLoad];
    //用方法添加滚动视图
    [self addScrollView];

    //设置content
    [self addContentForScrollView];
}

- (void)addScrollView{
    //创建scrollview
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, QYScreenW, 200)];
    
    [self.view addSubview:scrollView];
    
    //设置content size
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * ImageViewCount, scrollView.frame.size.height);
    //设置代理
    scrollView.delegate = self;
    
    //设置分页
    scrollView.pagingEnabled = YES;
    
    //不显示竖直滚动条
    scrollView.showsHorizontalScrollIndicator = YES;
    scrollView.showsVerticalScrollIndicator = NO;
    
    //滚动条位置
//    scrollView.scrollIndicatorInsets = UIEdgeInsetsMake(300, 0, 0, 0);
//    scrollView.indicatorStyle = UIScrollViewIndicatorStyleBlack;

    //锁定方向
    scrollView.directionalLockEnabled = YES;
    scrollView.alwaysBounceVertical = NO;
    scrollView.alwaysBounceHorizontal = YES;
    
    //超出边界，反弹效果
    scrollView.bounces = NO;
    
    //设置背景
    scrollView.backgroundColor = [UIColor blackColor];
    
    _scrollView = scrollView;
    
}

//添加滚动视图的内容
- (void)addContentForScrollView{
    for (int i = 0; i < ImageViewCount; i++) {
        UIScrollView *zoomScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake((QYScreenW) * i, 0, QYScreenW, _scrollView.frame.size.height)];
        [_scrollView addSubview:zoomScrollView];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, QYScreenW, _scrollView.frame.size.height)];
        [zoomScrollView addSubview:imageView];
        
        //设置图片
        NSString *imageName = [NSString stringWithFormat:@"new_feature_%d",i + 1];
        imageView.image = [UIImage imageNamed:imageName];
        
        //设置代理
        zoomScrollView.delegate = self;
        
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
