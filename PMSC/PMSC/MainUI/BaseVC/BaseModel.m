//
//  BaseModel.m
//  PMSC
//
//  Created by 杨晓龙 on 16/8/27.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "BaseModel.h"
#import "XLExtension.h"
@implementation BaseModel
+ (id)getDic:(NSDictionary *)dic
{
    NSDictionary *dict = [XLExtension getModelWithDictionary:dic class:[self class]];
    id model = [[self alloc] init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
}
@end
