//
//  BSYMapFactory.h
//  BSYMAPS
//
//  Created by bsy on 2019/3/14.
//  Copyright © 2019年 bsy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IMapView.h"

@protocol BSYMapFactory <NSObject>

//地图遵循IMapView协议（工厂并不关心哪个地图）
- (id<IMapView>)getMapView:(CGRect)frame;

@end


