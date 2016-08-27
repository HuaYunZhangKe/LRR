//
//  NSData+YSAdd.h
//  TemplateDemo
//
//  Created by 谷硕 on 16/1/16.
//  Copyright © 2016年 sure. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData(YSAdd)

/**
 Returns a lowercase NSString for md5 hash.
 */
- (NSString *)md5String;

#pragma mark - Encrypt and Decrypt
///=============================================================================
/// @name Encrypt and Decrypt
///=============================================================================

/**
 Returns an encrypted NSData using AES.

 @param key   A key length of 16, 24 or 32 (128, 192 or 256bits).

 @param iv    An initialization vector length of 16(128bits).
 Pass nil when you don't want to use iv.

 @return      An NSData encrypted, or nil if an error occurs.
 */
- (NSData *)aes256EncryptWithKey:(NSData *)key iv:(NSData *)iv;

/**
 Returns an decrypted NSData using AES.

 @param key   A key length of 16, 24 or 32 (128, 192 or 256bits).

 @param iv    An initialization vector length of 16(128bits).
 Pass nil when you don't want to use iv.

 @return      An NSData decrypted, or nil if an error occurs.
 */
- (NSData *)aes256DecryptWithkey:(NSData *)key iv:(NSData *)iv;

#pragma mark - Encode and decode
///=============================================================================
/// @name Encode and decode
///=============================================================================

/**
 Returns string decoded in UTF8.
 */
- (NSString *)utf8String;

/**
 Returns a uppercase NSString in HEX.
 */
- (NSString *)hexString;

/**
 Returns an NSData from hex string.

 @param hexString   The hex string which is case insensitive.

 @return a new NSData, or nil if an error occurs.
 */
+ (NSData *)dataWithHexString:(NSString *)hexString;

/**
 Returns an NSString for base64 encoded.
 */
- (NSString *)base64EncodedString;

/**
 Returns an NSData from base64 encoded string.

 @warning This method has been implemented in iOS7.

 @param base64EncodedString  The encoded string.
 */
+ (NSData *)dataWithBase64EncodedString:(NSString *)base64EncodedString;

/**
 Returns an NSDictionary or NSArray for decoded self.
 Returns nil if an error occurs.
 */
- (id)jsonValueDecoded;
@end
