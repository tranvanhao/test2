//
//  KMMHttpTool.m
//  Weather
//
//  Created by nmtien92 on 1/28/16.
//  Copyright © 2016 nmtien92. All rights reserved.
//

#import "MKKHttpTool.h"
#import "Reachability.h"
#import "AFNetworking.h"

@implementation MKKHttpTool

+(void)GET:(NSString *)URLString withParameters:(id)parameters success:(void (^)(NSData *))success failure:(void (^)(NSError *))failure {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer.timeoutInterval = 30;
    manager.responseSerializer = [AFHTTPResponseSerializer new];
    
    [manager GET:URLString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success((NSData *)responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+(void)POST:(NSString *)URLString withParameters:(id)parameters success:(void (^)(NSData *))success failure:(void (^)(NSError *))failure {

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer new];
    manager.requestSerializer.timeoutInterval = 30;
    [manager POST:URLString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if (failure) {
            failure(error);
        }
    }];
    
}

+(BOOL)isNetworkAvailable {
    Reachability* re = [Reachability reachabilityForInternetConnection];
    if (!re || [re currentReachabilityStatus] == NotReachable){
        return FALSE;
    }
    return TRUE;
}

+(BOOL)hasActiveInternetConnection {
    if (![self isNetworkAvailable]) {
        return false;
    }
    
    NSURL *URL = [[NSURL alloc] initWithString:IE];
    NSString *data = [[NSString alloc] initWithContentsOfURL:URL encoding:NSUTF8StringEncoding error:NULL];
    if (data == nil || data.length == 0) {
        return false;
    }
    
    return true;
}

@end
