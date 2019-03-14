//
//  BaiduMapFactory.m
//  BSYMAPS
//
//  Created by bsy on 2019/3/14.
//  Copyright © 2019年 bsy. All rights reserved.
//

#import "BaiduMapFactory.h"
#import "BaiduMapView.h"
#import <BaiduMapAPI_Base/BMKBaseComponent.h>//引入base相关所有的头文件百度

@implementation BaiduMapFactory

+ (instancetype)shareMapFactory {
    static BaiduMapFactory *factory = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        factory = [[super alloc]initUniqueInstance];
    });
    return factory;
}

- (void)initMap:(NSString *)appKey {
    // 要使用百度地图，请先启动BaiduMapManager
    BMKMapManager *mapManager = [[BMKMapManager alloc] init];
    // 如果要关注网络及授权验证事件，请设定generalDelegate参数
    BOOL ret = [mapManager start:appKey  generalDelegate:nil];
    if (!ret) {
        NSLog(@"manager start failed!");
    }
}
-(instancetype) initUniqueInstance {
    
    if (self = [super init]) {
        
    }
    
    return self;
}

//创建百度的MapView
- (id<IMapView>)getMapView:(CGRect)frame{
    return [[BaiduMapView alloc]initWithFrame:frame];
}

@end
