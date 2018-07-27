//
//  BYBaseViewController.m
//  OwnerLoan
//
//  Created by user on 2018/4/27.
//  Copyright © 2018年 user. All rights reserved.
//

#import "BYBaseViewController.h"
#import <MBProgressHUD.h>
@interface BYBaseViewController (){
    MBProgressHUD *_hud;
}
@property (nonatomic,strong)UIView *navBarView;
@end

@implementation BYBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = BACKGROUND_COLOR;
    
//    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
    
    
    
}



- (void)setCustomNavBarWithNavType:(ViewControllerNavType)type withTitle:(NSString *)title{
    UIView *navBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WDITH, TOP_CONST_HEIGHT)];
    self.navBarView = navBar;
    navBar.backgroundColor = type==ViewControllerNavTypeBlack ? UIColorFromRGB(0x4A4C5B): UIColorFromRGB(0xffffff);
    [self.view addSubview:navBar];
    
    UILabel *titleLabel = [UILabel labelWithTextColor:type==ViewControllerNavTypeBlack ? UIColorFromRGB(0xffffff): UIColorFromRGB(0x000033) font:DiyFont(19) textAlignment:NSTextAlignmentCenter text:title];
    self.titleLabel = titleLabel;
    titleLabel.bottom = navBar.height - 15;
    titleLabel.center = CGPointMake(navBar.width/2, titleLabel.center.y);
    [navBar addSubview:titleLabel];
    [navBar addSubview:titleLabel];
    
    if (type==ViewControllerNavTypeWhite) {
        UIView *lineView = [UIView lineViewWith:SCREEN_WDITH isVertical:NO withColor:UIColorFromRGB(0xD5D5D5)];
        lineView.height = 1/[[UIScreen mainScreen] scale];
        lineView.bottom = navBar.height;
        [navBar addSubview:lineView];
        [self setLeftItemWithFrame:CGRectMake(0, 0, 50, 40) withImageName:@"back_arrow_gray" withTitle:@""];
    }else{
        [self setLeftItemWithFrame:CGRectMake(0, 0, 50, 40) withImageName:@"back_arrow_white" withTitle:@""];
    }
}


- (void)setLeftItemWithFrame:(CGRect)frame withImageName:(NSString *)imageName withTitle:(NSString *)title{
    UIButton *leftItemButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _leftItemButton = leftItemButton;
    leftItemButton.frame = frame;
    [leftItemButton setTitleColor:UIColorWithRGB(51, 51, 51) forState:UIControlStateNormal];
    leftItemButton.titleLabel.font = [UIFont systemFontOfSize:14];
    
    if (imageName.length!=0 && title.length != 0) {
        [leftItemButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [leftItemButton setTitle:title forState:UIControlStateNormal];
    }else if (imageName.length!=0 && title.length == 0) {
        [leftItemButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }else if(imageName.length==0&&title.length!=0){
        [leftItemButton setTitle:title forState:UIControlStateNormal];
    }
    
    [leftItemButton addTarget:self action:@selector(leftItemButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    leftItemButton.bottom = self.navBarView.height;
    [self.navBarView addSubview:leftItemButton];
    
    
    
}
- (void)leftItemButtonAction{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setRightItemWithFrame:(CGRect)frame withImageName:(NSString *)imageName withTitle:(NSString *)title{
    
    UIButton *rightItemButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _rightItemButton = rightItemButton;
    rightItemButton.frame = frame;
    [rightItemButton setTitleColor:UIColorWithRGB(51, 51, 51) forState:UIControlStateNormal];
    rightItemButton.titleLabel.font = [UIFont systemFontOfSize:14];
    if (imageName.length!=0 && title.length != 0) {
        [rightItemButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [rightItemButton setTitle:title forState:UIControlStateNormal];
    }else if (imageName.length!=0 && title.length == 0) {
        [rightItemButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }else{
        [rightItemButton setTitle:title forState:UIControlStateNormal];
    }
    [rightItemButton addTarget:self action:@selector(rightItemButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    rightItemButton.bottom = self.navBarView.height;
    rightItemButton.right = self.navBarView.width;
    [self.navBarView addSubview:rightItemButton];
    
    
}
- (void)rightItemButtonAction{
    NSLog(@"right");
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
//    if (self.navigationController.viewControllers.count==1) {
//        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
//    }else{
//        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
//    }
}



- (void)showHUD{
    if (!_hud) {
        
        _hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        
        _hud.bezelView.color = UIColorFromRGB(0x000000);
        _hud.label.text = @"加载中...";
        _hud.label.textColor = [UIColor whiteColor];
        
    }
    [_hud showAnimated:YES];
}
- (void)hideHUD{
    [_hud hideAnimated:YES];
    _hud = nil;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{
    TLog(@"%@__dealloc",NSStringFromClass([self class]));
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
