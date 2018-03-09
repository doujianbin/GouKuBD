//
//  PotentialStoreTableViewCell.m
//  GouKuBD
//
//  Created by 窦建斌 on 2018/3/1.
//  Copyright © 2018年 lixiao. All rights reserved.
//

#import "PotentialStoreTableViewCell.h"

@implementation PotentialStoreTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.lab_storeName = [[UILabel alloc]init];
        [self.contentView addSubview:self.lab_storeName];
        self.lab_storeName.font = [UIFont systemFontOfSize:16];
        [self.lab_storeName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(8);
            make.right.equalTo(self.mas_right).offset(-10);
        }];
        
        self.lab_storeID = [[UILabel alloc]init];
        [self.contentView addSubview:self.lab_storeID];
        [self.lab_storeID setFont:[UIFont systemFontOfSize:12]];
        [self.lab_storeID setTextColor:[UIColor colorWithRed:97/255.0 green:97/255.0 blue:97/255.0 alpha:1]];
        [self.lab_storeID mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.lab_storeName);
            make.top.equalTo(self.lab_storeName.mas_bottom).offset(7);
        }];
        
        self.img_shu = [[UIImageView alloc]init];
        [self.contentView addSubview:self.img_shu];
        [self.img_shu setBackgroundColor:[UIColor colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1]];
        [self.img_shu mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.lab_storeID.mas_right).offset(7);
            make.height.mas_equalTo(9);
            make.centerY.equalTo(self.lab_storeID);
            make.width.mas_equalTo(0.5);
        }];
        
        self.lab_storeClassification = [[UILabel alloc]init];
        [self.contentView addSubview:self.lab_storeClassification];
        [self.lab_storeClassification setFont:[UIFont systemFontOfSize:12]];
        [self.lab_storeClassification setTextColor:[UIColor colorWithRed:97/255.0 green:97/255.0 blue:97/255.0 alpha:1]];
        [self.lab_storeClassification mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.img_shu.mas_right).offset(7);
            make.centerY.equalTo(self.lab_storeID);
            make.right.lessThanOrEqualTo(self.mas_right).offset(-10);
        }];
        
        // 需要根据地址高度适配
        self.lab_storeAddress = [[UILabel alloc]init];
        [self.contentView addSubview:self.lab_storeAddress];
        self.lab_storeAddress.numberOfLines = 0;
        [self.lab_storeAddress setFont:[UIFont systemFontOfSize:12]];
        [self.lab_storeAddress setTextColor:[UIColor colorWithRed:97/255.0 green:97/255.0 blue:97/255.0 alpha:1]];
        [self.lab_storeAddress mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.width.equalTo(self.lab_storeName);
            make.top.equalTo(self.lab_storeID.mas_bottom).offset(7);
        }];
        
        self.img_line = [[UIImageView alloc]init];
        [self.contentView addSubview:self.img_line];
        [self.img_line setBackgroundColor:[UIColor colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1]];
        [self.img_line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.equalTo(self.lab_storeAddress.mas_bottom).offset(10);
            make.width.mas_equalTo(SCREEN_WIDTH);
            make.height.mas_equalTo(1);
        }];
        
        self.lab_storeBD = [[UILabel alloc]init];
        [self.contentView addSubview:self.lab_storeBD];
        [self.lab_storeBD setFont:[UIFont systemFontOfSize:12]];
        [self.lab_storeBD setTextColor:[UIColor colorWithRed:97/255.0 green:97/255.0 blue:97/255.0 alpha:1]];
        [self.lab_storeBD mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.width.equalTo(self.lab_storeName);
            make.top.equalTo(self.img_line.mas_bottom);
            make.height.mas_equalTo(48);
        }];
        
        [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(0);
            make.width.mas_equalTo(SCREEN_WIDTH);
            make.bottom.equalTo(self.lab_storeBD.mas_bottom);
        }];
        
//        self.btn_openStore = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 10 - 74, 90, 74, 30)];
//        [self.contentView addSubview:self.btn_openStore];
//        self.btn_openStore.layer.cornerRadius = 3.0f;
//        self.btn_openStore.layer.masksToBounds = YES;
//        [self.btn_openStore setBackgroundColor:COLOR_Main];
//        [self.btn_openStore setTitle:@"开店" forState:UIControlStateNormal];
//        [self.btn_openStore setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        self.btn_openStore.titleLabel.font = [UIFont systemFontOfSize:14];
        

        
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
