//
//  AHData.h
//  BannNewVersion
//
//  Created by ah on 16/3/25.
//  Copyright © 2016年 ah. All rights reserved.
//

//  数据类

/**数据网络*/
static NSString *const BreachNet_WWAN = @"Reachable via WWAN";
/**wifi*/
static NSString *const BreachNet_WIFI = @"Reachable via WiFi";
/**无网络*/
static NSString *const BreachNet_DisAble = @"Not Reachable";


// 视频下载文件夹
static NSString *const Breach_DownPathName = @"BreachDownVideoList";


//  通知类
static NSString *const jj= @"hahha";
/**3dTouch-->2*/
static NSString *const BreachNoty_cutItem2 = @"cutItem2";
static NSString *const Breach_Game = @"gamehg";
static NSString *const Breach_Gamelist = @"gamehglist";

//  NSUserDefaults类
static NSString *const Breach_userphone= @"Breach_userphone";
static NSString *const Breach_pwd = @"Breach_pwd";
static NSString *const Breach_userInfo = @"Breach_userInfo";
/**是否记住密码*/
static NSString *const Breach_isreme = @"Breach_isreme";
/**头像*/
static NSString *const Breach_HeadImg = @"Breach_HeadImg";
// 视频下载保存信息族群
/**视频路径*/
static NSString *const Bre_VideoUrl= @"Bre_VideoUrl";
/**图片路今后*/
static NSString *const Bre_PicUrl= @"Bre_PicUrl";
/**视频标题*/
static NSString *const Bre_Title= @"Bre_Title";

// 信息修改页

/**身高*/
static NSString *const Bre_Height = @"身高";
/**体重*/
static NSString *const Bre_Weight = @"体重";
/**年龄*/
static NSString *const Bre_Age = @"年龄";
/**联系电话*/
static NSString *const Bre_TelNum = @"联系电话";




//  颜色

/**主色调(导航栏 按钮)*/
#define K_AppColor  AHColor(144, 119, 166)
/**tabBar背景色*/
#define K_TabBarColor  AHColor(31, 32, 33)
/**线条颜色*/
#define K_LineColor  AHColor(220, 220, 220)
/**界面背景色*/
#define K_BackColor  AHColor(237, 238, 239)
/**红色*/
#define K_RedColor  AHColor(227, 63, 62)
/**字体主色*/
#define K_titleColor  AHColor(66, 66, 66)
/**背景图持久化*/
#define K_BackImg  [NSString stringWithFormat:@"%@image",[UserInfo DefaultUser].userphone]
/**是否自动登录*/
#define K_IsLoginAuto YES


typedef enum {  //  列表类型
    
    /**约球列表*/
    BallTypeList,
    /**我的约球*/
    BallTypeMY
    
}BallType;


//typedef enum {  //  产品类型
//    /** 默认产品  */
//    FundDefault                     =0,
//    /**中加*/
//    FundMidAdd                      =1 << 0,
//    /**彩虹*/
//    FundRainbow                     =1 << 1,
//    /**南方理财60天E*/
//    FundsouthFinanceSixtyDaysE      =1 << 2,
//    /**票据*/
//    FundPaper                       =1 << 3,
//    /**步步增利*/
//    FundStep                        =1 << 4,
//    /** 南方现金通E*/
//    FundSouthernCashFluxE           =1 << 5,
//    /**富盈*/
//    FundRichSurplus                 =1 << 6,
//    /**富盈5号*/
//    FundRichSurplusFive             =1 << 7
//    
//}FundType;




