//
//  XLMethod.h
//  常用方法
//
//  Created by 杨晓龙 on 16/5/31.
//  Copyright © 2016年 杨晓龙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface XLMethod : NSObject
/* 
 * 获取磁盘总空间大小
 */
+ (CGFloat)diskOfAllSizeMBytes;

/**
 * 获取可用磁盘空间大小
 *
 **/
+ (CGFloat)diskOfFreeSizeMBytes;

/**
 * 获取指定路径下的某个文件的大小
 *
 **/
+ (long)fileSizeAtPath:(NSString *)filePath;

/**
 * 获取文件夹下所有文件的大小
 *
 **/
+ (long)folderSizeAtPath:(NSString *)folderPath;

/**
 * 获取字符串（或汉字）首字母
 *
 **/
+ (NSString *)firstCharacterWithString:(NSString *)string;

/**
 * 将字符串数组按照元素首字母顺序进行排序分组
 *
 **/
+ (NSDictionary *)dictionaryOrderByCharacterWithOriginalArray:(NSArray *)array;

/**
 * 获取当前时间
 *
 **/
+ (NSString *)currentDateWithFormat:(NSString *)format;

/**
 * 计算上次日期距离现在多久
 * @param lastTime    上次日期（需要和格式对应）
 * @param format1     上次日期格式
 * @param currentTime 最近日期（需要和格式对应）
 * @param format2     最近日期格式
 **/
+ (NSString *)timeIntrevalFromLastTime:(NSString *)lastime lastTimeFormat:(NSString *)format1 ToCurrentTime:(NSString *)currentTime currentTimeFormat:(NSString *)format2;

/**
 * 判断手机号码格式是否正确
 *
 **/
+ (BOOL)valiMobile:(NSString *)mobile;

/**
 * 判断邮箱格式是否正确
 *
 **/
+ (BOOL)isAvailableEmail:(NSString *)email;

/**
 * 将十六进制颜色转换为UIColor对象
 *
 **/
+ (UIColor *)colorWithHexString:(NSString *)color;

/**
 * 对图片进行滤镜处理
 *
 **/
+ (UIImage *)filterWithOriginalImage:(UIImage *)image filterName:(NSString *)name;

/**
 * 对图片进行模糊处理
 *
 **/
// CIGaussianBlur ---> 高斯模糊
// CIBoxBlur      ---> 均值模糊(Available in iOS 9.0 and later)
// CIDiscBlur     ---> 环形卷积模糊(Available in iOS 9.0 and later)
// CIMedianFilter ---> 中值模糊, 用于消除图像噪点, 无需设置radius(Available in iOS 9.0 and later)
// CIMotionBlur   ---> 运动模糊, 用于模拟相机移动拍摄时的扫尾效果(Available in iOS 9.0 and later)
+ (UIImage *)blurWithOriginalImage:(UIImage *)image blurName:(NSString *)name radius:(NSInteger)radius;

/**
 *  调整图片饱和度, 亮度, 对比度
 *
 *  @param image      目标图片
 *  @param saturation 饱和度
 *  @param brightness 亮度: -1.0 ~ 1.0
 *  @param contrast   对比度
 *
 */
+ (UIImage *)colorControlsWithOriginalImage:(UIImage *)image saturation:(CGFloat)saturation brightness:(CGFloat)brightness contrast:(CGFloat)contrast;

/**
 * 创建一张实时模糊效果View（毛玻璃效果）
 *
 **/
+ (UIVisualEffectView *)effectViewWithFrame:(CGRect)frame;


/**
 * 全屏截图
 *
 **/
+ (UIImage *)shotScreen;

/**
 * 截取一张view生成图片
 *
 **/
+ (UIImage *)shotWithView:(UIView *)view;

/**
 * 截取view中某个区域生成一张图片
 *
 **/
+ (UIImage *)shotWithView:(UIView *)view socpe:(CGRect)scope;

/**
 * 压缩图片到指定尺寸
 *
 **/
+ (UIImage *)compressOriginalImage:(UIImage *)image toSize:(CGSize)size;

/**
 * 压缩图片到指定文件大小
 *
 **/
+ (NSData *)compressOriginalImage:(UIImage *)image toMaxDataSizeKBytes:(CGFloat)size;

/**
 * 获取设备IP地址
 *
 **/
+ (NSString *)getIPAddress;

/**
 * 判断字符串中是否含有空格
 *
 **/
+ (BOOL)isHaveSpaceInString:(NSString *)string;

/**
 * 判断字符串中是否含有某个字符串
 *
 **/
+ (BOOL)isHaveString:(NSString *)string1 InString:(NSString *)string2;

/**
 * 判断字符串中是否含有中文
 *
 **/
+ (BOOL)isHaveChineseInString:(NSString *)string;

/**
 * 判断字符串是否全部是数字
 *
 **/
+ (BOOL)isAllNum:(NSString *)string;

/**
 * 绘制虚线
 *
 **/
/*
 ** lineFrame:     虚线的 frame
 ** length:        虚线中短线的宽度
 ** spacing:       虚线中短线之间的间距
 ** color:         虚线中短线的颜色
 */
+ (UIView *)createDashedLineWithFrame:(CGRect)lineFrame lineLength:(int)length lineSpacing:(int)spacing lineColor:(UIColor *)color;

/*
 * 设置不同字体颜色
 *
 */
+ (NSMutableAttributedString *)fuwenbenString:(NSString *)string FontNumber:(id)font andRange:(NSRange)range AndColor:(UIColor *)vaColor andAllColor:(UIColor *)alColor;

/**
 *  阿拉伯数字转中文
 *
 **/
+ (NSString *)translation:(int)arebic;


/**
 * 将图片导成base64字符串
 *
 */
+ (NSString *)base64String:(UIImage *)image;
/**
 * 获取图片网址
 *
 */
+ (NSString *)getImageURL:(NSString *)str;
/**
 * 时间格式转换
 *
 */
+ (NSString *)exchangeDate:(NSString *)date formatter:(NSString *)formatter ;
/**
 * 字典转JSON
 *
 */
+ (NSString*)dictionaryToJson:(NSDictionary *)dic;
/**
 * JSON转字典
 *
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
/**
 * 系统时间转换
 *
 */
+ (NSString *)getTime:(NSString *)dateStr index:(NSInteger)i flag:(BOOL)flag;
@end
