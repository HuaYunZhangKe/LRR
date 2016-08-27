//
//  XLExtension.h
//  字典转模型
//
//  Created by 杨晓龙 on 16/8/1.
//  Copyright © 2016年 杨晓龙. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XLExtension : NSObject
+ (id)getModelWithDictionary:(NSDictionary *)dic class:(Class)cls;
@end
