//
//  Global.h
//  LanguageChangeTest
//
//  Created by flowdev on 16/7/20.
//  Copyright © 2016年 com.Flow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LanguageManager.h"

#define CNS @"zh-Hans"
#define EN @"en"
#define CNT @"zh-Hant"
#define LANGUAGE_SET @"languageset"

#define SystemLanguageCode [[NSLocale currentLocale] objectForKey:NSLocaleLanguageCode]
#define CurrentLanguageCode [[NSUserDefaults standardUserDefaults] objectForKey:LANGUAGE_SET]
#define StringWithKeyFromTable(key, tbl) [[LanguageManager sharedInstance] stringForKey: key withTable: tbl]
#define _(key) StringWithKeyFromTable(key, @"Localization")

#define TabbarSelectedIndex @"TabbarSelectedIndex"

@interface Global : NSObject

@end
