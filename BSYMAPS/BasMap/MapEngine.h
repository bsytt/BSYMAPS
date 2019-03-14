//
//  MapEngine.h
//  BSYMAPS
//
//  Created by bsy on 2019/3/14.
//  Copyright © 2019年 bsy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BSYMapFactory.h"
NS_ASSUME_NONNULL_BEGIN
//地图引擎（工厂模式-简单工厂模式）
@interface MapEngine : NSObject

+ (instancetype)shareMapEngine;
//定义方法规范
- (id<BSYMapFactory>)getMapFatory;

@end

NS_ASSUME_NONNULL_END
