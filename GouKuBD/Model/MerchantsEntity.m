//
//  MerchantsEntity.m
//  GouKuBD
//
//  Created by 窦建斌 on 2018/3/8.
//  Copyright © 2018年 lixiao. All rights reserved.
//

#import "MerchantsEntity.h"

@implementation MerchantsEntity

+(NSDictionary *)replacedKeyFromPropertyName
{
    return @{
             @"_status":@"status",
             };
}


+ (NSArray *)parseMerchantsListWithJson:(id)json{
    return [self parseObjectArrayWithKeyValues:json];
}

+ (MerchantsEntity *)parseMerchantsEntityWithJson:(id)json{
    return [self parseObjectWithKeyValues:json];
}



@end
