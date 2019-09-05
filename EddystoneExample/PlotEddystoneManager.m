//
//  PlotEddystoneManager.m
//  EddystoneExample
//
//  Copyright © 2019 Plot Projects. All rights reserved.
//

#import "PlotEddystoneManager.h"
#import "ESSEddystone.h"
#import <PlotProjects/Plot.h>

@implementation PlotEddystoneManager

-(instancetype)init{
    _scanner = [[ESSBeaconScanner alloc] init];
    _scanner.delegate = self;
    
    return self;
}

- (void)beaconScanner:(ESSBeaconScanner *)scanner
        didFindBeacon:(id)beaconInfo {
    [self beaconChanged:beaconInfo isExit:NO];
}

- (void)beaconScanner:(ESSBeaconScanner *)scanner
        didLoseBeacon:(id)beaconInfo {
    [self beaconChanged:beaconInfo isExit:YES];
}

-(void)beaconChanged:(id)beaconInfo isExit:(BOOL)isExit{
    ESSBeaconInfo* beacon = beaconInfo;
    NSString* beaconId = [[beacon beaconID] beaconInstance];
    NSString* enterOrExit = isExit ? @"Exited" : @"Entered";
    NSLog(@"%@", [NSString stringWithFormat:@"%@ Eddystone instance:%@", enterOrExit, beaconId]);
    NSDictionary<NSString *,NSString *>* properties = [NSDictionary dictionaryWithObjectsAndKeys:beaconId, @"id", nil];
    NSDictionary<NSString *,NSString *>* payload = [NSDictionary dictionaryWithObjectsAndKeys:@"replaced1", @"test1",@"replaced2",@"test2", nil];
    [Plot externalRegionTrigger:@[properties] triggerType:isExit ? PlotExternalTriggerTypeExit : PlotExternalTriggerTypeEnter matchPayload:payload];
}

-(bool)isScanning{
    return _scanner.isScanning;
}

-(void)startScanning{
    [_scanner startScanning];
}

-(void)stopScanning{
    [_scanner stopScanning];
}



@end
