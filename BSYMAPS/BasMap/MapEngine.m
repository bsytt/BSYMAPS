//
//  MapEngine.m
//  BSYMAPS
//
//  Created by bsy on 2019/3/14.
//  Copyright © 2019年 bsy. All rights reserved.
//

#import "MapEngine.h"
#import "BaiduMapFactory.h"
#import "PlatformXMLParser.h"
#import "Platform.h"

@implementation MapEngine

+ (instancetype)shareMapEngine {
    static MapEngine *map = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        map = [[MapEngine alloc]init];
    });
    return map;
}

- (id<BSYMapFactory>)getMapFatory {
    id factory;
    PlatformXMLParser *pser = [[PlatformXMLParser alloc]init];
    NSMutableArray *dataArr = [pser parser];
    NSString *key = nil;
    for (Platform *pf in dataArr) {
        if ([pf.isOpen isEqualToString:@"YES"]) {
            factory = NSClassFromString(pf.factoryName);
            key = pf.appKey;
        }
    }
    //返回具体的地图
    id manager = [factory performSelector:@selector(shareMapFactory) withObject:nil];
    [manager performSelector:@selector(initMap:) withObject:key];
    return manager;
}

@end
