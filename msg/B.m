//
//  B.m
//  msg
//
//  Created by dzc on 2021/3/3.
//

#import "B.h"

#import <objc/runtime.h>

@implementation B

+ (void)sayHello{
    NSLog(@"我是实现?？？？？？？？？？");
}

+ (BOOL)resolveClassMethod:(SEL)sel{
    if (sel == @selector(say)) {
        NSLog(@"----2222222222---sayHello");
        //方法say是类方法，A类（A类的元类，直至根类NSobject）中没有声明和实现，所以外界调用的时候会崩溃，这里进行消息的处理，因为say是类方法，类方法实现存储在元类中的，所以得把实现添加到元类中，这里还是会抛出异常
        IMP imp = class_getMethodImplementation(self, @selector(sayHello));
        Method method = class_getInstanceMethod(self, @selector(sayHello));
        const char *type = method_getTypeEncoding(method);
        return  class_addMethod(self, sel, imp, type);
    }
    return [super resolveClassMethod:sel];
}
@end
