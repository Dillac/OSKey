//
//  type_def_oc.h
//  OSKey
//
//  Created by Burke on 2019/4/3.
//  Copyright © 2019 Burke. All rights reserved.
//


#ifdef __OBJC__

#import<Foundation/Foundation.h>
#import<UIKit/UIKit.h>

#endif


#ifndef type_def_oc_h
#define type_def_oc_h


#define IN          /// 输入标记
#define OUT         /// 输出标记
typedef unsigned char   uchar;
typedef unsigned short  ushort;
typedef unsigned int    uint;
typedef unsigned long   ulong;

///ErrorStateCode + content 模式兼容Swift格式
enum ErrorStateCode {
    ErrorStateCodeSuccess       = 0,
    ErrorStateCodeFailure       = 1 << 0,       //失败
    ErrorStateCodeInvalidArg    = 1 << 1,       //无效参数
    ErrorStateCodeSignData      = 1 << 2,       //签名数据出错
    ErrorStateCodeVerifySign    = 1 << 3,       //签名验证出错
    ErrorStateCodeEncrypt       = 1 << 4,       //加密出错
    ErrorStateCodeDecrypt       = 1 << 5,       //解密出错
    ErrorStateCodeHashData      = 1 << 6,       //哈希出错
    ErrorStateCodeHexString     = 1 << 7        //Hex出错
};

#endif /* type_def_oc_h */
