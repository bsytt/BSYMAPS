//
//  PlatformXMLParser.m
//  BSYMAPS
//
//  Created by bsy on 2019/3/14.
//  Copyright © 2019年 bsy. All rights reserved.
//

#import "PlatformXMLParser.h"
#import "Platform.h"

typedef void(^SucBlock)(NSArray *array);

@interface PlatformXMLParser ()<NSXMLParserDelegate>

@property (nonatomic , copy) SucBlock sucBlock;

@property (nonatomic , strong) NSMutableArray *dataArr;

@end

@implementation PlatformXMLParser

- (NSMutableArray *)parser {
    __block NSMutableArray *data = [NSMutableArray array];
    [self XMLParser:^(NSArray *array) {
        [data addObjectsFromArray:array];
    }];
    return data;
}
- (void)XMLParser:(void (^)(NSArray *array)) suc {
    self.sucBlock = suc;
    NSString *xmlFilePath = [[NSBundle mainBundle]pathForResource:@"Config.map"ofType:@"xml"];
    NSData *xmlData = [NSData dataWithContentsOfFile:xmlFilePath];
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:xmlData];
    xmlParser.delegate = self;
    //  开始解析
    [xmlParser parse];
}

# pragma mark - 协议方法
// 开始
- (void)parserDidStartDocument:(NSXMLParser *)parser {
    self.dataArr = [NSMutableArray array];
}

// 获取节点头
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
    if ([elementName isEqualToString:@"platform"]) {
        Platform *stu = [[Platform alloc] init];
        [stu setValuesForKeysWithDictionary:attributeDict];
        [_dataArr addObject:stu];
    }
}
// 结束
- (void)parserDidEndDocument:(NSXMLParser *)parser {
    if (self.sucBlock) {
        self.sucBlock(_dataArr);
    }
}
@end
