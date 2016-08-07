//
//  HttpsTool.m
//  BaiSiBuDeJie
//
//  Created by James on 16/7/9.
//  Copyright © 2016年 James. All rights reserved.
//

#import "HttpsTool.h"
#import <AFNetworking.h>

@interface HttpsTool ()

@property (strong, nonatomic) AFHTTPSessionManager *manager;

@end

@implementation HttpsTool

implementsSingletonM(HttpsTool)

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self configAFN];
    }
    return self;
}

- (void)configAFN {
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:BS_BASE_URL]];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
    self.enableHttps = [BS_BASE_URL hasPrefix:@"https://"];
    self.manager = manager;
}

- (void)setEnableHttps:(BOOL)enableHttps {
    _enableHttps = enableHttps;
    if (_enableHttps) {
        _manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModePublicKey];
        
        //allowInvalidCertificates 是否允许无效证书（也就是自建的证书），默认为NO
        //如果是需要验证自建证书，需要设置为YES
        _manager.securityPolicy.allowInvalidCertificates = YES;
        
        //validatesDomainName 是否需要验证域名，默认为YES；
        //假如证书的域名与你请求的域名不一致，需把该项设置为NO；如设成NO的话，即服务器使用其他可信任机构颁发的证书，也可以建立连接，这个非常危险，建议打开。
        //置为NO，主要用于这种情况：客户端请求的是子域名，而证书上的是另外一个域名。因为SSL证书上的域名是独立的，假如证书上注册的域名是www.google.com，那么mail.google.com是无法验证通过的；当然，有钱可以注册通配符的域名*.google.com，但这个还是比较贵的。
        //如置为NO，建议自己添加对应域名的校验逻辑。
        _manager.securityPolicy.validatesDomainName = NO;
        
        //validatesCertificateChain 是否验证整个证书链，默认为YES
        //设置为YES，会将服务器返回的Trust Object上的证书链与本地导入的证书进行对比，这就意味着，假如你的证书链是这样的：
        //GeoTrust Global CA
        //    Google Internet Authority G2
        //        *.google.com
        //那么，除了导入*.google.com之外，还需要导入证书链上所有的CA证书（GeoTrust Global CA, Google Internet Authority G2）；
        //如是自建证书的时候，可以设置为YES，增强安全性；假如是信任的CA所签发的证书，则建议关闭该验证，因为整个证书链一一比对是完全没有必要（请查看源代码）；
        //_manager.securityPolicy.validatesCertificateChain = NO;
    }
    else {
        _manager.securityPolicy                          = [AFSecurityPolicy defaultPolicy];
        _manager.securityPolicy.allowInvalidCertificates = NO;
        _manager.securityPolicy.validatesDomainName      = YES;
        //_manager.securityPolicy.validatesCertificateChain = YES;
    }
}

- (NSURLSessionDataTask *)GET:(NSString *)URLString parameters:(id)parameters success:(void (^)(NSURLSessionDataTask *, id))success failure:(void (^)(NSURLSessionDataTask *, NSError *))failure {
    return [self.manager GET:URLString parameters:parameters success:success failure:failure];
}

- (NSURLSessionDataTask *)POST:(NSString *)URLString parameters:(id)parameters success:(void (^)(NSURLSessionDataTask *, id _Nullable))success failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError *))failure {
    return [self.manager POST:URLString parameters:parameters success:success failure:failure];
}

- (NSURLSessionDataTask *)POST:(NSString *)URLString parameters:(id)parameters constructingBodyWithBlock:(void (^)(id<AFMultipartFormData>))block success:(void (^)(NSURLSessionDataTask *, id _Nullable))success failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError *))failure {
    return [self.manager POST:URLString parameters:parameters constructingBodyWithBlock:block success:success failure:failure];
}

@end
