//
//  Antwice+CoreDataProperties.h
//  coredata增删改查
//
//  Created by hcy on 2017/9/18.
//  Copyright © 2017年 HCY. All rights reserved.
//

#import "Antwice+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Antwice (CoreDataProperties)

+ (NSFetchRequest<Antwice *> *)fetchRequest;

@property (nonatomic) int16_t antAge;
@property (nullable, nonatomic, copy) NSString *antName;
@property (nonatomic) int16_t antId;

@end

NS_ASSUME_NONNULL_END
