//
//  MerchantsViewController.m
//  GouKuBD
//
//  Created by lixiao on 2018/2/26.
//  Copyright © 2018年 lixiao. All rights reserved.
//

#import "MerchantsViewController.h"
#import "CooperativeStoreTableViewCell.h"
#import "PotentialStoreTableViewCell.h"
#import "BaseTableView.h"
#import "LoginStorage.h"
#import "RTHttpClient.h"
#import "TableBackgroudView.h"
#import "MerchantsEntity.h"
#import "MerchantsHandler.h"

@interface MerchantsViewController ()<UITableViewDelegate,UITableViewDataSource,BaseTableViewDelagate>
@property (nonatomic,strong)UISegmentedControl *segmentedControl;
@property (nonatomic,strong)BaseTableView      *MDtableView;
@property (nonatomic,strong)NSMutableArray     *arr_cooperationStore;
@property (nonatomic,strong)NSMutableArray     *arr_potentialStore;
@property (nonatomic,assign)int                selectedIndex;
@end

@implementation MerchantsViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.arr_cooperationStore = [[NSMutableArray alloc]init];
        self.arr_potentialStore = [[NSMutableArray alloc]init];
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)onCreate{
    
    // 初始化，添加分段名，会自动布局
    NSArray *segmentedArray = [NSArray arrayWithObjects:@"合作门店",@"潜在门店",nil];
    
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc]initWithItems:segmentedArray];
    
    segmentedControl.frame = CGRectMake(0, 0, SCREEN_WIDTH - 160, 26);
    
    segmentedControl.selectedSegmentIndex = 0;
    segmentedControl.layer.masksToBounds = YES;
    segmentedControl.layer.borderColor = [[UIColor whiteColor] CGColor];
    segmentedControl.layer.borderWidth = 1;
    segmentedControl.layer.cornerRadius = 4;
    
    segmentedControl.tintColor = [UIColor whiteColor];
    [segmentedControl setTitleTextAttributes:@{NSForegroundColorAttributeName:COLOR_Main} forState:UIControlStateSelected];
    
    [segmentedControl setBackgroundImage:[self createImageWithColor:COLOR_Main] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [segmentedControl setBackgroundImage:[self createImageWithColor:[UIColor whiteColor]] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    
    [segmentedControl addTarget:self action:@selector(indexDidChangeForSegmentedControl:)
     
               forControlEvents:UIControlEventValueChanged];
    
    self.navigationItem.titleView = segmentedControl;
    
    [self addTableView];
    
}

- (void)tableView:(UITableView *)tableView requestDataSourceWithPageNum:(NSInteger)pageNum complete:(DataCompleteBlock)complete{
    NSNumber *page = [NSNumber numberWithInteger:pageNum];
    NSNumber *operId = [NSNumber numberWithInt:[[LoginStorage GetOperId] intValue]];
    if (self.selectedIndex == 0) {
        [MerchantsHandler getCooperativeListWithOperId:operId pageNum:page prepare:^{
        } success:^(id obj) {
            NSArray *arr_data = (NSArray *)obj;
            if (pageNum == 0) {
                [self.arr_cooperationStore removeAllObjects];
            }
            [self.arr_cooperationStore addObjectsFromArray:obj];
            complete(arr_data.count);
            if (self.arr_cooperationStore.count == 0) {
                self.MDtableView.defaultView = [[TableBackgroudView alloc]initWithFrame:self.MDtableView.frame withDefaultImage:nil withNoteTitle:@"暂无数据" withNoteDetail:nil withButtonAction:nil];
            }
        } failed:^(NSInteger statusCode, id json) {
            if (complete) {
                complete(CompleteBlockErrorCode);
            }
            [MBProgressHUD showErrorMessage:(NSString *)json];
        }];
    }else{
        [MerchantsHandler getPotentialStoreListWithOperId:operId pageNum:page prepare:^{
            
        } success:^(id obj) {
            NSArray *arr_data = (NSArray *)obj;
            if (pageNum == 0) {
                [self.arr_potentialStore removeAllObjects];
            }
            [self.arr_potentialStore addObjectsFromArray:arr_data];
            complete(arr_data.count);
            if (self.arr_potentialStore.count == 0) {
                self.MDtableView.defaultView = [[TableBackgroudView alloc]initWithFrame:self.MDtableView.frame withDefaultImage:nil withNoteTitle:@"暂无数据" withNoteDetail:nil withButtonAction:nil];
            }
        } failed:^(NSInteger statusCode, id json) {
            if (complete) {
                complete(CompleteBlockErrorCode);
            }
            [MBProgressHUD showErrorMessage:(NSString *)json];
        }];
    }
}

- (void)addTableView{
    
    self.MDtableView = [[BaseTableView alloc]initWithFrame:CGRectMake(0, SafeAreaTopHeight, SCREEN_WIDTH, CGRectGetHeight(self.view.frame) - SafeAreaTopHeight - SafeAreaBottomHeight) style:UITableViewStyleGrouped hasHeaderRefreshing:YES hasFooterRefreshing:YES];
    
    [self.view addSubview:self.MDtableView];
    self.MDtableView.dataSource = self;
    self.MDtableView.delegate = self;
    self.MDtableView.tableViewDelegate = self;
    self.MDtableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.MDtableView setBackgroundColor:[UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1]];
    self.MDtableView.defaultView = [[TableBackgroudView alloc]initWithFrame:self.MDtableView.frame withDefaultImage:nil withNoteTitle:@"暂无数据" withNoteDetail:nil withButtonAction:nil];
    [self.MDtableView requestDataSource];
}


