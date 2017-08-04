//
//  RZTouchID.h
//  RZTouchID
//
//  Created by 人众 on 2017/8/4.
//
//

#import <LocalAuthentication/LocalAuthentication.h>

/**
 *  TouchID 状态
 */
typedef NS_ENUM(NSUInteger, RZTouchIDState){
    
    /**
     *  当前设备不支持TouchID
     */
    RZTouchIDStateNotSupport = 0,
    /**
     *  TouchID 验证成功
     */
    RZTouchIDStateSuccess = 1,
    
    /**
     *  TouchID 验证失败    连续三次指纹识别错误
     */
    RZTouchIDStateFail = 2,
    /**
     *  TouchID 被用户手动取消
     */
    RZTouchIDStateUserCancel = 3,
    /**
     *  用户不使用TouchID,选择手动输入密码
     */
    RZTouchIDStateInputPassword = 4,
    /**
     *  TouchID 被系统取消 (如遇到来电,锁屏,按了Home键等)
     */
    RZTouchIDStateSystemCancel = 5,
    /**
     *  TouchID 无法启动,因为用户没有设置密码
     */
    RZTouchIDStatePasswordNotSet = 6,
    /**
     *  TouchID 无法启动,因为用户没有设置TouchID
     */
    RZTouchIDStateTouchIDNotSet = 7,
    /**
     *  TouchID 无效
     */
    RZTouchIDStateTouchIDNotAvailable = 8,
    /**
     *  TouchID 被锁定(连续多次验证TouchID失败,系统需要用户手动输入密码)  Touch ID功能被锁定，下一次需要输入系统密码
     */
    RZTouchIDStateTouchIDLockout = 9,
    /**
     *  当前软件被挂起并取消了授权 (如App进入了后台等)
     */
    RZTouchIDStateAppCancel = 10,
    /**
     *  当前软件被挂起并取消了授权 (LAContext对象无效)
     */
    RZTouchIDStateInvalidContext = 11,
    /**
     *  系统版本不支持TouchID (必须高于iOS 8.0才能使用)
     */
    RZTouchIDStateVersionNotSupport = 12
};



@interface RZTouchID : LAContext

typedef void (^StateBlock)(RZTouchIDState state,NSError *error);


/**
 启动TouchID进行验证
 
 @param desc Touch显示的描述
 @param block 回调状态的block
 */

-(void)RZ_showTouchIDWithDescribe:(NSString *)desc BlockState:(StateBlock)block;

@end
