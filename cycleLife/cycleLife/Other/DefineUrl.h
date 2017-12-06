//
//  DefineUrl.h
//  cycleLife
//
//  Created by hbgl on 17/11/29.
//  Copyright © 2017年 cpf. All rights reserved.
//

#ifndef DefineUrl_h
#define DefineUrl_h
#define C_BASE_URL @"http://mobile.72bike.com/open/"  // 基网址
//#define C_BASE_URL @"http://192.168.9.164:8080/72bike/open/"  // 本地基网址

#define C_SIGN_URL C_BASE_URL"user/login.htm"//登陆
#define C_REGISTER_URL C_BASE_URL"user/save_register.htm"//注册
#define C_CHECKNICKNAME_URL C_BASE_URL"user/chk_nick_name.htm"//检查昵称
#define C_CHANGENICKNAME_URL C_BASE_URL"user/upd_nick_name.htm"//修改昵称
#define C_CHECKLOGINNAME_URL C_BASE_URL"user/chk_login_name.htm"//检查登陆名
#define C_GETUSERINFO_URL C_BASE_URL"user/get_user_info.htm"//获取用户信息
#define C_UPLOADUSERPIC_URL C_BASE_URL"user/upload_user_pic.htm"//上传用户头像
#define C_USER_REQUEST_TRADESALE C_BASE_URL"product/dir_my_pro.htm"//获取我发布商品信息
#define C_USER_REQUEST_TRADECOLLECT C_BASE_URL"product/dir_my_coll_pro.htm"//获取我收藏的商品信息
#define C_USER_REQUEST_TRADESEE C_BASE_URL"product/dir_my_browse_pro.htm"//获取我浏览的商品信息
#define C_USER_TUICHUDENGLU C_BASE_URL"user/logout.htm"//退出登录
#define C_USER_SENDMESSAGE C_BASE_URL"common/send_sms_vcode.htm"//发送手机验证码
#define C_USER_CHONGZHIMIMA C_BASE_URL"user/reset_pwd.htm"//重置密码
#define C_USER_CHANGEMIMA C_BASE_URL"user/upd_pwd.htm"//修改密码
#define C_USER_GETPROVINCE C_BASE_URL"common/dir_province_city.htm"//获得省市列表

#define C_SAVEINFO C_BASE_URL"user/upd_user_info.htm"//修改用户资料
#define C_SAVEHOBITS C_BASE_URL"user/upd_user_interest.htm"//修改爱好


#define C_SAVSSUGGEST C_BASE_URL"feedback/save_feed_back.htm"//保存意见反馈
#define C_CATEGORY C_BASE_URL"product/dir_pro_category.htm"//获取商品分类
#define C_SHARELOCATION C_BASE_URL"user/upd_is_show_location.htm"//是否打开位置共享

#define C_TWOPRICE C_BASE_URL"common/dir_category.htm"//获取价格 品牌分类

#define C_ZAN C_BASE_URL"common/save_vote.htm"//保存点赞
#define C_IFSHOUCANG C_BASE_URL"common/chk_collection.htm"//是否收藏
#define C_SHOUCANG C_BASE_URL"common/save_collection.htm"//收藏
#define C_SHOUCANGDELETE C_BASE_URL"common/del_collection.htm"//删除收藏

#define C_FUJINYONGHU C_BASE_URL"user/upd_position.htm"//获取附近的用户

#define C_PINGLUNLIEBIAO C_BASE_URL"common/dir_comment.htm"//获取评论列表
#define C_PINGLUNBAOCUN C_BASE_URL"common/save_comment.htm"//保存评论
#define C_DELETE_PINGLUN C_BASE_URL"common/del_comment.htm"//删除
#define C_XIAOXI_LIAOTIANJIEMIAN C_BASE_URL"user/upd_letter_notice.htm"//用户时候在消息列表页面


#define C_SIXIN_FASONG C_BASE_URL"letter/save_letter.htm"//发送私信
#define C_SIXIN_HUOQU C_BASE_URL"letter/dir_each_letter.htm"//获取私信列表


