//
//  XLAbstractDotView.m
//  lunbo
//
//  Created by 杨晓龙 on 16/5/12.
//  Copyright © 2016年 杨晓龙. All rights reserved.
//

#import "XLAbstractDotView.h"

@implementation XLAbstractDotView

- (instancetype)init
{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:[NSString stringWithFormat:@"You must override %@ in %@",NSStringFromSelector(_cmd),self.class] userInfo:nil];
}
- (void)changeActivityState:(BOOL)active
{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:[NSString stringWithFormat:@"You must override %@ in %@",NSStringFromSelector(_cmd),self.class] userInfo:nil];
}
@end
