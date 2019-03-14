//
//  GaodeMapView.m
//  BSYMAPS
//
//  Created by bsy on 2019/3/14.
//  Copyright © 2019年 bsy. All rights reserved.
//

#import "GaodeMapView.h"
#import <MAMapKit/MAMapKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>

@interface GaodeMapView()
@property (nonatomic, strong) MAMapView *mapView;

@end

@implementation GaodeMapView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super init];
    if (self) {
        _mapView = [[MAMapView alloc]initWithFrame:frame];
    }
    return self;
}
- (UIView *)getView {
    return _mapView;
}
@end
