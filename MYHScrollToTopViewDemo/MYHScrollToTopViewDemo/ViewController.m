//
//  ViewController.m
//  划到顶部test
//
//  Created by myh on 16/6/15.
//  Copyright © 2016年 myh. All rights reserved.
//
#import "MYHScrollToTopView.h"
#import "ViewController.h"



@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>{
    
    
    UIScrollView *_sc;
    UITableView *_tableView;
    
}
@property(nonatomic,strong)NSMutableArray *dataSource ;
@end

@implementation ViewController


#pragma mark Getting && 懒加载
- (NSMutableArray *)dataSource{
    
    if (_dataSource ==nil) {
        _dataSource = [NSMutableArray array];
        
        for (int i =0 ; i < 25; i++) {
            NSString *timeDate = [NSString stringWithFormat:@"现在时间%@",[NSDate date]];
            [_dataSource addObject:timeDate];
        }
        
        
    }
    
    return _dataSource;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // ios7之后状态栏由控制器来决定   在infoplist里面设置个东西 就可以使用下面的代码了 具体看infoplist View controller-based status bar appearance = no
    [UIApplication sharedApplication].statusBarStyle =UIStatusBarStyleDefault;;
    //    [UIApplication sharedApplication].statusBarHidden = YES;
    _sc  = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    _sc.backgroundColor = [UIColor redColor];
    _sc.bounces = YES;
    _sc.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height*2);
    [self.view addSubview:_sc];
    
    [self setupSC];
    [self setupUI];
}


-(void)setupUI{
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_sc addSubview:_tableView];
    
    
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.text = self.dataSource[indexPath.row];
    cell.textLabel.backgroundColor = [UIColor blueColor];
    
    
    
    return cell;
}


- (void)setupSC{
    
    
    for (int i = 0; i < 15; i++) {
        UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(100, 80*i, 100, 50)];
        NSString *tit = [NSString stringWithFormat:@"%d个按钮",i];
        [button setTitle: tit forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.backgroundColor=[UIColor yellowColor];
        
        [_sc addSubview:button];
    }
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
