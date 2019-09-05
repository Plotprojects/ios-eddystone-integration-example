//
//  PlotEddystoneManager.h
//  EddystoneExample
//
//  Copyright © 2019 Plot Projects. All rights reserved.
//

#import "ESSBeaconScanner.h"

@interface PlotEddystoneManager : NSObject<ESSBeaconScannerDelegate> {
    ESSBeaconScanner *_scanner;
}

-(bool)isScanning;
-(void)stopScanning;
-(void)startScanning;

@end
