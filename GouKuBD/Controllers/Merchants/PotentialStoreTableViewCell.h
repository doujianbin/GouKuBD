//
//  PotentialStoreTableViewCell.h
//  GouKuBD
//
//  Created by 窦建斌 on 2018/3/1.
//  Copyright © 2018年 lixiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PotentialStoreTableViewCell : UITableViewCell

@property (nonatomic ,strong)NSString           *storeId;                   //商店ID
@property (nonatomic ,strong)UILabel            *lab_storeName;                 //商店名称
@property (nonatomic ,strong)UILabel            *lab_storeID;               //商店id显示
@property (nonatomic ,strong)UILabel            *lab_storeClassification;   //商店分类
@property (nonatomic ,strong)UILabel            *lab_storeAddress;          //商店地址
@property (nonatomic ,strong)UILabel            *lab_storeBD;               //商店所属BD
@property (nonatomic ,strong)UIButton           *btn_openStore;             //开店按钮
@property (nonatomic ,strong)UIImageView        *img_shu;
@property (nonatomic ,strong)UIImageView        *img_line;

@end
