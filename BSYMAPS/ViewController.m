//
//  ViewController.m
//  BSYMAPS
//
//  Created by bsy on 2019/3/14.
//  Copyright © 2019年 bsy. All rights reserved.
//

#import "ViewController.h"
#import "MapEngine.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    MapEngine *mapEngin = [MapEngine shareMapEngine];
    id<BSYMapFactory> factory = [mapEngin getMapFatory];
    id<IMapView> mapView = [factory getMapView:self.view.frame];
    [self.view addSubview:[mapView getView]];

}


@end
