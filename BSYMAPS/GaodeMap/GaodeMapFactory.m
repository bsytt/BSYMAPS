//
//  GaodeMapFactory.m
//  BSYMAPS
//
//  Created by bsy on 2019/3/14.
//  Copyright © 2019年 bsy. All rights reserved.
//

#import "GaodeMapFactory.h"
#import "GaodeMapView.h"
#import <AMapFoundationKit/AMapFoundationKit.h> //高德
@interface GaodeMapFactory ()
@property (nonatomic , copy) NSString *appKey;

@end
@implementation GaodeMapFactory

+ (instancetype)shareMapFactory{
    static GaodeMapFactory *factory = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        factory = [[super alloc]initUniqueInstance];
    });
    return factory;
}
-(instancetype) initUniqueInstance {
    
    if (self = [super init]) {
        
    }
    
    return self;
}

- (void)initMap:(NSString *)appKey{
    [AMapServices sharedServices].apiKey = appKey;
    ///地图需要v4.5.0及以上版本才必须要打开此选项（v4.5.0以下版本，需要手动配置info.plist）
    [[AMapServices sharedServices] setEnableHTTPS:YES];
}

- (id<IMapView>)getMapView:(CGRect)frame{
    return [[GaodeMapView alloc]initWithFrame:frame];
}

@end
