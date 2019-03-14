//
//  Platform.h
//  BSYMAPS
//
//  Created by bsy on 2019/3/14.
//  Copyright © 2019年 bsy. All rights reserved.
//

#import <Foundation/Foundation.h>

//xml Model
@interface Platform : NSObject

@property (nonatomic , copy) NSString *mapId;

@property (nonatomic , copy) NSString *appKey;

@property (nonatomic , copy) NSString *factoryName;

@property (nonatomic , copy) NSString *isOpen;



@end

