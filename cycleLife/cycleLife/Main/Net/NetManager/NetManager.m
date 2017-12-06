//
//  NetManager.m
//  cycleLife
//
//  Created by hbgl on 17/11/29.
//  Copyright © 2017年 cpf. All rights reserved.
//
// 项目打包上线都不会打印日志，因此可放心。
#ifdef DEBUG
#define BreachLog(s, ... ) NSLog( @"[%@ in line %d] ===============>%@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )
#else
#define HYBAppLog(s, ... )
#endif

#import "NetManager.h"
#import <AFHTTPSessionManager.h>
#import <AFNetworkActivityIndicatorManager.h>
/**
 *  公共请求头
 */
static NSDictionary *Ah_httpHeaders = nil;
/**是否打开调试开关*/
static BOOL Debug = YES;
/**接受宿友SessionTask的数组*/
static NSMutableArray *TaskArr;
@implementation NetManager
/**网络连接状态-->实时监控网络状态的变化*/
+ (void)reach{
    
    
    /**
     AFNetworkReachabilityStatusUnknown          = -1,
     AFNetworkReachabilityStatusNotReachable     = 0,
     AFNetworkReachabilityStatusReachableViaWWAN = 1,
     AFNetworkReachabilityStatusReachableViaWiFi = 2,
     */
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    // 检测网络连接的单例,网络变化时的回调方法
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        MYLog(@"%ld", (long)status);
    }];
}

