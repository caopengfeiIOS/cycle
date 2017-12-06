//
//  NetManager.h
//  cycleLife
//
//  Created by hbgl on 17/11/29.
//  Copyright © 2017年 cpf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AhResult.h"
#import "AhRequest.h"
typedef enum {  // 网络状态
    
    /**不可用*/
    NetTypeDisAble,
    /**未知*/
    NetTypeUnknown,
    /**wifi*/
    NetTypeWifi,
    /**数据流量*/
    NetTypeTraffic
    
}NetType;

typedef NSURLSessionTask AhSessionTask;

@interface NetManager : NSObject
/**
 *  网络连接状态-->当前的网络状态
 *
 */
+ (NSString*)CurrentNetstatus;
/**
 *  设置公共请求头
 *  @author Ah, 16-04-15 11:04:33
 */
+ (void)setCommonHeader:(NSDictionary*)headers;
/**
 *  @author Ah, 16-04-15 12:04:51
 *
 *  设置最大并发数,设置过大容易出错 最大设置到9
 */
+ (void)setMaxConcurrentOperationCount:(NSInteger)maxCount;
/**
 *  设置是否打印调测信息  默认为YES
 */
+ (void)setDebug:(BOOL)debug;
/**
 *  @author Ah, 16-04-15 11:04:22
 *
 *  get的异步请求
 */
+ (AhSessionTask*)GET:(NSString *)URLString
           parameters:(AhRequest*)Request
             progress:(void (^)(int64_t bytesRead,
                                int64_t totalBytesRead))Progress
              success:(void (^)(id responseObject))success
              failure:(void (^)(NSError *error))failure;

/**post的异步请求*/
+(AhSessionTask*)POST:(NSString *)URLString
           parameters:(AhRequest*)Request
             progress:(void (^)(int64_t bytesRead,
                                int64_t totalBytesRead))Progress
              success:(void (^)(id responseObject))success
              failure:(void (^)(NSError *error))failure ;
/**上传图片*/
+ (AhSessionTask*)POST:(NSString *)URLString
            parameters:(AhRequest*)Request
                 image:(UIImage *)image
              progress:(void (^)(int64_t bytesRead,
                                 int64_t totalBytesRead))Progress
               success:(void (^)(id responseObject))success
               failure:(void (^)(NSError *error))failure ;
/**
 *  下载文件
 *
 *  @param URLString  下载路径
 *  @param SaveToPath 保存路径
 *  @param Progress   进度描述
 *  @param success    成功句柄
 *  @param failure    失败句柄
 */
+ (AhSessionTask *)downloadWithUrl:(NSString *)URLString
                        saveToPath:(NSString *)SaveToPath
                          fileName:(NSString *)aFileName
                          progress:(void (^)(int64_t bytesRead,
                                             int64_t totalBytesRead))Progress
                           success:(void (^)(id responseObject))success
                           failure:(void (^)(NSError *error))failure;

/**
 *  取消全部请求
 */
+ (void)cancelAllRequest;
/**
 *  取消特定请求
 *
 *  @param url url路径
 */
+ (void)cancelRequestWithURL:(NSString *)url ;


@end
