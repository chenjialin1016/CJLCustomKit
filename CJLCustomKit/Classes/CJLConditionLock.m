//
//  CJLConditionLock.m
//  CJL_GCDTimer
//
//  Created by - on 2020/11/11.
//  Copyright © 2020 CJL. All rights reserved.
//

#import "CJLConditionLock.h"

@interface CJLConditionLock ()<NSLocking>
@property(nonatomic, copy) NSThread *mythread;

@property(nonatomic, assign) int value;

@property(nonatomic, strong) NSCondition *cond;

@end

@implementation CJLConditionLock


- (instancetype)initWithCondition:(int)condition{
    self = [super init];
    if (self) {
        _value = condition;
        _cond = [[NSCondition alloc] init];
    }
    return self;
}

- (void)cjlLockWithCondition:(int)condition{
    [_cond lock];
    while (_mythread != nil || _value != condition) {
        if (![_cond waitUntilDate:[NSDate distantPast]]) {
            [_cond unlock];
        }
    }
    _mythread = [NSThread currentThread];
    [_cond unlock];
}

- (void)cjlUnlockWithCondition:(int)condition{
    _value = condition;
    [_cond lock];
    _mythread = nil;
    [_cond broadcast];
    [_cond unlock];
}


- (void)lock {
    [_cond lock];
    while (_mythread != nil) {
        if (![_cond waitUntilDate:[NSDate distantPast]]) {
            [_cond unlock];
        }
    }
    _mythread = [NSThread currentThread];
    [_cond unlock];
}

- (void)unlock {
    [_cond lock];
    _mythread = nil;
    [_cond broadcast];
    [_cond unlock];
}



@end
