//
//  ViewController.m
//  ConditionSearchDemo
//
//  Created by 1 on 2020/4/14.
//  Copyright © 2020 MM. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "UIView+Extension.h"
#import "KindView.h"
#import "StateView.h"
#import "PriceView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *BackImageView;
@property (nonatomic,strong) UIView *backViewOne;
@property (nonatomic,strong) UIView *backViewTwo;
@property (nonatomic,strong) UIView *backViewThree;
@property (nonatomic,strong) UILabel *titleOne;
@property (nonatomic,strong) UILabel *titleTwo;
@property (nonatomic,strong) UILabel *titleThree;
@property (nonatomic,strong) UIButton *btnOne;
@property (nonatomic,strong) UIButton *btnTwo;
@property (nonatomic,strong) UIButton *btnThree;
@property (nonatomic, strong) KindView *kindView;
@property (nonatomic, strong) StateView *stateView;
@property (nonatomic, strong) PriceView *priceView;
@property (nonatomic, strong) UIView *blackView;
@property (assign, nonatomic) BtnSelected btnSelected;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(balckTapAction1) name:@"kindCellNotification" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(balckTapAction2) name:@"stateCellNotification" object:nil];
       [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(balckTapAction3) name:@"priceCellNotification" object:nil];
    
    //添加背景视图
    CGFloat ViewWide = self.view.frame.size.width/3;
    _backViewOne = [[UIView alloc]initWithFrame:CGRectMake(0, 5, ViewWide, 70)];
    _backViewTwo = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_backViewOne.frame), 5, ViewWide, 70)];
    _backViewThree = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_backViewTwo.frame), 5, ViewWide, 70)];
    _backViewOne.backgroundColor = [UIColor whiteColor];
    _backViewTwo.backgroundColor = [UIColor yellowColor];
    _backViewThree.backgroundColor = [UIColor greenColor];
    
    [_BackImageView addSubview:_backViewOne];
    [_BackImageView addSubview:_backViewTwo];
    [_BackImageView addSubview:_backViewThree];
    
    //设置每个词条
    NSArray *titleArr = @[@"类型",@"状态",@"价格"];
    
    CGFloat titleW = ViewWide-35;
    _titleOne = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, titleW, 70)];
    _titleOne.textAlignment = NSTextAlignmentCenter;
    _titleOne.textColor = [UIColor redColor];
    _titleOne.font = [UIFont systemFontOfSize:15];
    [_backViewOne addSubview:_titleOne];
    
    _titleTwo = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, titleW, 70)];
    _titleTwo.textAlignment = NSTextAlignmentCenter;
    _titleTwo.textColor = [UIColor redColor];
    _titleTwo.font = [UIFont systemFontOfSize:15];
    [_backViewTwo addSubview:_titleTwo];
    
    _titleThree = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, titleW, 70)];
    _titleThree.textAlignment = NSTextAlignmentCenter;
    _titleThree.textColor = [UIColor redColor];
    _titleThree.font = [UIFont systemFontOfSize:15];
    [_backViewThree addSubview:_titleThree];
    
    _titleOne.text = titleArr[0];
    _titleTwo.text = titleArr[1];
    _titleThree.text = titleArr[2];
    
    //添加箭头按钮
    CGFloat btnW = ViewWide - titleW;
    _btnOne = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnOne.frame = CGRectMake(CGRectGetMaxX(_titleOne.frame),0,btnW,70);
    [_btnOne setBackgroundImage:[UIImage imageNamed:@"arr"] forState:UIControlStateNormal];
    [_btnOne setImage:[UIImage imageNamed:@"向上"] forState:UIControlStateSelected];
    [_backViewOne addSubview:_btnOne];
    [_btnOne addTarget:self action:@selector(clickBtnOne:) forControlEvents:UIControlEventTouchUpInside];
    
    _btnTwo = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnTwo.frame = CGRectMake(CGRectGetMaxX(_titleTwo.frame),0,btnW,70);
    [_btnTwo setBackgroundImage:[UIImage imageNamed:@"arr"] forState:UIControlStateNormal];
    [_btnTwo setImage:[UIImage imageNamed:@"向上"] forState:UIControlStateSelected];
    [_backViewTwo addSubview:_btnTwo];
    [_btnTwo addTarget:self action:@selector(clickBtnTwo:) forControlEvents:UIControlEventTouchUpInside];

    
    _btnThree = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnThree.frame = CGRectMake(CGRectGetMaxX(_titleThree.frame),0,btnW,70);
    [_btnThree setBackgroundImage:[UIImage imageNamed:@"arr"] forState:UIControlStateNormal];
    [_btnThree setImage:[UIImage imageNamed:@"向上"] forState:UIControlStateSelected];
    [_backViewThree addSubview:_btnThree];
    [_btnThree addTarget:self action:@selector(clickBtnThree:) forControlEvents:UIControlEventTouchUpInside];
    
    //用透明度法添加视图
    _kindView = [[KindView alloc] init];
    _kindView.frame = CGRectMake(0, CGRectGetMaxY(_BackImageView.frame), self.view.frame.size.width, 300);
          [self.view addSubview:_kindView];
    _kindView.alpha = 0;
    
    _stateView = [[StateView alloc] init];
    _stateView.frame = CGRectMake(0, CGRectGetMaxY(_BackImageView.frame), self.view.frame.size.width, 300);
          [self.view addSubview:_stateView];
    _stateView.alpha = 0;
    
    _priceView = [[PriceView alloc] init];
    _priceView.frame = CGRectMake(0, CGRectGetMaxY(_BackImageView.frame), self.view.frame.size.width, 300);
          [self.view addSubview:_priceView];
    _priceView.alpha = 0;

}

-(void)clickBtnOne:(UIButton *)sender{
    sender.selected = !sender.selected;
    if (_kindView.alpha == 0) {
        _kindView.alpha = 1;
    }else{
        _kindView.alpha = 0;
    }
}

-(void)clickBtnTwo:(UIButton *)sender{
    sender.selected = !sender.selected;
   if (_stateView.alpha == 0) {
       _stateView.alpha = 1;
   }else{
       _stateView.alpha = 0;
   }
}

-(void)clickBtnThree:(UIButton *)sender{
    sender.selected = !sender.selected;
    if (_priceView.alpha == 0) {
        _priceView.alpha = 1;
    }else{
        _priceView.alpha = 0;
    }
}

-(void)balckTapAction1{
    
    NSLog(@" - - - 收到通知去隐藏界面");
    _btnOne.selected = !_btnOne.selected;
    if (_kindView.alpha == 0) {
        _kindView.alpha = 1;
    }else{
        _kindView.alpha = 0;
    }
  
}

-(void)balckTapAction2{
    _btnTwo.selected = !_btnTwo.selected;
    if (_stateView.alpha == 0) {
          _stateView.alpha = 1;
      }else{
          _stateView.alpha = 0;
      }
}

-(void)balckTapAction3{
    _btnThree.selected = !_btnThree.selected;
    if (_priceView.alpha == 0) {
        _priceView.alpha = 1;
    }else{
        _priceView.alpha = 0;
    }
}


@end
