//
//  CooperativeStoreTableViewCell.m
//  GouKuBD
//
//  Created by 窦建斌 on 2018/3/1.
//  Copyright © 2018年 lixiao. All rights reserved.
//

#import "CooperativeStoreTableViewCell.h"

@implementation CooperativeStoreTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.img_storeHeadPic = [[UIImageView alloc]init];
        self.img_storeHeadPic.contentMode = UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:self.img_storeHeadPic];
        [self.img_storeHeadPic mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(10);
            make.width.height.mas_equalTo(60);
        }];
        
        self.lab_storeState = [[UILabel alloc]init];
        [self.img_storeHeadPic addSubview:self.lab_storeState];
        self.lab_storeState.font = [UIFont systemFontOfSize:11];
        [self.lab_storeState setTextAlignment:NSTextAlignmentCenter];
        [self.lab_storeState mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(46);
            make.width.mas_equalTo(60);
            make.height.mas_equalTo(14);
        }];
        
        self.lab_storeName = [[UILabel alloc]init];
        [self.contentView addSubview:self.lab_storeName];
        [self.lab_storeName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.img_storeHeadPic.mas_right).offset(10);
            make.top.mas_equalTo(8);
            make.right.equalTo(self.mas_right).offset(-10);
            make.height.mas_equalTo(22);
        }];
        
        self.lab_storeID = [[UILabel alloc]init];
        [self.contentView addSubview:self.lab_storeID];
        [self.lab_storeID setFont:[UIFont systemFontOfSize:12]];
        [self.lab_storeID setTextColor:[UIColor colorWithRed:97/255.0 green:97/255.0 blue:97/255.0 alpha:1]];
        [self.lab_storeID mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.lab_storeName);
            make.top.equalTo(self.lab_storeName.mas_bottom).offset(2);
            make.height.mas_equalTo(17);
        }];
        
        self.img_shu = [[UIImageView alloc]init];
        [self.contentView addSubview:self.img_shu];
        [self.img_shu setBackgroundColor:[UIColor colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1]];
        [self.img_shu mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.lab_storeID.mas_right).offset(7);
            make.top.mas_equalTo(37);
            make.height.mas_equalTo(9);
            make.width.mas_equalTo(0.5);
        }];
        
        self.lab_storeClassification = [[UILabel alloc]init];
        [self.contentView addSubview:self.lab_storeClassification];
        [self.lab_storeClassification setFont:[UIFont systemFontOfSize:12]];
        [self.lab_storeClassification setTextColor:[UIColor colorWithRed:97/255.0 green:97/255.0 blue:97/255.0 alpha:1]];
        [self.lab_storeClassification mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.img_shu.mas_right).offset(7);
            make.top.height.equalTo(self.lab_storeID);
            make.right.lessThanOrEqualTo(self.mas_right).offset(-10);
        }];
        
        // 需要根据地址高度适配
        self.lab_storeAddress = [[UILabel alloc]init];
        self.lab_storeAddress.numberOfLines = 0;
        [self.contentView addSubview:self.lab_storeAddress];
        [self.lab_storeAddress setFont:[UIFont systemFontOfSize:12]];
        [self.lab_storeAddress setTextColor:[UIColor colorWithRed:97/255.0 green:97/255.0 blue:97/255.0 alpha:1]];
        [self.lab_storeAddress mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.lab_storeID);
            make.right.equalTo(self.mas_right).offset(-10);
            make.top.equalTo(self.lab_storeID.mas_bottom).offset(5);
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
            make.left.mas_equalTo(10);
            make.top.equalTo(self.img_line.mas_bottom);
            make.height.mas_equalTo(50);
        }];
        
        self.btn_Login = [[UIButton alloc]init];
        [self.contentView addSubview:self.btn_Login];
        self.btn_Login.layer.cornerRadius = 3.0f;
        self.btn_Login.layer.masksToBounds = YES;
        [self.btn_Login setBackgroundColor:COLOR_Main];
        [self.btn_Login setTitle:@"登录商家端" forState:UIControlStateNormal];
        [self.btn_Login setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.btn_Login.titleLabel.font = [UIFont systemFontOfSize:14];
        [self.btn_Login mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).offset(-10);
            make.width.mas_equalTo(90);
            make.top.equalTo(self.img_line.mas_bottom).offset(10);
            make.height.mas_equalTo(30);
        }];
        
        self.btn_storeEdit = [[UIButton alloc]init];
        [self.contentView addSubview:self.btn_storeEdit];
        self.btn_storeEdit.layer.cornerRadius = 3.0f;
        self.btn_storeEdit.layer.masksToBounds = YES;
        self.btn_storeEdit.layer.borderWidth = 1;
        self.btn_storeEdit.layer.borderColor = [[UIColor colorWithRed:194/255.0 green:194/255.0 blue:194/255.0 alpha:1] CGColor];
        [self.btn_storeEdit setBackgroundColor:[UIColor whiteColor]];
        [self.btn_storeEdit setTitle:@"编辑" forState:UIControlStateNormal];
        [self.btn_storeEdit setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.btn_storeEdit.titleLabel.font = [UIFont systemFontOfSize:14];
        [self.btn_storeEdit mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.height.equalTo(self.btn_Login);
            make.right.equalTo(self.btn_Login.mas_left).offset(-10);
            make.width.mas_equalTo(74);
        }];
        
        self.btn_tellStore = [[UIButton alloc]init];
        [self.contentView addSubview:self.btn_tellStore];
        self.btn_tellStore.layer.cornerRadius = 3.0f;
        self.btn_tellStore.layer.masksToBounds = YES;
        self.btn_tellStore.layer.borderWidth = 1;
        self.btn_tellStore.layer.borderColor = [[UIColor colorWithRed:194/255.0 green:194/255.0 blue:194/255.0 alpha:1] CGColor];
        [self.btn_tellStore setBackgroundColor:[UIColor whiteColor]];
        [self.btn_tellStore setTitle:@"联系商家" forState:UIControlStateNormal];
        [self.btn_tellStore setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.btn_tellStore.titleLabel.font = [UIFont systemFontOfSize:14];
        [self.btn_tellStore mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.height.equalTo(self.btn_Login);
            make.right.equalTo(self.btn_storeEdit.mas_left).offset(-10);
            make.width.mas_equalTo(74);
        }];
        
        [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.mas_equalTo(0);
            make.width.mas_equalTo(SCREEN_WIDTH);
            make.bottom.equalTo(self.btn_tellStore.mas_bottom).offset(10);
        }];
        
    }
    return self;
}

- (void)contentCellWithMerchantsEntity:(MerchantsEntity *)merchantsEntity{
    [self.lab_storeName setText:merchantsEntity.name];
    [self.lab_storeID setText:[NSString stringWithFormat:@"ID %@",merchantsEntity.districtId]];
    [self.lab_storeAddress setText:merchantsEntity.address];
    [self.lab_storeBD setText:merchantsEntity.branchName];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end

