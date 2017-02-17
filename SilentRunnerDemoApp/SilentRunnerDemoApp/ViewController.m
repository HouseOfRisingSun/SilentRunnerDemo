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
    self.serv = [SRServer serverWithURL:@"ws://localhost:9000/chat" withMessageHandler:^(NSString * msg) {
        NSError* error = nil;
        SRCommand* command = (SRCommand*)[SRMessageHandler createCommandFromMessage:msg withError:^(NSError* error){
            [self.serv sendErrorMessage:error];
        }];
        [SRCommandHandler runCommand:command withError:&error];
        if ( error ){
            [self.serv sendErrorMessage:error];
        }
    } withErrorHandler:^(NSError * error) {
        [self.serv sendErrorMessage:error];
    }];
    [self.serv runServer];
}



@end