/**网络连接状态-->当前的网络状态*/
+ (NSString*)CurrentNetstatus{
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    return [[AFNetworkReachabilityManager sharedManager] localizedNetworkReachabilityStatusString];
}
/**设置公共请求头*/
+ (void)setCommonHeader:(NSDictionary *)headers{
    
    Ah_httpHeaders = headers;
}
/**设置最大并发数*/
+ (void)setMaxConcurrentOperationCount:(NSInteger)maxCount{
    
    if (maxCount>9) {
        maxCount=3;
    }
    [self defautManager].operationQueue.maxConcurrentOperationCount = maxCount;
}
/**设置是否打印调试信息*/
+ (void)setDebug:(BOOL)debug{
    
    Debug = debug;
}
#pragma mark- get
/**GEt*/
+ (AhSessionTask*)GET:(NSString *)URLString
           parameters:(AhRequest*)Request
             progress:(void (^)(int64_t bytesRead,
                                int64_t totalBytesRead))Progress
              success:(void (^)(id responseObject))success
              failure:(void (^)(NSError *error))failure{
    
    AFHTTPSessionManager *mgr = [self defautManager];
    URLString = [self MakeFullUrl:URLString];
    NSDictionary *parameters = Request.mj_keyValues;
    if (Debug) {  //  打开打印
        MJExtensionLog(@" 🈹🈹🈹  🈹🈹🈹  🈹🈹🈹  🈹🈹🈹  🈹🈹🈹 \n 请求模型:%@\n 参数为:\n %@ \n",[NSString stringWithUTF8String:class_getName(Request.class)],parameters);
    }
    AhSessionTask *task =  [mgr GET:URLString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
        if (Progress) {
            
            Progress(downloadProgress.completedUnitCount,downloadProgress.totalUnitCount);
        }
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
            NSString *resultClassName = [self resultFromRequest:Request];
            Class aclass = NSClassFromString(resultClassName);
            AhResult *result = [aclass mj_objectWithKeyValues:dict];
            if (Debug) {  //  打开打印
                MJExtensionLog(@" 🈹🈹🈹  🈹🈹🈹  🈹🈹🈹  🈹🈹🈹  🈹🈹🈹 \n 接受模型:%@\n 接受数据为:\n %@ \n",resultClassName,result);
            }
            success(result);
        }
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            if (Debug) {  //  打开打印
                MJExtensionLog(@"否❌否❌否❌否❌否❌否❌否❌否❌否❌ \n 数据请求失败 \n: 请求雷明:%@\n 接受数据为:\n %@ \n",[NSString stringWithUTF8String:class_getName(Request.class)],error);
            }
            failure(error);
        }
        [error localizedDescription];
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    }];
    if (task) {
        [[self allTasks]addObject:task];
    }
    return task;
}
#pragma mark- post
+(AhSessionTask*)POST:(NSString *)URLString
           parameters:(AhRequest*)Request
             progress:(void (^)(int64_t bytesRead,
                                int64_t totalBytesRead))Progress
              success:(void (^)(id responseObject))success
              failure:(void (^)(NSError *error))failure {
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    MYLog(@"==%@",NSStringFromClass([Request class]));
    NSDictionary *parameters = Request.mj_keyValues;
    MYLog(@"==%@",parameters);
    AFHTTPSessionManager *mgr = [self defautManager];
    URLString = [self MakeFullUrl:URLString];
    
    if (Debug) {  //  打开打印
        MJExtensionLog(@" 🈹🈹🈹  🈹🈹🈹  🈹🈹🈹  🈹🈹🈹  🈹🈹🈹 \n 请求模型:%@\n 请求地址:%@ 参数为:\n %@ \n",[NSString stringWithUTF8String:class_getName(Request.class)],URLString,parameters);
    }
    
    [self showWaitView:YES];
    AhSessionTask *task =  [mgr POST:URLString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
        if (Progress) {
            Progress(uploadProgress.completedUnitCount,uploadProgress.totalUnitCount);
        }
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [self showWaitView:NO];
        if (success) {
            
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
            NSString *resultClassName = [self resultFromRequest:Request];
            Class aclass = NSClassFromString(resultClassName);
            
            AhResult *result = [aclass mj_objectWithKeyValues:dict];
            
            if (Debug) {  //  打开打印
                MJExtensionLog(@" 🈹🈹🈹  🈹🈹🈹  🈹🈹🈹  🈹🈹🈹  🈹🈹🈹 \n 接受模型:%@\n状态码:%@\n状态msg:%@\n 接受数据为:\n %@ \n",resultClassName,dict[@"status"],dict[@"msg"],dict);
            }
            
                          success(result);
            
            
        }
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self showWaitView:NO];
        [self showMessage:@"数据请求失败,请稍后再试"];
        if (Debug) {  //  打开打印
            MJExtensionLog(@"否❌否❌否❌否❌否❌否❌否❌否❌否❌ \n 数据请求失败 \n: 请求模型:%@\n 接受数据为:\n\n\n error: %@ \n\n\n",[NSString stringWithUTF8String:class_getName(Request.class)],error);
        }
        
        if (failure) {
            
            failure(error);
        }
        [error localizedDescription];
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    }];
    if (task) {
        [[self allTasks]addObject:task];
    }
    return task;
}
#pragma mark- 上传图片
/**上传图片*/
+ (AhSessionTask*)POST:(NSString *)URLString
            parameters:(AhRequest*)Request
                 image:(UIImage *)image
              progress:(void (^)(int64_t bytesRead,
                                 int64_t totalBytesRead))Progress
               success:(void (^)(id responseObject))success
               failure:(void (^)(NSError *error))failure{
    
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    MYLog(@"==%@",NSStringFromClass([Request class]));
    
    AFHTTPSessionManager *mgr = [self defautManager];
    
//    URLString = [NSString stringWithFormat:@"%@%@",HOST,URLString];;
    
    NSDictionary *parameters = Request.mj_keyValues;
    if (Debug) {  //  打开打印
        MJExtensionLog(@" 🈹🈹🈹  🈹🈹🈹  🈹🈹🈹  🈹🈹🈹  🈹🈹🈹 \n 请求模型:%@\n 参数为:\n %@ \n",[NSString stringWithUTF8String:class_getName(Request.class)],parameters);
    }
    
    [self showWaitView:YES withTitle:@"图片上传中..."];
    AhSessionTask *task =nil;
    
    if (iOS8) {
        
        task= [mgr POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            
            NSData *data = UIImagePNGRepresentation(image);
            //           NSData *data =  UIImageJPEGRepresentation(image, 0.001);
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = @"yyyyMMddHHmmss";
            NSString *str = [formatter stringFromDate:[NSDate date]];
            NSString *fileName = [NSString stringWithFormat:@"%@.png", str];
            [formData appendPartWithFileData:data name:@"img" fileName:fileName mimeType:@"image/png"];
            
        } progress:^(NSProgress * _Nonnull uploadProgress) {
            
            if (Progress) {
                Progress(uploadProgress.completedUnitCount,uploadProgress.totalUnitCount);
            }
            
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            [self showWaitView:NO];
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
            NSString *resultClassName = [self resultFromRequest:Request];
            Class aclass = NSClassFromString(resultClassName);
            
            AhResult *result = [aclass mj_objectWithKeyValues:dict];
            
            if (Debug) {  //  打开打印
                MJExtensionLog(@" 🈹🈹🈹  🈹🈹🈹  🈹🈹🈹  🈹🈹🈹  🈹🈹🈹 \n 接受模型:%@\n 接受数据为:\n %@ \n",resultClassName,result);
            }
            
            if (![result.status isEqualToString:@"200"]) {  // 抛异常
                MJExtensionLog(@"否❌否❌否❌否❌否❌否❌否❌ 抛出异常:%@\n status:%@\n 接受数据为:\n msg:%@ \n",resultClassName,result.status,result.msg);
                [self showMessage:result.msg];
            }else{
                success(result);
            }
            
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            [self showWaitView:NO];
            [self showMessage:@"数据请求失败,请稍后再试"];
            if (Debug) {  //  打开打印
                MJExtensionLog(@"否❌否❌否❌否❌否❌否❌否❌否❌否❌ \n 数据请求失败 \n: 请求模型:%@\n 接受数据为:\n\n\n error: %@ \n\n\n",[NSString stringWithUTF8String:class_getName(Request.class)],error);
            }
            
            if (failure) {
                
                failure(error);
            }
            [error localizedDescription];
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
            
        }];
        
    }else{
        
        
    }
    
    if (task) {
        [[self allTasks]addObject:task];
    }
    return task;
    
}

