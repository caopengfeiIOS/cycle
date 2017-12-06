//
//  AhResult.h
//  cycleLife
//
//  Created by hbgl on 17/11/29.
//  Copyright © 2017年 cpf. All rights reserved.
//

#import "BaseObject.h"

@interface AhResult : BaseObject
/**状态码*/
@property (copy,nonatomic) NSString *status;
/**message*/
@property (copy,nonatomic) NSString *msg;

@property (strong, nonatomic)  NSString * result;
@end

@interface Bre001Res : AhResult
//**    **//
@property (strong, nonatomic) NSString * loginName;
//**    **//
@property (strong, nonatomic) NSString * userMsg;
//**    **//
@property (strong, nonatomic)  NSString * nickName;

//**    **//
@property (strong, nonatomic)  NSString * sessionid;
//**    **//
@property (strong, nonatomic)  NSString * smallPic;
//**    **//
@property (strong, nonatomic)  NSString * userId;

@end


@interface Bre002Res : AhResult

@property (nonatomic,strong)NSArray *list;

@end

@interface Bre002ResItem : AhResult

// 作者信息
@property (nonatomic, copy) NSNumber *authorId;
@property (nonatomic, copy) NSString *headUrl;
@property (nonatomic, copy) NSString *nickname;
// 当前用户针对作者的信息
@property (nonatomic, copy) NSString *isConcern;
// 当前用户针对文章的信息
@property (nonatomic, copy) NSString *isLike;
@property (nonatomic, copy) NSString *isCollect;
// 文章信息
@property (nonatomic, copy) NSNumber *ID;
@property (nonatomic, copy) NSString *daysinterval;
@property (nonatomic, copy) NSString *dataurl;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSNumber *likecount;
@property (nonatomic, copy) NSString *dataType;
@property (nonatomic, copy) NSNumber *type;
@property (nonatomic, copy) NSArray *likes;
//@property (nonatomic, copy) NSMutableArray *likes;
@property (nonatomic, copy) NSString *videoCutUrl;
@property (nonatomic, copy) NSNumber *commentCount;

// 防止文章被多次点赞或者取消赞
@property (nonatomic, copy) NSString *judgeLike;

// 最新通知
@property (nonatomic, copy) NSNumber *commentId;
@property (nonatomic, copy) NSString *commentNickname;
@property (nonatomic, copy) NSString *commentHeadUrl;
@property (nonatomic, copy) NSNumber *replyOrComment;
@property (nonatomic, copy) NSString *commentContent;
@property (nonatomic, copy) NSString *commentDaysinterval;
@property (nonatomic, copy) NSNumber *commentItemId;


@end

@interface UserInfo : AhResult


+ (instancetype)DefaultUser;
/**是否登录*/
@property (nonatomic,assign)BOOL Login;
/**是否记住密码*/
@property (nonatomic,assign)BOOL IsReme;
//@property (nonatomic,strong)AHTabBarViewController *tabBarVcController;
@property (nonatomic,strong)Bre001Res *usinfo;
/**测试信息*/
@property (nonatomic,copy)NSString *userphone;
@property (nonatomic,copy)NSString *pwd;
/**登录成功后要条状的index*/
@property (nonatomic,assign) NSInteger index;
/**下载的视频model转化成Data的数组-->废弃*/
@property (nonatomic,strong)NSMutableArray *DownVideoDataArr;
/**下载的视频model的数组-->废弃*/
@property (nonatomic,strong)NSMutableArray *DownVideoArr;
/**下载视频保存的数组归档地址*/
@property (copy,nonatomic) NSString *DownVideoFilePath;
/**保存竞技场广告数组*/
@property (nonatomic,strong) NSArray *ArenaAdsArr;

// 下载视频model保存族群
/**视频路径*/
@property (nonatomic,strong)NSMutableArray *Brea_VideoUrl;
/**图片路径*/
@property (nonatomic,strong)NSMutableArray *Brea_PicUrl;
/**标题*/
@property (nonatomic,strong)NSMutableArray *Brea_TitleUrl;
// 下载视频model保存族群  end

@end

