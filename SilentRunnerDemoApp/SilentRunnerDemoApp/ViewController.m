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
    [SRClientPool addClient:[UIApplication sharedApplication].delegate forTag:@"app"];
    self.serv = [SRServer serverWithURL:@"ws://localhost:9000/chat" withErrorHandler:^(NSError * error) {
        [self.serv sendErrorMessage:error];
    }];
    [self.serv runServer];
}



@end
