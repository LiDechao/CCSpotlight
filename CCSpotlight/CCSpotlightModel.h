//
//  CCSpotlightModel.h
//  Spotlight
//
//  Created by idechao on 2017/1/12.
//  Copyright © 2017年 idechao. All rights reserved.
//

#import <Foundation/Foundation.h>

@import UIKit;

NS_ASSUME_NONNULL_BEGIN

@protocol CCSpotlightModelProtocol <NSObject>

@required
@property (nonatomic, copy) NSString *cc_id;    // UniqueIdentifier
@property (nonatomic, copy) NSString *cc_title;

@optional
@property (nonatomic, copy, nullable) NSString *cc_domainIdentifier;
@property (nonatomic, copy, nullable) NSString *cc_description;
@property (nonatomic, strong, nullable) UIImage *cc_image;

@end

@interface CCSpotlightModel : NSObject <CCSpotlightModelProtocol>

@property (nonatomic, copy) NSString *cc_id;
@property (nonatomic, copy) NSString *cc_title;
@property (nonatomic, copy, nullable) NSString *cc_domainIdentifier;
@property (nonatomic, copy, nullable) NSString *cc_description;
@property (nonatomic, strong, nullable) UIImage *cc_image;

@end

NS_ASSUME_NONNULL_END
