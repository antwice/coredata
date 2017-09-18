//
//  RootViewController.h
//  coredata增删改查
//
//  Created by hcy on 2017/9/18.
//  Copyright © 2017年 HCY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController
@property(nonatomic,readwrite,strong)NSManagedObjectModel *objectModel;
@property(nonatomic,readwrite,strong)NSManagedObjectContext *objectContext;
@property(nonatomic,readwrite,strong)NSPersistentStoreCoordinator *storeCoordinator;
@end
