//
//  MerchantsEntity.h
//  GouKuBD
//
//  Created by 窦建斌 on 2018/3/8.
//  Copyright © 2018年 lixiao. All rights reserved.
//

#import "BaseEntity.h"

@interface MerchantsEntity : BaseEntity

@property (nonatomic ,strong)NSString  *name;
@property (nonatomic ,strong)NSString  *branchName;
@property (nonatomic ,strong)NSString  *phone;
@property (nonatomic ,strong)NSNumber  *category1;
@property (nonatomic ,strong)NSNumber  *category2;
@property (nonatomic ,strong)NSNumber  *category3;
@property (nonatomic ,strong)NSNumber  *provinceId;
@property (nonatomic ,strong)NSNumber  *cityId;
@property (nonatomic ,strong)NSNumber  *districtId;
@property (nonatomic ,strong)NSString  *address;
@property (nonatomic ,assign)double     lat;
@property (nonatomic ,assign)double     lon;
@property (nonatomic ,strong)NSNumber  *openAt;
@property (nonatomic ,strong)NSNumber  *closeAt;
@property (nonatomic ,strong)NSNumber  *_status;


+ (NSArray *)parseMerchantsListWithJson:(id)json;

+ (MerchantsEntity *)parseMerchantsEntityWithJson:(id)json;


@end

