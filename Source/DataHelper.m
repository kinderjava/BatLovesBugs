//
//  DataHelper.m
//  BatLovesBugs
//
//  Created by Jake Johnson on 11/3/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "DataHelper.h"

NSString * const kScore = @"kScore";
NSString * const kHighScore = @"kHighScore";

@implementation DataHelper

- (id) init
{
    self = [super init];
    if (self) {
        _score = 0;
        _highScore = 0;
    }
    return self;
}

+ (DataHelper *)sharedInstance
{
    static DataHelper *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    
    return _sharedInstance;
}

- (void)saveData
{
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInt:self.score] forKey:kScore];
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInt:self.highScore] forKey:kHighScore];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)loadData
{
    if ([[NSUserDefaults standardUserDefaults] objectForKey:kScore]) {
        self.score = [(NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:kScore] intValue];
        self.highScore = [(NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:kHighScore] intValue];
    } else {
        self.score = 0;
        self.highScore = 0;
    }
}

@end
