//
//  HuiHuaViewController.m
//  HuiHua
//
//  Created by apple on 2018/4/27.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "HuiHuaViewController.h"
#import <MJRefresh/MJRefresh.h>

static NSString *ident =@"HuiHuaTableViewCell";
#import "HuiHuaTableViewCell.h"
#import "HHTableView.h"

@interface HuiHuaViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>
@property(nonatomic,strong)UITableView *tableView;

@property(nonatomic,strong)NSMutableArray *arr;

@property(nonatomic,assign)BOOL bottom;


@end

@implementation HuiHuaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self loadNewData];
    // 马上进入刷新状态
//    [self.tableView.header beginRefreshing];
    
    _bottom = YES;
    
//    [self.tableView.mj_header beginRefreshing];

    
    [self.view addSubview:self.tableView];
    
    
    
    

    
//    self.tableVIew.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
}



-(void)loadNewData{
    
    _arr = @[@"121313213131313132131313131313132313131313131313131"
             ,@"121313213131313132131313131313132313131313131313131121313213131313132131313131313132313131313131313131121313213131313132131313131313132313131313131313131121313213131313132131313131313132313131313131313131"
             ,@"121313213131313132131313131313132313131313131313131121313213131313132131313131313132313131313131313131121313213131313132131313131313132313131313131313131121313213131313132131313131313132313131313131313131121313213131313132131313131313132313131313131313131121313213131313132131313131313132313131313131313131121313213131313132131313131313132313131313131313131121313213131313132131313131313132313131313131313131121313213131313132131313131313132313131313131313131"
             ,@"121313213131313132131313131313132313131313131313131121313213131313132131313131313132313131313131313131121313213131313132131313131313132313131313131313131121313213131313132131313131313132313131313131313131121313213131313132131313131313132313131313131313131121313213131313132131313131313132313131313131313131121313213131313132131313131313132313131313131313131121313213131313132131313131313132313131313131313131121313213131313132131313131313132313131313131313131"
             ,@"121313213131313132131313131313132313131313131313131121313213131313132131313131313132313131313131313131121313213131313132131313131313132313131313131313131121313213131313132131313131313132313131313131313131121313213131313132131313131313132313131313131313131121313213131313132131313131313132313131313131313131121313213131313132131313131313132313131313131313131121313213131313132131313131313132313131313131313131121313213131313132131313131313132313131313131313131"
             ,@"121313213131313132131313131313132313131313131313131121313213131313132131313131313132313131313131313131121313213131313132131313131313132313131313131313131121313213131313132131313131313132313131313131313131121313213131313132131313131313132313131313131313131121313213131313132131313131313132313131313131313131121313213131313132131313131313132313131313131313131121313213131313132131313131313132313131313131313131121313213131313132131313131313132313131313131313131"
             ,@"121313213131313132131313131313132313131313131313131121313213131313132131313131313132313131313131313131121313213131313132131313131313132313131313131313131121313213131313132131313131313132313131313131313131121313213131313132131313131313132313131313131313131121313213131313132131313131313132313131313131313131121313213131313132131313131313132313131313131313131121313213131313132131313131313132313131313131313131121313213131313132131313131313132313131313131313131"].mutableCopy;
    
    [_tableView reloadData];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

}

-(void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([indexPath row] == ((NSIndexPath*)[[tableView indexPathsForVisibleRows] lastObject]).row){
        
        if (_bottom == YES) {
            dispatch_async(dispatch_get_main_queue(), ^{
                CGPoint offset = CGPointMake(0, self.tableView.contentSize.height - self.tableView.frame.size.height);
                [self.tableView setContentOffset:offset animated:NO];
                _bottom = NO;
//                 [self addlist];
                
//
            });
        }else{
            
        }

    }
}

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    CGFloat fl = scrollView.contentOffset.y;
//
//    NSLog(@"%.2f",fl);
//}



- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64) style:(UITableViewStylePlain)];
        _tableView.delegate = self;
        
        _tableView.dataSource = self;
        
//        UIView *vie=[[UIView alloc]initWithFrame:CGRectZero];
//
//        vie.frame = self.view.bounds;
//        vie.backgroundColor = [UIColor grayColor];
        
//        _tableVIew.backgroundView = vie;
        
        _tableView.backgroundColor = [UIColor grayColor];
        
        [_tableView registerNib:[UINib nibWithNibName:ident bundle:nil] forCellReuseIdentifier:ident];
        
         __weak __typeof(&*self)weakSelf = self;
        
        // 下拉刷新
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [weakSelf.tableView.mj_header endRefreshing];

            [weakSelf addlist];
            
            
         

//            weakSelf.pageIndex = 1;

//            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
////                [weakSelf.tableVIew.mj_header endRefreshing];

//            });
        }];
        
        // 上拉加载
//        _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
//
////            if ( weakSelf.pageIndex < -1 ) {  weakSelf.pageIndex = 1;  }
//
//            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                [weakSelf.tableView.mj_footer endRefreshing];
//            });
//        }];

        
        
        
    }
    return _tableView;
}

-(void)addlist {
    
    
    NSMutableArray *addArr = [NSMutableArray array];
    
    for (int i = 0; i < 10; i++) {
        
        NSString *str = [NSString stringWithFormat:@"%@ = %zd",[NSDate date],i ];
        
//        [addArr insertObject:str atIndex:0];
        
        [addArr addObject:str];
        
    }
    
   
//    [self.tableVIew beginUpdates];
    
//    float height1 = self.tableView.contentSize.height;
    
    
    for (NSString *str  in addArr) {
         [self.arr insertObject:str atIndex:0];
        
//        NSMutableArray *indexPaths = [[NSMutableArray alloc] init];
//
//        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//        [indexPaths addObject: indexPath];
//
//
//        [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];

        
    }

//    [self.tableView reloadData];
    
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:10 inSection:0];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
        [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:NO];
    });
    
    
    
    
////    [self.tableView reloadData];
//    float height2 = self.tableView.contentSize.height;
//    float difference = height2 - height1;
////    if ([addArr count])
////    {
//        difference = difference - 50;
////    }
//    [self.tableView setContentOffset:CGPointMake(0, difference)];
    
    
    
//    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:10 inSection:0] atScrollPosition:(UITableViewScrollPositionTop) animated:YES];
    
    
//    [self.tableView  setContentOffset:CGPointMake(0, self.tableView.contentSize.height-self.tableView .frame.size.height) animated:NO];
    
//     [self.tableVIew endUpdates];
    
//    [self.tableVIew reloadData];
    
    
   
    
    
    
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HuiHuaTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:ident forIndexPath:indexPath];
     cell.label.edgeInsets    = UIEdgeInsetsMake(10, 10, 10, 10); // 设置左内边距
    
    [cell setSelectionStyle:(UITableViewCellSelectionStyleNone)];
    
    cell.label.text = _arr[indexPath.row];
    
    cell.contentView.backgroundColor = [UIColor clearColor];
    
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    []
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
