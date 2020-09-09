//
//  main.m
//  GomuTest
//
//  Created by 庞彬 on 2020/9/6.
//

#import <Foundation/Foundation.h>
#import "GomuPerson.h"
#import <objc/runtime.h>
#import <malloc/malloc.h>

struct GomuStruct1 {
    double a; // 8 (0~7)
    char b;   // 1 （8）[1,8],8是1的整数倍
    int c;    // 4 （12~15）[4,9],9不是4的整数倍，往后推移到 10，11，12
    short d;  // 2 （16~17）[2,16],16是2的整数倍
} struct1;

// 内部需要的大小为：18（0~17）
// 最大属性：a 8字节
// 结构体整数倍：8的整数倍：24（18不足补位）

struct GomuStruct2 {
    double a; // 8 (0~7)
    int c;    // 4 (8~11),[4,8],8是4的整数倍
    char b;   // 1 (12),[1,12],12是1的整数倍
    short d;  // 2 (14~15),[2,13],13不是2的整数倍，往后推移到 14
} struct2;

struct GomuStruct3 {
    struct GomuStruct2 struct2; // 8 (0~15)
    char b; // 1 (16)
} struct3; // (0~16) 17，17不是最大8的整数倍，补齐所以为24

struct GomuStruct5 {
    double a; // 8 (0~7)
} struct5; // (0~7) 8 8是最大内存8的整数倍，所以该结构体的内存是8

struct GomuStruct6 {
    int c; // 4 (0~3)
    struct GomuStruct5 struct5; // 8 (8~15) 4不是8的整数倍，所以往后移到8
} struct6; // (0~15)  16

// 内部需要的大小为：16（0~15）
// 最大属性：a 8字节
// 结构体整数倍：8的整数倍：16（16是8的整数倍）


 int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        GomuPerson *person = [GomuPerson alloc];
        person.name = @"Gomu";
        person.nickName = @"iOS";
//        person.sex = @"男";
//        person.age = 18;
        
        NSLog(@"%@ - %lu - %lu - %lu",person,sizeof(person),class_getInstanceSize([GomuPerson class]),malloc_size((__bridge const void *)(person)));
        
    }
    return 0;
}
