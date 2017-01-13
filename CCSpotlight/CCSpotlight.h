//
//  CCSpotlight.h
//  Spotlight
//
//  Created by idechao on 2017/1/12.
//  Copyright © 2017年 idechao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCSpotlightModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CCSpotlight : NSObject

@property (nonatomic, strong, nullable) UIImage *cc_defaultImage;

@property (nonatomic, copy, nullable) NSString *cc_defaultDescription;

@property (nonatomic, copy, nullable) NSString *cc_defaultDomainIdentifier;

+ (instancetype)sharedInstance;

- (void)cc_saveToSpotlight:(NSArray<id<CCSpotlightModelProtocol>> *)cc_items completionHandler:(void (^ __nullable)(NSError * __nullable error))completionHandler;

- (void)cc_deleteSpotlightItemsWithIdentifier:(NSArray<NSString *> *)identifiers completionHandler:(void (^ __nullable)(NSError * __nullable error))completionHandler;

- (void)cc_deleteSpotlightItemsWithDomainIdentifiers:(NSArray<NSString *> *)domainIdentifiers completionHandler:(void (^ __nullable)(NSError * __nullable error))completionHandler;

- (void)cc_deleteAllSpotlightItemsWithCompletionHandler:(void (^ __nullable)(NSError * __nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
