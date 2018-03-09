//
//  MerchantsHandler.m
//  GouKuBD
//
//  Created by 窦建斌 on 2018/3/8.
//  Copyright © 2018年 lixiao. All rights reserved.
//

#import "MerchantsHandler.h"
#import "MerchantsEntity.h"

@implementation MerchantsHandler

+ (void)getCooperativeListWithOperId:(NSNumber *)operId pageNum:(NSNumber *)pageNum prepare:(PrepareBlock)prepare success:(SuccessBlock)success failed:(FailedBlock)failed{
    NSString *str_url = [self requestUrlWithPath:API_GET_COOPERATIVELIST];
    NSDictionary *dic = @{@"operId":operId,@"page":pageNum};
    [[RTHttpClient defaultClient] requestWithPath:str_url
                                           method:RTHttpRequestPost
                                       parameters:dic
                                          prepare:prepare
                                          success:^(NSURLSessionDataTask *task, id responseObject) {
                                              if ([[responseObject objectForKey:@"errCode"] intValue] == 0) {
                                                  NSArray *arr_data = [MerchantsEntity parseMerchantsListWithJson:[responseObject objectForKey:@"data"]];
                                                  success(arr_data);
                                              }else{
                                                  [MBProgressHUD hideHUD];
                                                  [MBProgressHUD showErrorMessage:[responseObject objectForKey:@"errMessage"]];
                                              }
                                          } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                              [self handlerErrorWithTask:task error:error complete:failed];
                                          }];
}

+ (void)getPotentialStoreListWithOperId:(NSNumber *)operId pageNum:(NSNumber *)pageNum prepare:(PrepareBlock)prepare success:(SuccessBlock)success failed:(FailedBlock)failed{
    NSString *str_url = [self requestUrlWithPath:API_GET_POTENTIALSTORELIST];
    NSDictionary *dic = @{@"operId":operId,@"page":pageNum};
    [[RTHttpClient defaultClient] requestWithPath:str_url
                                           method:RTHttpRequestPost
                                       parameters:dic
                                          prepare:prepare
                                          success:^(NSURLSessionDataTask *task, id responseObject) {
                                              if ([[responseObject objectForKey:@"errCode"] intValue] == 0) {
                                                  NSArray *arr_data = [MerchantsEntity parseMerchantsListWithJson:[responseObject objectForKey:@"data"]];
                                                  success(arr_data);
                                              }else{
                                                  [MBProgressHUD hideHUD];
                                                  [MBProgressHUD showErrorMessage:[responseObject objectForKey:@"errMessage"]];
                                              }
                                          } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                              [self handlerErrorWithTask:task error:error complete:failed];
                                          }];
}

@end
