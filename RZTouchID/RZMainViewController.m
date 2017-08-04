//
//  RZMainViewController.m
//  RZTouchID
//
//  Created by 人众 on 2017/8/4.
//
//

#import "RZMainViewController.h"
#import "RZTouchID.h"
#import "RZHomeViewController.h"
@interface RZMainViewController ()

@end

@implementation RZMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"验证指纹";
    
    UIButton *touchIDButton = [[UIButton alloc] init];
    [touchIDButton setBackgroundImage:[UIImage imageNamed:@"touchID"] forState:UIControlStateNormal];
    [touchIDButton addTarget:self action:@selector(touchVerification) forControlEvents:UIControlEventTouchDown];
    touchIDButton.frame = CGRectMake((self.view.frame.size.width / 2) - 30, (self.view.frame.size.height / 2) - 30, 60, 60);
    [self.view addSubview:touchIDButton];
    
    [self touchVerification];
}
/**
 验证 TouchID
 */
- (void)touchVerification {
    
    RZTouchID *touchID = [[RZTouchID alloc] init];
    
    [touchID RZ_showTouchIDWithDescribe:nil BlockState:^(RZTouchIDState state, NSError *error) {
        
        if (state == RZTouchIDStateNotSupport) {    //不支持TouchID
            
            UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"当前设备不支持TouchID" message:@"请输入密码" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
            alertview.alertViewStyle = UIAlertViewStyleSecureTextInput;
            [alertview show];
            
            
        } else if (state == RZTouchIDStateSuccess) {    //TouchID验证成功
            
            NSLog(@"jump");
            RZHomeViewController *homeVc = [[RZHomeViewController alloc] init];
            [self.navigationController pushViewController:homeVc animated:YES];
            
        } else if (state == RZTouchIDStateInputPassword) { //用户选择手动输入密码
            
            UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:nil message:@"请输入密码" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
            alertview.alertViewStyle = UIAlertViewStyleSecureTextInput;
            [alertview show];
            
        }
        
        // ps:以上的状态处理并没有写完全!
        // 在使用中你需要根据回调的状态进行处理,需要处理什么就处理什么
        
        
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
