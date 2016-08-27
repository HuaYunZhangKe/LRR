//
//  XLExtension.m
//  字典转模型
//
//  Created by 杨晓龙 on 16/8/1.
//  Copyright © 2016年 杨晓龙. All rights reserved.
//

#import "XLExtension.h"
#import <objc/runtime.h>
@implementation XLExtension
+ (NSDictionary *)getModelWithDictionary:(NSDictionary *)dic class:(Class)cls
{
    unsigned int count;//记录属性个数
    objc_property_t *properties = class_copyPropertyList(cls, &count);
    NSMutableArray *mArray = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        objc_property_t property = properties[i];
        const char *cName = property_getName(property);
        NSString *name = [NSString stringWithCString:cName encoding:NSUTF8StringEncoding];
        [mArray addObject:name];
    }
    NSLog(@"%@",mArray);
    NSLog(@"%@",dic.allKeys);
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    for (NSString *dStr in dic.allKeys) {
        for (NSString *mStr in mArray) {
            if ([mStr isEqualToString:dStr]) {
                [dict setObject:dic[mStr] forKey:mStr];
            }
        }
    }
    NSLog(@"%@",dict);

    return dict;
}
@end
