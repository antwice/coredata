//
//  RootViewController.m
//  coredata增删改查
//
//  Created by hcy on 2017/9/18.
//  Copyright © 2017年 HCY. All rights reserved.
//

#import "RootViewController.h"
#import <CoreData/CoreData.h>
#import "Antwice+CoreDataClass.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"增删改查";
    [self createDatabase];//创建数据库
    [self insertButton];//插入按钮
    [self deleteButton];//删除按钮
    [self changeButton];//修改按钮
    [self checkButton];//查询按钮
    
}

-(void)createDatabase{
    //创建模型数据
    NSURL *modelUrl=[[NSBundle mainBundle]URLForResource:@"Ant" withExtension:@"momd"];
    
    //创建模型对象
    _objectModel=[[NSManagedObjectModel alloc]initWithContentsOfURL:modelUrl];
    
    //创建持久化存储助理
    _storeCoordinator=[[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:_objectModel];
    
    //创建关联数据库
    NSString *sqlPath=[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject] stringByAppendingPathComponent:@"antwice.sqlite"];
    
    NSLog(@"%@",sqlPath);
    NSURL *sqlUrl=[NSURL fileURLWithPath:sqlPath];
    
    NSError *error;
    
    //设置数据库相关信息 添加一个持久化存储库并设置类型和路径，NSSQLiteStoreType：SQLite作为存储库
    [_storeCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:sqlUrl options:nil error:&error];
    
    if (error) {
        NSLog(@"添加数据库失败");
    }else{
        NSLog(@"添加数据库成功");
    }
    
    //创建上下文文件
    _objectContext=[[NSManagedObjectContext alloc]initWithConcurrencyType:NSMainQueueConcurrencyType];
    
    //关联持久化助理
    _objectContext.persistentStoreCoordinator=_storeCoordinator;
}

//创建按钮
-(void)insertButton{
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(50, 100, 100, 100)];
    btn.backgroundColor=[UIColor greenColor];
    [btn setTitle:@"插入操作" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(insertBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void)deleteButton{
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(250, 100, 100, 100)];
    btn.backgroundColor=[UIColor greenColor];
    [btn setTitle:@"删除操作" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(deleteBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}


-(void)changeButton{
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(50, 300, 100, 100)];
    btn.backgroundColor=[UIColor greenColor];
    [btn setTitle:@"修改操作" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(changeBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}


-(void)checkButton{
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(250, 300, 100, 100)];
    btn.backgroundColor=[UIColor greenColor];
    [btn setTitle:@"查询操作" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(checkBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

//增
-(void)insertBtn{
    
    Antwice *antwice=[NSEntityDescription insertNewObjectForEntityForName:@"Antwice" inManagedObjectContext:_objectContext];
    antwice.antId=15;
    antwice.antAge=28;
    antwice.antName=@"Miracle";
    
    //保存插入的数据
    NSError *error;
    if ([_objectContext save:&error]) {
        NSLog(@"插入成功");
    }else{
        NSLog(@"插入失败");
    }
}

//删
-(void)deleteBtn{
    //创建查询请求
    NSFetchRequest *fetchRequest=[NSFetchRequest fetchRequestWithEntityName:@"Antwice"];
    NSError *error;
    NSArray *allArray=[_objectContext executeFetchRequest:fetchRequest error:&error];
    //删除操作
    for (Antwice *antwice in allArray) {
        [_objectContext deleteObject:antwice];
    }
    if ([_objectContext save:&error]) {
        NSLog(@"删除数据失败");
    }else{
        NSLog(@"删除成功");
    }
    
    
}

//改
-(void)changeBtn{
    
    //创建查询请求
    NSFetchRequest *fetchRequest=[NSFetchRequest fetchRequestWithEntityName:@"Antwice"];
    NSError *error;
    NSArray *allArray=[_objectContext executeFetchRequest:fetchRequest error:&error];
    
    for (Antwice *antwice in allArray) {
        antwice.antName=@"antwice";
    }
    if ([_objectContext save:&error]) {
        NSLog(@"更新数据成功");
    }else{
        NSLog(@"更新失败");
    }
    
}

//查
-(void)checkBtn{
    //创建查询请求
    NSFetchRequest *fetchRequest=[NSFetchRequest fetchRequestWithEntityName:@"Antwice"];
    NSError *error;
    NSArray *allArray=[_objectContext executeFetchRequest:fetchRequest error:&error];
    for (Antwice *antwice in allArray) {
        NSLog(@"名字=%@,ID=%d,年龄=%d",antwice.antName,antwice.antId,antwice.antAge);
     
        
    }
}

@end