+ (NSString*)createCacheDirectory:(NSString*)path
{
    NSString *fullPath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@",path]];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:fullPath]) {
        [fileManager createDirectoryAtPath:fullPath withIntermediateDirectories:YES attributes:nil error:NULL];
    }
    return fullPath;
}
/**
 *  创建Document下的文件
 *
 *  @param path 路径描述
 *
 *  @return YES表示创建成功, NO表示该文件已存在
 */
+ (NSString*)CreatDocumentDirectory:(NSString*)path fileName:(NSString*)fileName{
    
    //    NSString *testPath3 = [testDirectory stringByAppendingPathComponent:@"test33.txt"];
    
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    NSString *pathDocuments = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *createPath = [NSString stringWithFormat:@"%@/%@", pathDocuments,path];
    if (![[NSFileManager defaultManager] fileExistsAtPath:createPath]) {
        [fileManager createDirectoryAtPath:createPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSString *fullName = [createPath stringByAppendingPathComponent:fileName];
    MYLog(@"%@",fullName);
    return fullName;
    
    
}


#pragma mark- 下载文件

+ (AhSessionTask *)downloadWithUrl:(NSString *)URLString
                        saveToPath:(NSString *)SaveToPath
                          fileName:(NSString *)aFileName
                          progress:(void (^)(int64_t bytesRead,
                                             int64_t totalBytesRead))Progress
                           success:(void (^)(id responseObject))success
                           failure:(void (^)(NSError *error))failure{
    
    //检查本地文件是否已存在
    
    NSString *fullPath = [self CreatDocumentDirectory:SaveToPath fileName:aFileName];
    AFHTTPSessionManager *mgr = [self defautManager];
    
    //            URLString = [self MakeFullUrl:URLString];
    NSURLRequest *downloadRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:URLString]];
    
    
    
    
    
    if (Debug) {  //  打开打印
        MJExtensionLog(@" 🈹🈹🈹  🈹🈹🈹  🈹🈹🈹  🈹🈹🈹  🈹🈹🈹 \n 下载地址:%@\n 保存路径为:\n %@ \n",URLString,SaveToPath);
    }
    AhSessionTask *task = nil;
    
    task = [mgr downloadTaskWithRequest:downloadRequest progress:^(NSProgress * _Nonnull downloadProgress) {
        
        if (Progress) {
            Progress(downloadProgress.completedUnitCount, downloadProgress.totalUnitCount);
        }
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        
        return [NSURL URLWithString:fullPath];
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        
        [[self allTasks] removeObject:task];
        
        if (error == nil) {
            if (success) {
                success(filePath.absoluteString);
            }
            
            if (Debug) {
                MYLog(@"下载成功 路径 %@",
                      [self absoluteUrlWithPath:URLString]);
            }
        } else {
            
            failure(error);
            
            if (Debug) {
                MYLog(@"下载失败 路径 %@, reason : %@",
                      [self absoluteUrlWithPath:URLString],
                      [error description]);
            }
        }
    }];
    
    [task resume];  //  断点续传 校验
    
    //    [task suspend]; //  暂停下载
    
    if (task) {
        [[self allTasks]addObject:task];
    }
    return task;
}



#pragma mark- 默认管理者

+ (AFHTTPSessionManager *)defautManager{
    
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    // 设置请求时间
    manager.requestSerializer.timeoutInterval = 25;
    //  拿最原始的data数据
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    manager.requestSerializer.stringEncoding = NSUTF8StringEncoding;
    
    if (Ah_httpHeaders!=nil) {  //  使用者设置了公共请求头
        
        for (NSString *key in Ah_httpHeaders.allKeys) {
            if (Ah_httpHeaders[key]!=nil) {
                [manager.requestSerializer setValue:Ah_httpHeaders[key] forHTTPHeaderField:key];
            }
        }
        
    }
    
    //  设置可以接受的类型
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[
                                                                              @"application/json",
                                                                              @"text/html",
                                                                              @"text/xml",
                                                                              @"text/json",
                                                                              @"text/plain",
                                                                              @"text/javascript",
                                                                              @"text/xml",
                                                                              @"image/*",
                                                                              @"application/javascript",
                                                                              @"application/x-javascript"
                                                                              ]];
    
    manager.operationQueue.maxConcurrentOperationCount = 4;
    
    
    return manager;
}

