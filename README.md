# CountTimeDemo
倒计时特效,从小到大~
##前言

> 写一个跑步的app,跑之前倒计时开始,于是写一个特效,直接上代码吧~简单粗暴

  ```

#import "ViewController.h"
#import "SWKit.h"
#import "ATCountTimeDownManager.h"


@interface ViewController ()
@property(nonatomic,strong) UILabel *countDown;
@property(nonatomic,strong) UIView *aphView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [SWKit colorWithHexString:@"#0074DA"];
    
    [self secountDown];
    
    [self beginStar];
  
}
-(void)secountDown{
    _countDown =[[UILabel alloc]init];
    _countDown.textColor = [UIColor whiteColor];;
    _countDown.font =[UIFont boldSystemFontOfSize:100];
    _countDown.textAlignment = 1;
    [self.view addSubview:_countDown];
    _countDown.x = (SCREEN_WIDTH - 100)/2;
    _countDown.y = (SCREEN_HEIGHT - 100)/2;
    _countDown.width =_countDown.height = 100;
   
    _aphView = [UIView new];
    _aphView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_aphView];
    _aphView.frame = CGRectMake(0, 0, 100, 100);
    _aphView.centerX = _countDown.centerX;
    _aphView.centerY = _countDown.centerY;
    _aphView.alpha = 0;
    
    _aphView.layer.cornerRadius = 50.f;
    
}

- (void)getCuntDown:(NSInteger)second{
    weakSelf(self);
    if (second == 4) {
        second = 3;
    }
    _countDown.text=[NSString stringWithFormat:@"%ld",(long)second];
    _countDown.alpha = 1;
    _aphView.alpha = 0;
    [UIView animateWithDuration:0.8 animations:^{
        weakSelf.countDown.alpha = 0.8;//透明度
        weakSelf.aphView.alpha = 0.1;
        weakSelf.countDown.transform = CGAffineTransformMakeScale(1.5, 1.5);//放大值
         weakSelf.aphView.transform = CGAffineTransformMakeScale(10, 10);//放大值
    } completion:^(BOOL finished) {
        weakSelf.aphView.alpha = weakSelf.countDown.alpha =  0;
        weakSelf.countDown.transform = weakSelf.aphView.transform = CGAffineTransformIdentity;//回复原大小
    }];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self beginStar];
}


- (void)beginStar{
    ATCountTimeDownManager *manager= [ATCountTimeDownManager new];
    [manager countDownWithTime:4 completeBlock:^(NSInteger countDown) {
        if (countDown == 0) {
            [manager destoryTimer];
        } else {
            [self getCuntDown:countDown];
        }
    }];
}

```

> SWKit  以及  ATCountTimeDownManager 我会上传代码到git,逻辑很简单,一看就懂哈! 这个是效果图,有需求可star 支持一下~✨
