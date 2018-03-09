//
//  CooperativeStoreTableViewCell.h
//  GouKuBD
//
//  Created by 窦建斌 on 2018/3/1.
//  Copyright © 2018年 lixiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MerchantsEntity.h"

@interface CooperativeStoreTableViewCell : UITableViewCell
@property (nonatomic ,strong)NSString           *storeId;                   //商店ID
@property (nonatomic ,strong)NSString           *storeState;                //商店状态
@property (nonatomic ,strong)UIImageView        *img_storeHeadPic;          //商店头像
@property (nonatomic ,strong)UILabel            *lab_storeState;            //商店状态文字显示
@property (nonatomic ,strong)UILabel            *lab_storeName;             //商店名称
@property (nonatomic ,strong)UILabel            *lab_storeID;               //商店id显示
@property (nonatomic ,strong)UILabel            *lab_storeClassification;   //商店分类
@property (nonatomic ,strong)UILabel            *lab_storeAddress;          //商店地址
@property (nonatomic ,strong)UILabel            *lab_storeBD;               //商店所属BD
@property (nonatomic ,strong)UIButton           *btn_tellStore;             //联系商家按钮
@property (nonatomic ,strong)UIButton           *btn_storeEdit;             //编辑按钮
@property (nonatomic ,strong)UIButton           *btn_Login;                 //登录商家端按钮
@property (nonatomic ,strong)UIImageView        *img_shu;
@property (nonatomic ,strong)UIImageView        *img_line;                   

- (void)contentCellWithMerchantsEntity:(MerchantsEntity *)merchantsEntity;
@end

