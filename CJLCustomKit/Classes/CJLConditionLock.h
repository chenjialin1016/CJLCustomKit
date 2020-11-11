//
//  CJLConditionLock.h
//  CJL_GCDTimer
//
//  Created by - on 2020/11/11.
//  Copyright © 2020 CJL. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CJLConditionLock : NSObject

- (instancetype)initWithCondition:(int)condition;

- (void)cjlLockWithCondition:(int)condition;

- (void)cjlUnlockWithCondition:(int)condition;

- (void)lock;
- (void)unlock;

@end

NS_ASSUME_NONNULL_END