#pragma mark- 合成URl
/**合成Url*/
+ (NSString*)MakeFullUrl:(NSString*)url{
    
    //   return  [self AhURLEncode:[NSString stringWithFormat:@"%@%@%@",HOST,url,SUFFIX]];
    return url;
}

#pragma mark- 由请求模型得到接受模型
/**由请求模型得到接受类模型的字符串*/
+ (NSString *)resultFromRequest:(AhRequest*)request{
    
    NSString *requestClassName =  [NSString stringWithUTF8String:class_getName(request.class)];
    NSString *resultClassName = [NSString stringWithFormat:@"%@Res",requestClassName];
    return resultClassName;
}

#pragma mark- 请求url含有中文的处理

/**url含有中文时的处理*/
+ (NSString *)AhURLEncode:(NSString *)url {
    NSString *newString =
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                              (CFStringRef)url,
                                                              NULL,
                                                              CFSTR(":/?#[]@!$ &'()*+,;=\"<>%{}|\\^~`"), CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding)));
    if (newString) {
        return newString;
    }
    
    return url;
}

#pragma mark- 获取所有请求SessionTask的数组单例
+ (NSMutableArray *)allTasks {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (TaskArr == nil) {
            TaskArr = [[NSMutableArray alloc] init];
        }
    });
    
    return TaskArr;
}
#pragma mark- 完整路径描述
+ (NSString *)absoluteUrlWithPath:(NSString *)path {
    if (path == nil || path.length == 0) {
        MYLog(@"传入的path为空");
        return @"";
    }
    
    NSString *absoluteUrl = path;
    
    if (![path hasPrefix:@"http://"] && ![path hasPrefix:@"https://"]) {  //  猜测path是一个片段
        absoluteUrl = [self MakeFullUrl:path];
    }
    return absoluteUrl;
}


#pragma mark- 取消全部网络请求

+ (void)cancelAllRequest {
    @synchronized(self) {
        [[self allTasks] enumerateObjectsUsingBlock:^(AhSessionTask * _Nonnull task, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([task isKindOfClass:[AhSessionTask class]]) {
                [task cancel];
            }
        }];
        
        [[self allTasks] removeAllObjects];
    };
}

#pragma mark- 取消耽搁Url的网络请求

+ (void)cancelRequestWithURL:(NSString *)url {
    if (url == nil) {
        return;
    }
    
    @synchronized(self) {
        [[self allTasks] enumerateObjectsUsingBlock:^(AhSessionTask * _Nonnull task, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([task isKindOfClass:[AhSessionTask class]]
                && [task.currentRequest.URL.absoluteString hasSuffix:url]) {
                [task cancel];
                [[self allTasks] removeObject:task];
                return;
            }
        }];
    };
}
#pragma mark- 转圈
+ (void)showWaitView:(BOOL)IsShow{
    
    if (IsShow) {
        [MBProgressHUD showMessage:@"加载中"];
    }else{
        [MBProgressHUD hideHUD];
    }
}
#pragma mark- 抛异常
+ (void)showMessage:(NSString *)message{
    
    [MBProgressHUD showTitleMessage:message];
}

#pragma mark- 转圈+定制描述
+ (void)showWaitView:(BOOL)IsShow withTitle:(NSString*)title{
    
    if (IsShow) {
        [MBProgressHUD showMessage:title];
    }else{
        [MBProgressHUD hideHUD];
    }
}
#pragma mark- 将返回状态全部在success中暴露的 使用于 tableVIew加载数据时,返回status不是200时也需要结束刷新状态的场景
// *******//
+ (NSArray*)StatusResult{
//    
//    NSArray *StatusArr = @[
//                           
//                           Breach005,
//                           Breach017,
//                           Breach021,
//                           Breach007
//                           
//                           
//                           
//                           
//                           ];
//    
//    NSMutableArray *NewStatusResult = @[].mutableCopy;
//    for (NSString *UrlString in StatusArr) {
//        
//        NSString *NewUrl = [self MakeFullUrl:UrlString];
//        [NewStatusResult addObject:NewUrl];
//    }
//    
   return nil;
}
//******//
@end
