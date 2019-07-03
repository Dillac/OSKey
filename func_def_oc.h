//
//  func_def_oc.h
//  OSKey
//
//  Created by Burke on 2019/4/3.
//  Copyright © 2019 Burke. All rights reserved.
//


#ifndef func_def_oc_h
#define func_def_oc_h

#include <stdio.h>
#include "type_def_oc.h"

#define SM4_ENCRYPT     1
#define SM4_DECRYPT     0

/**
 * \brief          SM4 context structure
 */
typedef struct
{
    int mode;                   /*!<  encrypt/decrypt   */
    unsigned long sk[32];       /*!<  SM4 subkeys       */
}
sm4_context;

#ifdef __cplusplus
extern "C" {
#endif
    
    /**
     Data -> hexString

     @param inData IN Data
     @param hexString OUT String(HEX)
     @return 状态码
     */
    int fileToHexString(IN NSData * inData,OUT NSString * hexString);
    
    /**
     Sha1摘要

     @param inData IN Data
     @param output OUT String
     @return 状态码
     */
    int sha1(IN NSData * inData,OUT NSString * output);
    
    /**
     Sha256摘要
     
     @param inData IN Data
     @param output OUT String
     @return 状态码
     */
    int sha256(IN NSData * inData,OUT NSString * output);
    
    /**
     产生SM4格式对称密钥对

     @param byteLen 密钥长度，<=0 默认16
     @param key OUT 密钥
     @return 状态码
     */
    int randomSM4SecKey(int byteLen , OUT NSData ** key);
    
    /**
     SM4加密

     @param key 密钥
     @param inData IN Data
     @param outData OUT Data
     @return 状态码
     */
    int fileSM4Encrypt(IN NSData *key, IN NSData *inData , OUT NSData ** outData);
    
  
    /**
     SM4解密

     @param key 密钥
     @param inData IN Data
     @param outData OUT Data
     @return 状态码
     */
    int fileSM4Decrypt(IN NSData *key, IN NSData *inData , OUT NSData ** outData);

    
    /**
     SM4加密 支持句柄

     @param key 密钥
     @param inFile 目标文件句柄
     @param outFile 目标文件输出句柄
     @return 状态码
     */
    int fileHandleSM4Encrypt(IN NSData *key, IN NSFileHandle *inFile , OUT NSFileHandle ** outFile);
    
    /**
     SM4加密 支持句柄

     @param key 密钥对
     @param inFile 目标文件句柄
     @param outFile 目标文件输出句柄
     @return 状态码
     */
    int fileHandleSM4Decrypt(IN NSData *key, IN NSFileHandle *inFile , OUT NSFileHandle ** outFile);


    
#ifdef __cplusplus
}
#endif

#endif /* func_def_oc_h */
