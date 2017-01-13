//
//  CCSpotlight.m
//  Spotlight
//
//  Created by idechao on 2017/1/12.
//  Copyright © 2017年 idechao. All rights reserved.
//

#import "CCSpotlight.h"


@import CoreSpotlight;

@interface CCSpotlight ()

@property (nonatomic, strong) NSMutableArray<CSSearchableItem *> *searchableItems;

@end

@implementation CCSpotlight

+ (instancetype)sharedInstance {
    static CCSpotlight *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    if (_sharedInstance == nil) {
        dispatch_once(&onceToken, ^{
            _sharedInstance = [[CCSpotlight alloc] init];
        });
    }
    return _sharedInstance;
}

- (instancetype)init {
    if (self = [super init]) {
        _cc_defaultDomainIdentifier = @"com.ccSpotlight.searchableItems.domain";
    }
    return self;
}

- (void)cc_saveToSpotlight:(NSArray<id<CCSpotlightModelProtocol>> *)cc_items completionHandler:(void (^ __nullable)(NSError * __nullable error))completionHandler {
    for (id<CCSpotlightModelProtocol> item in cc_items) {
        CSSearchableItemAttributeSet *attributedSet = [[CSSearchableItemAttributeSet alloc] initWithItemContentType:@"image"];
        attributedSet.title = item.cc_title;
        
        if (self.cc_defaultImage || item.cc_image) {
            UIImage *image = self.cc_defaultImage ? self.cc_defaultImage : item.cc_image;
            attributedSet.thumbnailData = UIImagePNGRepresentation(image);
        }
        
        if (self.cc_defaultDescription || item.cc_description) {
            NSString *des = self.cc_defaultDescription ? self.cc_defaultDescription : item.cc_description;
            attributedSet.contentDescription = des;
        }
        
        NSString *domain = item.cc_domainIdentifier ? item.cc_domainIdentifier : self.cc_defaultDomainIdentifier;
        
        CSSearchableItem *searchItem = [[CSSearchableItem alloc]initWithUniqueIdentifier:item.cc_id domainIdentifier:domain attributeSet:attributedSet];
        if (searchItem) {   // on ios8 will return nil
            [self.searchableItems addObject:searchItem];
        }
    }
    
    [[CSSearchableIndex defaultSearchableIndex] indexSearchableItems:self.searchableItems completionHandler:completionHandler];
}

- (void)cc_deleteSpotlightItemsWithIdentifier:(NSArray<NSString *> *)identifiers completionHandler:(void (^ __nullable)(NSError * __nullable error))completionHandler {
    [[CSSearchableIndex defaultSearchableIndex] deleteSearchableItemsWithIdentifiers:identifiers completionHandler:completionHandler];
}

- (void)cc_deleteSpotlightItemsWithDomainIdentifiers:(NSArray<NSString *> *)domainIdentifiers completionHandler:(void (^ __nullable)(NSError * __nullable error))completionHandler {
    [[CSSearchableIndex defaultSearchableIndex] deleteSearchableItemsWithDomainIdentifiers:domainIdentifiers completionHandler:completionHandler];
}

- (void)cc_deleteAllSpotlightItemsWithCompletionHandler:(void (^ __nullable)(NSError * __nullable error))completionHandler {
    [[CSSearchableIndex defaultSearchableIndex] deleteAllSearchableItemsWithCompletionHandler:completionHandler];
}

- (NSMutableArray<CSSearchableItem *> *)searchableItems {
    if (!_searchableItems) {
        _searchableItems = [NSMutableArray array];
    }
    return _searchableItems;
}

@end
