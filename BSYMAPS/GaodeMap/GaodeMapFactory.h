//
//  GaodeMapFactory.h
//  BSYMAPS
//
//  Created by bsy on 2019/3/14.
//  Copyright © 2019年 bsy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BSYMapFactory.h"

//高德地图工厂
@interface GaodeMapFactory : NSObject<BSYMapFactory>

+ (instancetype)shareMapFactory;
+(instancetype) alloc __attribute__((unavailable("call sharedInstance instead")));
+(instancetype) new __attribute__((unavailable("call sharedInstance instead")));
-(instancetype) copy __attribute__((unavailable("call sharedInstance instead")));
-(instancetype) mutableCopy __attribute__((unavailable("call sharedInstance instead")));

@end


