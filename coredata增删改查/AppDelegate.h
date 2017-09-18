//
//  AppDelegate.h
//  coredata增删改查
//
//  Created by hcy on 2017/9/18.
//  Copyright © 2017年 HCY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

