//
//  LanguageManager.h
//  LanguageChangeTest
//
//  Created by flowdev on 16/7/20.
//  Copyright © 2016年 com.Flow. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface LanguageManager : NSObject

+ (id)sharedInstance;
- (NSString *)stringForKey:(NSString *)key withTable:(NSString *)table;
-(void)setNewLanguage:(NSString *)language handler: (void (^)())languageChangedCompleteHandler;

@end
