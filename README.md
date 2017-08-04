# RZTouchID
RZTouchID指纹密码验证

#usage</br>
#把RZTouchID文件夹导入项目中</br>
#添加RZTouchID.h</br>
#示例代码:
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
