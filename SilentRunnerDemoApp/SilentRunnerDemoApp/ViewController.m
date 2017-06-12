//
//  ViewController.m
//  SilentRunnerDemoApp
//
//  Created by andrew batutin on 2/17/17.
//  Copyright © 2017 HomeOfRisingSun. All rights reserved.
//

#import "ViewController.h"
#import <SilentRunnerEngine/SilentRunnerEngine.h>

@interface ViewController ()
@property (nonatomic, strong) SRServer* serv;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [SRServer enableLogging];
    
    // register your app delegate to be callable from test server
    [SRClientPool addClient:[UIApplication sharedApplication].delegate forTag:@"app"];
    self.serv = [SRServer serverWithURL:@"http://192.168.193.107:1489"  withErrorHandler:^(NSError * error) {
        [self.serv sendErrorMessage:error];
    }];
}

- (IBAction)testAction:(id)sender {
    [self.serv webSocket:self.serv.webSocket didReceiveMessage:@"Should see error at Silent Viewer"];
}

- (IBAction)runServer:(id)sender {
    [self.serv runServer:^(SRWebSocket* socket) {
        NSLog(@"server started");
    }];
}

- (IBAction)stopServer:(id)sender {
    [self.serv closeServer:^(SRWebSocket* socket) {
        NSLog(@"server stopped");
    }];
}


@end
