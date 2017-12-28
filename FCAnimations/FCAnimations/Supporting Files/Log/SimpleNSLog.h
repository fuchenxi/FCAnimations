//
//  SimpleNSLog.h
//  FCAnimations
//
//  Created by fcx on 2017/12/20.
//  Copyright © 2017年 https://github.com/fuchenxi. All rights reserved.
//

#ifndef SimpleNSLog_h
#define SimpleNSLog_h

#import <Foundation/Foundation.h>
#import <asl.h>


#define THIS_FILE [(@"" __FILE__) lastPathComponent]


#define _NSLog(fmt,...) {                                               \
    do                                                                  \
    {                                                                   \
        NSString *str = [NSString stringWithFormat:fmt, ##__VA_ARGS__]; \
        printf("%s\n",[str UTF8String]);                                \
    }                                                                   \
    while (0);                                                          \
}


#define NSLog(fmt, ...) _NSLog((@"%@:%d %s " fmt), THIS_FILE, __LINE__, __FUNCTION__, ##__VA_ARGS__)
#define MessageLog(fmt, ...) _NSLog((@"" fmt), ##__VA_ARGS__)


#ifdef DEBUG
    #define DLog(fmt, ...) _NSLog((@"%@:%d %s " fmt),                \
                THIS_FILE,                                           \
                __LINE__,                                            \
                __FUNCTION__,                                        \
                ##__VA_ARGS__)
#else
    #define DLog(...)
#endif

#endif /* SimpleNSLog_h */
