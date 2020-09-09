//
//  GomuP.h
//  GomuTest
//
//  Created by 庞彬 on 2020/9/6.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GomuPerson : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *nickName;
//@property (nonatomic, copy) NSString *sex;
@property (nonatomic, assign) int age;
@property (nonatomic, assign) NSInteger height;
@property (nonatomic) char char1;
@property (nonatomic) char char2;

@end

NS_ASSUME_NONNULL_END
