//
//  BYBaseViewController.h
//  OwnerLoan
//
//  Created by user on 2018/4/27.
//  Copyright © 2018年 user. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum : NSInteger{
    ViewControllerNavTypeBlack = 0, //黑色nav
    ViewControllerNavTypeWhite,      //白色nav
    
}ViewControllerNavType;
@interface BYBaseViewController : UIViewController

@property (nonatomic,assign)ViewControllerNavType * navtype;
@property (nonatomic,strong)UIButton *leftItemButton;
@property (nonatomic,strong)UIButton *rightItemButton;

@property (nonatomic,strong)UILabel *titleLabel;


- (void)setCustomNavBarWithNavType:(ViewControllerNavType)type withTitle:(NSString *)title;

- (void)setLeftItemWithFrame:(CGRect)frame withImageName:(NSString *)imageName withTitle:(NSString *)title;

- (void)setRightItemWithFrame:(CGRect)frame withImageName:(NSString *)imageName withTitle:(NSString *)title;

- (void)showHUD;
- (void)hideHUD;


@end
