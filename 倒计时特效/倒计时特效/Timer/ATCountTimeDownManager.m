//
//  ATCountTimeDownManager.m
//  ATDemoProject
//
//  Created by Shiwen Huang on 2018/8/22.
//  Copyright © 2018年 Shiwen Huang. All rights reserved.
//

#import "ATCountTimeDownManager.h"
#import "SWKit.h"
@interface ATCountTimeDownManager ()

@property(nonatomic,retain)dispatch_source_t timer;

@end


@implementation ATCountTimeDownManager
#pragma mark获取验证码倒计时

-(void)countDownWithTime:(NSInteger)totalTime completeBlock:(void(^)(NSInteger countDown))completeBlock

{
//    SWWeakSelf(self);
    weakSelf(self);
    if(_timer==nil) {
        
        __block NSInteger timeout = totalTime;
        
        if(timeout !=0) {
            
            dispatch_queue_t queue =dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0);
            
            _timer= dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER,0,0,queue);
            
            dispatch_source_set_timer(_timer,dispatch_walltime(NULL,0),1.0*NSEC_PER_SEC,0);
            
            dispatch_source_set_event_handler(_timer, ^{
                
                if(timeout <=0){
//                    SWStrongSelf(self);
                    dispatch_source_cancel(weakSelf.timer);
                    
                    weakSelf.timer=nil;
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        
                        completeBlock(0);
                        
                    });
                    
                }else{
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        
                        completeBlock(timeout);
                
                    });
                    
                    timeout--;
                    
                }
                
            });

            dispatch_resume(_timer);
        }
    }
}

#pragma mark主动销毁定时器
-(void)destoryTimer{
    if(_timer){
        dispatch_source_cancel(_timer);
        _timer=nil;
    }
}

@end

