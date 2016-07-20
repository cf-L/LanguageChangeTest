//
//  LanguageManager.m
//  LanguageChangeTest
//
//  Created by flowdev on 16/7/20.
//  Copyright © 2016年 com.Flow. All rights reserved.
//

#import "AppDelegate.h"
#import "LanguageManager.h"
#import "RootTabbarController.h"

static LanguageManager *languageManager;

@interface LanguageManager()

@property (nonatomic, strong) NSBundle *bundle;
@property (nonatomic, copy) NSString *language;

@property (nonatomic, copy, nullable) void (^languageChangedCompleteHandler)();

@end

@implementation LanguageManager

+ (id)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        languageManager = [[LanguageManager alloc] init];
    });
    
    return languageManager;
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        [self initLanguage];
    }
    
    return self;
}

- (void)initLanguage {
    NSString *path;
    
    self.language = CurrentLanguageCode ? CurrentLanguageCode : SystemLanguageCode;
    path = [[NSBundle mainBundle]pathForResource:self.language ofType:@"lproj"];
    self.bundle = [NSBundle bundleWithPath:path];
}

-(NSString *)stringForKey:(NSString *)key withTable:(NSString *)table {
    if (self.bundle) {
        return NSLocalizedStringFromTableInBundle(key, table, self.bundle, @"");
    }
    
    return NSLocalizedStringFromTable(key, table, @"");
}

-(void)setNewLanguage:(NSString *)language handler: (void (^)())languageChangedCompleteHandler {
    if ([language isEqualToString:self.language]) {
        return;
    }
    
    if ([language isEqualToString:EN] || [language isEqualToString:CNS] || [language isEqualToString:CNT]) {
        NSString *path = [[NSBundle mainBundle]pathForResource:language ofType:@"lproj"];
        self.bundle = [NSBundle bundleWithPath:path];
    }
    
    self.language = language;
    [[NSUserDefaults standardUserDefaults]setObject:language forKey:LANGUAGE_SET];
    [[NSUserDefaults standardUserDefaults]synchronize];
    self.languageChangedCompleteHandler = languageChangedCompleteHandler;
    languageChangedCompleteHandler();
}

@end
