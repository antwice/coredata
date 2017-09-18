//
//  Antwice+CoreDataProperties.m
//  coredata增删改查
//
//  Created by hcy on 2017/9/18.
//  Copyright © 2017年 HCY. All rights reserved.
//

#import "Antwice+CoreDataProperties.h"

@implementation Antwice (CoreDataProperties)

+ (NSFetchRequest<Antwice *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Antwice"];
}

@dynamic antAge;
@dynamic antName;
@dynamic antId;

@end