//masory 适配要写的
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (self.selectedIndex == 0) {
        if (section == self.arr_cooperationStore.count - 1) {
            return 10;
        }
    }else if (self.selectedIndex == 1){
        if (section == self.arr_potentialStore.count - 1) {
            return 10;
        }
    }
    return 0.01;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.selectedIndex == 0) {
        return self.arr_cooperationStore.count;
    }else if (self.selectedIndex == 1){
        return self.arr_potentialStore.count;
    }
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.selectedIndex == 0) {
        static NSString *CellIdentifier = @"CooperativeStoreTableViewCell";
        CooperativeStoreTableViewCell *cell = (CooperativeStoreTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (!cell){
            cell = [[CooperativeStoreTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        MerchantsEntity *entity = [self.arr_cooperationStore objectAtIndex:indexPath.section];
        [cell contentCellWithMerchantsEntity:entity];
        return cell;
    }else if(self.selectedIndex == 1){
        static NSString *CellIdentifier = @"PotentialStoreTableViewCell";
        PotentialStoreTableViewCell *cell = (PotentialStoreTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (!cell){
            cell = [[PotentialStoreTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        
        [cell.lab_storeName setText:[[self.arr_potentialStore objectAtIndex:indexPath.section] objectForKey:@"storeName"]];
        [cell.lab_storeID setText:[[self.arr_potentialStore objectAtIndex:indexPath.section] objectForKey:@"storeID"]];
        [cell.lab_storeAddress setText:[[self.arr_potentialStore objectAtIndex:indexPath.section] objectForKey:@"address"]];
        [cell.lab_storeClassification setText:[[self.arr_potentialStore objectAtIndex:indexPath.section] objectForKey:@"Classification"]];
        [cell.lab_storeBD setText:[[self.arr_potentialStore objectAtIndex:indexPath.section] objectForKey:@"storeBd"]];
        //        [cell.lab_storeName setText:[[self.arr_potentialStore objectAtIndex:indexPath.row] objectForKey:@"storeName"]];
        return cell;
    }
    return NULL;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)indexDidChangeForSegmentedControl:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 0) {
        NSLog(@"合作门店");
        self.selectedIndex = 0;
    } else {
        NSLog(@"潜在门店");
        self.selectedIndex = 1;
        
    }
    [self.MDtableView requestDataSource];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIImage *)createImageWithColor:(UIColor *)color{
    
    CGRect rect=CGRectMake(0.0f,0.0f,1.0f,1.0f);UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *theImage=UIGraphicsGetImageFromCurrentImageContext();UIGraphicsEndImageContext();
    return theImage;
    
}

@end

