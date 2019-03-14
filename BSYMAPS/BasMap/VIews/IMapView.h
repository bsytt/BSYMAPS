//
//  IMapView.h
//  BSYMAPS
//
//  Created by bsy on 2019/3/14.
//  Copyright © 2019年 bsy. All rights reserved.
//

#import <UIKit/UIKit.h>

//地图统一协议
@protocol IMapView <NSObject>

//初始化地图规范
- (instancetype)initWithFrame:(CGRect)frame;
//在协议中定义统一标准
- (UIView *)getView;

@end

