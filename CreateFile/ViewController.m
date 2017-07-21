//
//  ViewController.m
//  CreateFile
//
//  Created by 武鹤欣 on 16/3/9.
//  Copyright © 2016年 武鹤欣. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 创建文件
    // 创建文件管理器
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    //获取document路径,括号中属性为当前应用程序独享
    NSArray *directoryPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [directoryPaths objectAtIndex:0];
    //定义记录文件全名以及路径的字符串filePath
    NSString *filePath = [documentDirectory stringByAppendingString:@"UserNameAndPassWord.txt"];
    //查找文件，如果不存在，就创建一个文件
    NSString *testStr = @"没有你，良辰美景可与何人说......";
    NSData *testData = [testStr dataUsingEncoding:NSUTF8StringEncoding];
//    if (![fileManager fileExistsAtPath:filePath]) {
        [fileManager createFileAtPath:filePath contents:testData attributes:nil];
//    }
    
    // 创建textView
    _textView = [[UITextView alloc] initWithFrame:CGRectMake(20, 100, self.view.frame.size.width - 40, 100)];
    _textView.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:_textView];
    _textView.text = filePath;
    NSLog(@"%@",_textView.text);
    
    // 读取写入的文件方法1
    NSData *getData1 = [fileManager contentsAtPath:filePath];
    NSString *getStr1 = [[NSString alloc] initWithData:getData1 encoding:NSUTF8StringEncoding];
    NSLog(@"<1>读取到的内容为:%@",getStr1);
    
    // 读取写入的文件方法2
    NSData *getData2 = [NSData dataWithContentsOfFile:filePath];
    NSString *getStr2 = [[NSString alloc] initWithData:getData2 encoding:NSUTF8StringEncoding];
    NSLog(@"<2>读取到的内容为:%@",getStr2);
    
    // 读取写入的文件方法3
    NSString *getStr3 = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"<3>读取到的内容为:%@",getStr3);
    
    
    
/**********************沙盒路径获取******************************/
    // 获取程序的根目录（home）目录
    NSString *homePath = NSHomeDirectory();
    NSLog(@"根目录：%@",homePath);
    
    // 获取Document目录
    NSArray *paths1 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath = [paths1 lastObject];
    NSLog(@"Document目录:%@",documentPath);
    
    // 获取Library目录
    NSArray *paths2 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *libraryPath = [paths2 lastObject];
    NSLog(@"Library目录:%@",libraryPath);
    
    // 获取Library中的Cache
    NSArray *paths3 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [paths3 lastObject];
    NSLog(@"Library中的Cache目录:%@",cachePath);
    
    // 获取temp路径
    NSString *tempPath = NSTemporaryDirectory();
    NSLog(@"temp路径:%@",tempPath);
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
