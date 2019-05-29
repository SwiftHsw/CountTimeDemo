//
//  ATCountTimeDownManager.h
//  ATDemoProject
//
//  Created by Shiwen Huang on 2018/8/22.
//  Copyright © 2018年 Shiwen Huang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ATCountTimeDownManager : NSObject
///获取验证码倒计时
-(void)countDownWithTime:(NSInteger)totalTime completeBlock:(void(^)(NSInteger countDown))completeBlock;
///主动销毁定时器
-(void)destoryTimer;

@end
