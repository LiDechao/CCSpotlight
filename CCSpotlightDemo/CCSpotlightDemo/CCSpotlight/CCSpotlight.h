//
//  CCSpotlight.h
//  Spotlight
//
//  Created by idechao on 2017/1/12.
//  Copyright © 2017年 idechao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCSpotlightModel.h"

@class CSSearchableItem;

NS_ASSUME_NONNULL_BEGIN

extern NSString *const CCSpotlightIdentifier;

@interface CCSpotlight : NSObject

+ (instancetype)sharedInstance;

- (void)cc_configDefault:(UIImage *)cc_defaultImage cc_defaultDescription:(NSString *)cc_defaultDescription;
- (void)cc_configDefault:(UIImage *)cc_defaultImage cc_defaultDescription:(NSString *)cc_defaultDescription cc_defaultDomainIdentifier:(NSString *)cc_defaultDomainIdentifier;

/*
 * Call this method to add or update items in the index. (up ot identifier)
 */
- (void)cc_saveToSpotlight:(NSArray<id<CCSpotlightModelProtocol>> *)cc_items completionHandler:(void (^ __nullable)(NSError * __nullable error))completionHandler;

- (void)cc_deleteSpotlightItemsWithIdentifier:(NSArray<NSString *> *)identifiers completionHandler:(void (^ __nullable)(NSError * __nullable error))completionHandler;

- (void)cc_deleteSpotlightItemsWithDomainIdentifiers:(NSArray<NSString *> *)domainIdentifiers completionHandler:(void (^ __nullable)(NSError * __nullable error))completionHandler;

- (void)cc_deleteAllSpotlightItemsWithCompletionHandler:(void (^ __nullable)(NSError * __nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