#define C_FOUR_FENLEICHAXUN C_BASE_URL"product/dir_query_pro.htm"//分类查询商品列表
#define C_FOUR_FINDTRSDE C_BASE_URL"product/dir_near_pro.htm"//获取我附近的商品
#define C_FOUR_GETINFO C_BASE_URL"product/get_pro.htm"//获取商品信息
#define C_FOUR_GETPHOTOS C_BASE_URL"product/dir_pro_pic.htm"//获取商品图片
#define C_FOUR_LEIXINGCHAXUN C_BASE_URL"product/dir_type_pro.htm"//类型条件查询商品
#define C_FOUR_ALLFENLEI C_BASE_URL"product/dir_pro_category.htm"//获取所有分类
#define C_FENLEI C_BASE_URL"product/dir_all_product_type.htm"//获取所有类型
#define C_FOUR_ALLFENLEIALL C_BASE_URL"product/dir_all_pro_category.htm"//所有商品类型列表
#define C_BRAND C_BASE_URL"product/dir_all_brand.htm"//获取所有品牌
#define C_FOUR_XIANGGUANCHANPIN C_BASE_URL"product/dir_related_pro.htm"//获取相关产品列表
#define C_FOUR_UPLOADTRADEPIC C_BASE_URL"product/upload_pro_pic.htm"//上传商品图片
#define C_FOUR_SAVETRADEINFO C_BASE_URL"product/save_product.htm"//保存商品信息


#define C_FOUR_CHANGESALED C_BASE_URL"product/upd_sold_num.htm"//修改商品已售数量
#define C_FOUR_SHANCHUSHANGPIN C_BASE_URL"product/del_pro.htm"//删除商品
#define C_FOUR_XIAJIA C_BASE_URL"product/upd_sale_status.htm"//下架
#define C_FOUR_SHUAXINTRADE C_BASE_URL"product/refresh_pro_pub_time.htm"//刷新上架时间
#define C_FOUR_SHANCHULIULAN C_BASE_URL"product/del_browse_pro.htm"//删除我浏览的商品
#define C_THREE_DELETEYONGHU C_BASE_URL"letter/del_letter_user.htm"//删除会话用户
#define C_THREE_BIAOJIYIDU C_BASE_URL"letter/upd_letter_read_status.htm"//标记已读
#define C_THREE_WODEHUIHUALIEBIAO C_BASE_URL"letter/dir_letter_user.htm"//我的会话用户列表


#define C_FOUR_GERENLEICHANPIN C_BASE_URL"product/dir_category_pro.htm"//首页获取各分类产品列表

#define C_REVIEW C_BASE_URL@"common/review_status.htm"  // 万能接口(二手屏蔽)


#define C_SIX_TONGZHILIEBIAO C_BASE_URL"notice/dir_notice_list.htm"//我的通知列表
#define C_SIX_DELETETONGZHI C_BASE_URL"notice/del_notice_all.htm"//删除通知
#define C_SIX_YIDU C_BASE_URL"notice/upd_notice_read_flag.htm"//设通知已读


#define C_Riding C_BASE_URL"dir_riding.htm"  // 完成骑行提交
#define C_RIDINGHISTORY C_BASE_URL"riding/dir_my_riding.htm"  // 骑行记录
#define C_RIDINGSAVE C_BASE_URL"riding/save_riding.htm"  // 保存骑行记录


#define C_VIDEOLIST C_BASE_URL"video/dir_video_list.htm"  // 视频列表


#define C_CelebrityRecommendList C_BASE_URL"famousperson/recommend_article.action"  // 名人堂推荐列表
#define C_CelebrityList C_BASE_URL"famousperson/dir_celebrity_article.action"  // 名人堂列表
#define C_CelebritySelected C_BASE_URL"famousperson/choice_type.action"  // 名人堂精选
#define C_CelebritySelectedDetails C_BASE_URL"famousperson/choice_detail.action"  // 名人堂精选详情
#define C_Celebrity C_BASE_URL"famousperson/famous_person.action"  // 全部名人列表
#define C_CelebrityLabel C_BASE_URL"dict/dict.action"  // 名人堂标签
#define C_CelebritySearch C_BASE_URL"famousperson/article_search.action"  // 名人堂搜索
#define C_CelebrityFollow C_BASE_URL"famousperson/attention.action"  // 名人堂关注or取消关注
#define C_CelebrityWeeklyList C_BASE_URL"famousperson/weekly_list.action"  // 名人堂周刊列表


#define C_MineAttention C_BASE_URL"famousperson/my_attention.action"  // 我的关注
#define C_MineAttentionDetail C_BASE_URL"famousperson/my_attention_detail.action"  // 我的关注详情


#define C_Comment C_BASE_URL"famousperson/get_comment.action"  // 获取评论
#define C_CommentRelease C_BASE_URL"famousperson/comment_one.action"  // 发布一级评论
#define C_CommentReleaseSecond C_BASE_URL"famousperson/comment_two.action"  // 发布二级评论

//#define C_MessageUnread C_BASE_URL"famousperson/message_record.action"  // 未读消息记录
#define C_MessageRead C_BASE_URL"famousperson/old_message_record.action"  // 已读消息记录



#pragma mark === 最新接口！！！

#pragma mark === 极光推送
#define C_JiguangSave C_BASE_URL"jiguang/save_jiguang.htm"
#define C_JiguangGet C_BASE_URL"jiguang/get_jiguang.htm"


