//
//  ViewController.m
//  EddystoneExample
//
//  Copyright © 2019 Plot Projects. All rights reserved.
//

#import "ViewController.h"

#import "PlotEddystoneManager.h"

@interface ViewController () <ESSBeaconScannerDelegate> {
  PlotEddystoneManager* eddystoneManager;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
    eddystoneManager = [[PlotEddystoneManager alloc] init];
}

-(IBAction)toggleScanning:(id)sender{
    if ([eddystoneManager isScanning]){
        [sender setTitle:@"Start Scanning" forState:UIControlStateNormal];
        [eddystoneManager stopScanning];
        eddystoneManager = nil;
    } else {
        [sender setTitle:@"Stop Scanning" forState:UIControlStateNormal];
        eddystoneManager = [[PlotEddystoneManager alloc] init];
        [eddystoneManager startScanning];
    }
}

@end
