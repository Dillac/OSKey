//
//  func_def_oc.c
//  OSKey
//
//  Created by Burke on 2019/4/3.
//  Copyright © 2019 Burke. All rights reserved.
//

#include "func_def_oc.h"
#import<CommonCrypto/CommonDigest.h>


/*
 1.定义：__cplusplus是cpp中的自定义宏，那么定义了这个宏的话表示这是一段cpp的代码，也就是说，这段的的代码的含义是:如果这是一段cpp的代码，那么加入extern "C"{}处理其中的代码。
 
 要明白为何使用extern "C"，还得从cpp中对函数的重载处理开始说起。在c++中，为了支持重载机制，在编译生成的汇编码中，要对函数的名字进行一些处理，加入比如函数的返回类型等等.而在C中，只是简单的函数名字而已，不会加入其他的信息.也就是说:C++和C对产生的函数名字的处理是不一样的.
 */

/*
 2.定义：'>>' & '<<' 位移运算符
 */


/*
 3.定义：异或运算符"∧"也称XOR运算符。它的规则是若参加运算的两个二进位同号，则结果为0（假）；异号则为1（真）。即 0∧0＝0，0∧1＝1， 1^0=1，1∧1＝0。
 */

/*
 4.定义：若与C/C++文件混编，出现could not build module 'Foundation'，可以修改C文件后缀'.c' 为'.m'

 */

//项目开发中遇到很多知识点分析，作为基础逻辑处理//
//******************************************************************************************//

//#define SAR(x,n)    (((x>>(32-n)))|(x<<n))
//
//#define L1(BB)      BB^SAR(BB,2)^SAR(BB,10)^SAR(BB,18)^SAR(BB,24)
//
//#define L2(BB)      BB^SAR(BB,13)^SAR(BB,23)

int fileToHexString(IN NSData * inData,OUT NSString * hexString){
    enum ErrorStateCode ret = ErrorStateCodeSuccess;
    if (!inData) {
        //无效的输入参数
        ret = ErrorStateCodeInvalidArg;
        return ret;
    }
    NSMutableString *mString = [[NSMutableString alloc] initWithCapacity:[inData length]];
    //时间画复杂度O(k)
    [inData enumerateByteRangesUsingBlock:^(const void *bytes, NSRange byteRange, BOOL *stop) {
        uchar *dataBytes = (uchar *)bytes;
        for (NSInteger i = 0; i < byteRange.length; i++) {
            NSString *hexStr = [NSString stringWithFormat:@"%x", (dataBytes[i]) & 0xff];
            if ([hexStr length] == 2) {
                [mString appendString:hexStr];
            } else {
                [mString appendFormat:@"0%@", hexStr];
            }
        }
     }];
    hexString = [mString copy];
    if (hexString.length == 0) {
        ret = ErrorStateCodeHexString;
    }
    return ret;
}
#pragma mark - sha1
int sha1(IN NSData * inData,OUT NSString * output){
    enum ErrorStateCode ret = ErrorStateCodeSuccess;

    if (!inData) {
        ret = ErrorStateCodeInvalidArg;
        return ret;
    }
    NSMutableString * mutString;
    @try{
        uint8_t digest[CC_SHA1_DIGEST_LENGTH];
        CC_SHA1(inData.bytes, (unsigned int)inData.length, digest);
        mutString = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
        for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++) {
            [mutString appendFormat:@"%02x", digest[i]];
        }
    }
    @catch (NSException *exception){
        //异常处理代码
        ret = ErrorStateCodeHashData;
    }
    output = [mutString copy];
    return ret;
}
int sha256(IN NSData * inData,OUT NSString * output){
    enum ErrorStateCode ret = ErrorStateCodeSuccess;
    //存在中文字符Datacrah的原因
//    NSData *dataIn = [@"" dataUsingEncoding:NSUTF8StringEncoding];
    NSString *hash ;
    @try{
        NSMutableData *macOut = [NSMutableData dataWithLength:CC_SHA256_DIGEST_LENGTH];
        CC_SHA256(inData.bytes, (CC_LONG)inData.length,  macOut.mutableBytes);
        hash = [macOut description];
        hash = [hash stringByReplacingOccurrencesOfString:@" " withString:@""];
        hash = [hash stringByReplacingOccurrencesOfString:@"<" withString:@""];
        hash = [hash stringByReplacingOccurrencesOfString:@">" withString:@""];
    }
    @catch (NSException *exception){
        NSLog(@"%@",exception);
        //异常处理代码
        ret = ErrorStateCodeHashData;
        return ret;
    }
    output = [hash copy];
    return ret;
}
int randomSM4SecKey(int byteLen , OUT NSData ** key){
    
    return 0;
}