#pragma mark === 精选
// 精选第一页数据
#define C_Selected C_BASE_URL"indeximgsandbannerandlabelorder/index_imgs_list_and_banner_and_label_order.htm"
// Banner图list
#define C_SelectedBanner C_BASE_URL"banner/dir_banner.htm"
// 骑游路线list
#define C_SelectedRoute C_BASE_URL"rideroute/ride_route_list.htm"
// 玩车场地list
#define C_SelectedPlace C_BASE_URL"bikesite/bike_site_list.htm"
// 活动list
#define C_SelectedActivity C_BASE_URL"activity/activity_list.htm"
// 装备list
#define C_SelectedEquip C_BASE_URL"bikeequip/equip_list.htm"
// 车辆list
#define C_SelectedBike C_BASE_URL"bikeequip/bike_list.htm"
// 玩车list
#define C_SelectedPlayBike C_BASE_URL"bikeenjoy/bike_enjoy_list.htm"
// 美女图片list
#define C_SelectedBeautyImage C_BASE_URL"beauty/beauty_list.htm"
// 找车list
#define C_SelectedChooseBike C_BASE_URL"bikeequip/bike_list.htm"
// 测评list
#define C_SelectedAssess C_BASE_URL"reviewstore/review_list.htm"
// 门店list
#define C_SelectedShop C_BASE_URL"reviewstore/store_list.htm"
// 精选小标签
#define C_SelectedSmallLabel C_BASE_URL"choicesmalllabel/choice_small_label_list.htm"


#pragma mark === 广场
// 广场标签
#define C_SquareLabel C_BASE_URL"dict/dict.htm"
// 广场列表
#define  C_SquareList C_BASE_URL"videoarticle/video_article_list.htm"
// 点赞 收藏
#define  C_SquareLike C_BASE_URL"videoarticlelike/video_article_like.htm"
// 取消赞 取消收藏
#define  C_SquareDislike C_BASE_URL"videoarticlelike/video_article_dislike.htm"
// 评论list
#define  C_SquareComment C_BASE_URL"comment/get_comment.htm"
// 一级评论
#define  C_SquareCommentFirst C_BASE_URL"comment/comment_one.htm"
// 二级评论
#define  C_SquareCommentSecond C_BASE_URL"comment/comment_two.htm"
// 相关推荐
#define  C_SquareRecommend C_BASE_URL"videoarticle/recommend_video_article_list.htm"
// 删除自己发布的文章
#define  C_SquareDeleteArticle C_BASE_URL"videoarticle/del_video_article.htm"


#pragma mark === 搜索
// 搜索结果
#define C_SearchResult C_BASE_URL"search/search.htm"
// 推荐用户
#define C_SearchRecommendUser C_BASE_URL"user/dir_recommend.htm"


#pragma mark === 发布
// 发布图片
#define C_ReleaseImage C_BASE_URL"videoarticle/release_img_article.htm"
// 发布视频
#define C_ReleaseVideo C_BASE_URL"videoarticle/release_video_article.htm"






#pragma mark === 消息
// 最新通知
#define C_MessageNewest C_BASE_URL"user/my_notice_list.htm"
// 官方消息列表
#define C_MessageOfficial C_BASE_URL"officialmessage/official_message_list.htm"
// 未读消息数目
#define C_MessageUnread C_BASE_URL"noreadcount/no_read_count.htm"


#pragma mark === 我的
// 修改头像
#define C_MineChangeHead C_BASE_URL"user/upload_user_pic.htm"
// 修改昵称
#define C_MineChangeNickname C_BASE_URL"user/upd_nick_name.htm"
// 我的发布
#define C_MineRelease C_BASE_URL"user/my_release_list.htm"
// 我的收藏
#define C_MineCollection C_BASE_URL"user/my_collection_list.htm"
// 我的关注
#define C_MineFollow C_BASE_URL"user/my_concern_list.htm"
// 我的粉丝
#define C_MineFans C_BASE_URL"user/my_fans_list.htm"
// 报名的活动
#define C_MineActivity C_BASE_URL"user/my_activity_list.htm"
// 关注用户
#define C_MineFollowUser C_BASE_URL"user/save_my_concern.htm"
// 取消关注用户
#define C_MineFollowCancelUser C_BASE_URL"user/del_my_concern.htm"
// 提交意见反馈
#define C_MineFeedback C_BASE_URL"feedback/save_feed_back.htm"


#pragma mark === 第三方登录
// 微信通过code获取access_token
#define C_WeChatOne @"http://api.weixin.qq.com/sns/oauth2/access_token"
// QQ获取用户资料
#define C_QQUserInfo @"https://graph.qq.com/user/get_user_info"


#endif /* DefineUrl_h */
