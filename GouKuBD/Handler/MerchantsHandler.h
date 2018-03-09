//
//  MerchantsHandler.h
//  GouKuBD
//
//  Created by 窦建斌 on 2018/3/8.
//  Copyright © 2018年 lixiao. All rights reserved.
//

#import "BaseHandler.h"

@interface MerchantsHandler : BaseHandler

//获取合作门店列表
+ (void)getCooperativeListWithOperId:(NSNumber *)operId pageNum:(NSNumber *)pageNum prepare:(PrepareBlock)prepare success:(SuccessBlock)success failed:(FailedBlock)failed;

//获取潜在门店列表
+ (void)getPotentialStoreListWithOperId:(NSNumber *)operId pageNum:(NSNumber *)pageNum prepare:(PrepareBlock)prepare success:(SuccessBlock)success failed:(FailedBlock)failed;

@end
