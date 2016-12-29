//
//  KMMHttpTool.h
//  Weather
//
//  Created by nmtien92 on 1/28/16.
//  Copyright © 2016 nmtien92. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MKKHttpTool : NSObject

#define IE @"https://dl.dropboxusercontent.com/u/60771296/hasActiveInternetConnection.json"

/**
 *  GET
 *  @param URLString 
 *  @param parameters
 *  @param success
 *  @param failure
 */
+(void)GET:(NSString*)URLString withParameters:(id)parameters success:(void (^)(NSData *responseData)) success failure:(void (^)(NSError* error)) failure;

/**
 *  POST
 *  @param URLString
 *  @param parameters
 *  @param success
 *  @param failure
 */
+(void)POST:(NSString*)URLString withParameters:(id)parameters success:(void (^)(NSData *responseData)) success failure:(void (^)(NSError *error)) failure;

/**
 *  isNetworkAvailable
 *  Kiểm tra xem có bật mạng hay không?
 */
+(BOOL)isNetworkAvailable;

/**
 *  hasActiveInternetConnection
 *  Kiểm tra xem mạng có kết nối internet không?
 */
+(BOOL)hasActiveInternetConnection;
@end
