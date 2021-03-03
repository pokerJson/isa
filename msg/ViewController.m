//
//  ViewController.m
//  msg
//
//  Created by dzc on 2021/3/3.
//

#import "ViewController.h"
#import "A.h"
#import "B.h"
#import "NSObject+xx.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    A *a = [[A alloc]init];
    [A classMethod];//classMethod是调用A类的类方法，遵循isa和superClass的指向，类方法去A的元类中查找，一直跟着superClass找到根类NSObject，万物皆对象，所以会找到Nsobject分类中的实例方法，调用类方法就是调用元类的实例方法
    [A performSelector:@selector(classMethod)];
    
    //对比A和B中的实现
    [A performSelector:@selector(say)];//不会崩溃
    [B performSelector:@selector(say)];//会崩溃

}


@end
