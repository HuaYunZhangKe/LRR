//
//  XLMethod.m
//  常用方法
//
//  Created by 杨晓龙 on 16/5/31.
//  Copyright © 2016年 杨晓龙. All rights reserved.
//

#import "XLMethod.h"
#import <ifaddrs.h>
#import <arpa/inet.h>
@implementation XLMethod
/*
 * 获取磁盘总空间大小
 */
+ (CGFloat)diskOfAllSizeMBytes
{
    CGFloat size = 0;
    NSError *error;
    NSDictionary *dic = [[NSFileManager defaultManager] attributesOfItemAtPath:NSHomeDirectory() error:&error];
    if (error) {
#ifdef DEBUG
        NSLog(@"error: %@",error.localizedDescription);
#endif
    }else
    {
        NSNumber *number = [dic objectForKey:NSFileSystemSize];
        size = [number floatValue] / 1024 / 1024;
    }
    return size;
}

/**
 * 获取可用磁盘空间大小
 *
 **/
+ (CGFloat)diskOfFreeSizeMBytes
{
    CGFloat size = 0;
    NSError *error;
    NSDictionary *dic = [[NSFileManager defaultManager] attributesOfItemAtPath:NSHomeDirectory() error:&error];
    if (error) {
#ifdef DEBUG
        NSLog(@"error: %@",error.localizedDescription);
#endif
    }else
    {
        NSNumber *number = [dic objectForKey:NSFileSystemFreeSize];
        size = [number floatValue] / 1024 / 1024;
    }
    return size;

}

/**
 * 获取指定路径下的某个文件的大小
 *
 **/
+ (long)fileSizeAtPath:(NSString *)filePath
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:filePath])return 0;
    
    return [[fileManager attributesOfItemAtPath:filePath error:nil] fileSize];
}

/**
 * 获取文件夹下所有文件的大小
 *
 **/
+ (long)folderSizeAtPath:(NSString *)folderPath
{
    NSFileManager *fileManger = [NSFileManager defaultManager];
    if (![fileManger fileExistsAtPath:folderPath]) {
        return 0;
    }
    NSEnumerator *filesEnumerator = [[fileManger subpathsAtPath:folderPath] objectEnumerator];
    NSString *fileName;
    long folerSize = 0;
    while ((fileName = [filesEnumerator nextObject]) != nil) {
        NSString *filePath = [folderPath stringByAppendingPathComponent:fileName];
        folerSize += [self fileSizeAtPath:filePath];
    }
    return folerSize;
}

/**
 * 获取字符串（或汉字）首字母
 *
 **/
+ (NSString *)firstCharacterWithString:(NSString *)string
{
    NSMutableString *str = [NSMutableString stringWithString:string];
    CFStringTransform((CFMutableStringRef)str, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((CFMutableStringRef)str, NULL, kCFStringTransformStripDiacritics, NO);
    NSString *pingyin = [str capitalizedString];
    return [pingyin substringToIndex:1];
}

/**
 * 将字符串数组按照元素首字母顺序进行排序分组
 *
 **/
+ (NSDictionary *)dictionaryOrderByCharacterWithOriginalArray:(NSArray *)array
{
    if (array.count == 0) {
        return nil;
    }
    for (id obj in array) {
        if (![obj isKindOfClass:[NSString class]]) {
            return nil;
        }
    }
    UILocalizedIndexedCollation *indexedCollation = [UILocalizedIndexedCollation currentCollation];
    NSMutableArray *objects = [NSMutableArray arrayWithCapacity:indexedCollation.sectionIndexTitles.count];
    for (int i = 0; i < indexedCollation.sectionIndexTitles.count ; i++) {
        NSMutableArray *obj = [NSMutableArray array];
        [objects addObject:obj];
    }
    
    NSMutableArray *keys = [NSMutableArray arrayWithCapacity:objects.count];

    for (int i = 0; i < array.count; i++) {
        NSInteger index = [indexedCollation sectionForObject:array[i] collationStringSelector:@selector(uppercaseString)];
        [[objects objectAtIndex:index] addObject:array[i]];
       
    }
    for (int i = 0; i < objects.count; i++) {
        NSMutableArray *obj = objects[i];
        if (obj.count == 0) {
            [objects removeObject:obj];
        }
    }
    
    for (NSMutableArray *obj in objects) {
        NSString *str = obj[0];
        NSString *key = [self firstCharacterWithString:str];
        [keys addObject:key];
    }
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:objects forKey:keys];
    return dic;
}

/**
 * 获取当前时间
 *
 **/
//format: @"yyyy-MM-dd HH:mm:ss"、@"yyyy年MM月dd日 HH时mm分ss秒"
+ (NSString *)currentDateWithFormat:(NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    return [dateFormatter stringFromDate:[NSDate date]];
}

/**
 * 计算上次日期距离现在多久
 * @param lastTime    上次日期（需要和格式对应）
 * @param format1     上次日期格式
 * @param currentTime 最近日期（需要和格式对应）
 * @param format2     最近日期格式
 **/
+ (NSString *)timeIntrevalFromLastTime:(NSString *)lastime lastTimeFormat:(NSString *)format1 ToCurrentTime:(NSString *)currentTime currentTimeFormat:(NSString *)format2
{
    NSDateFormatter *dateFormatter1 = [[NSDateFormatter alloc] init];
    dateFormatter1.dateFormat = format1;
    NSDate *lastDate = [dateFormatter1 dateFromString:lastime];
    
    NSDateFormatter *dateFormatter2 = [[NSDateFormatter alloc] init];
    dateFormatter2.dateFormat = format2;
    NSDate *currentDate = [dateFormatter2 dateFromString:currentTime];
    return [self timeIntervalFromLastTime:lastDate ToCurrentTime:currentDate];
}
+ (NSString *)timeIntervalFromLastTime:(NSDate *)lastTime ToCurrentTime:(NSDate *)currentTime
{
    NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
    // 上次时间
    NSDate *lastDate = [lastTime dateByAddingTimeInterval:[timeZone secondsFromGMTForDate:lastTime]];
    // 当前时间
    NSDate *currentDate = [currentTime dateByAddingTimeInterval:[timeZone secondsFromGMTForDate:currentTime]];
    // 时间间隔
    NSInteger intevalTime = [currentDate timeIntervalSinceReferenceDate] - [lastDate timeIntervalSinceReferenceDate];
    // 秒、分、小时、天、月、年
    NSInteger minutes = intevalTime / 60;
    NSInteger hours = intevalTime / 60 / 60;
    NSInteger day = intevalTime / 60 / 60 / 24;
    NSInteger month = intevalTime / 60 / 60 / 24 / 30;
    NSInteger years = intevalTime / 60 / 60 / 24 / 30 / 24 / 365;
    if (minutes <= 10) {
        return @"刚刚";
    }else if (minutes < 60) {
        return [NSString stringWithFormat:@"%ld分钟前",minutes];
    }else if (hours < 24) {
        return [NSString stringWithFormat:@"%ld小时前",hours];
    }else if (day < 30) {
        return [NSString stringWithFormat:@"%ld天前",day];
    }else if (month < 12) {
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        df.dateFormat = @"M月d日";
        NSString *time = [df stringFromDate:lastDate];
        return time;
    }else if (years > 1) {
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        df.dateFormat = @"yyyy年M月d日";
        NSString *time = [df stringFromDate:lastDate];
        return time;
    }
    return @"";
}
/**
 * 判断手机号码格式是否正确
 *
 **/
+ (BOOL)valiMobile:(NSString *)mobile
{
    mobile = [mobile stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (mobile.length != 11) {
        return NO;
    }else
    {
        // 移动
        NSString *CM_NUM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
        // 联通
        NSString *CU_NUM = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
        // 电信
        NSString *CT_NUM = @"^((133)|(15[3-4])|(177)|(18[0,1,9]))\\d{8}$";
        
        NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",CM_NUM];
        BOOL isMatch1 = [pred1 evaluateWithObject:mobile];
        NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",CU_NUM];
        BOOL isMatch2 = [pred2 evaluateWithObject:mobile];
        NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",CT_NUM];
        BOOL isMatch3 = [pred3 evaluateWithObject:mobile];
        if (isMatch1 || isMatch2 || isMatch3) {
            return YES;
        }else
        {
            return NO;
        }
    }
}

/**
 * 判断邮箱格式是否正确
 *
 **/
+ (BOOL)isAvailableEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",emailRegex];
    return [emailTest evaluateWithObject:email];
}

/**
 * 将十六进制颜色转换为UIColor对象
 *
 **/
+ (UIColor *)colorWithHexString:(NSString *)color
{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    if ([cString hasPrefix:@"0X"]) {
        cString = [cString substringFromIndex:2];
    }
    if ([cString hasPrefix:@"#"]) {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6) {
        return [UIColor clearColor];
    }
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    unsigned int r,g,b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.) green:((float)g / 255.) blue:((float)b / 255.) alpha:1.f];
}

/**
 * 对图片进行滤镜处理
 *
 **/
+ (UIImage *)filterWithOriginalImage:(UIImage *)image filterName:(NSString *)name
{
    //单色 --> CIPhotoEffectMono
    // 黑白 --> CIPhotoEffectNoir                            褪色 --> CIPhotoEffectFade
    // 色调 --> CIPhotoEffectTonal                           冲印 --> CIPhotoEffectProcess
    // 岁月 --> CIPhotoEffectTransfer                        铬黄 --> CIPhotoEffectChrome
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *inputImage = [[CIImage alloc] initWithImage:image];
    CIFilter *filter = [CIFilter filterWithName:name];
    [filter setValue:inputImage forKey:kCIInputImageKey];
    CIImage *result = [filter valueForKey:kCIOutputImageKey];
    CGImageRef cgImage = [context createCGImage:result fromRect:[result extent]];
    UIImage *resultImage = [UIImage imageWithCGImage:cgImage];
    CGImageRelease(cgImage);
    return resultImage;
}

/**
 * 对图片进行模糊处理
 *
 **/
// CIGaussianBlur ---> 高斯模糊
// CIBoxBlur      ---> 均值模糊(Available in iOS 9.0 and later)
// CIDiscBlur     ---> 环形卷积模糊(Available in iOS 9.0 and later)
// CIMedianFilter ---> 中值模糊, 用于消除图像噪点, 无需设置radius(Available in iOS 9.0 and later)
// CIMotionBlur   ---> 运动模糊, 用于模拟相机移动拍摄时的扫尾效果(Available in iOS 9.0 and later)
+ (UIImage *)blurWithOriginalImage:(UIImage *)image blurName:(NSString *)name radius:(NSInteger)radius
{
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *inputImage = [[CIImage alloc] initWithImage:image];
    CIFilter *filter;
    if (name.length != 0) {
        filter = [CIFilter filterWithName:name];
        [filter setValue:inputImage forKey:kCIInputImageKey];
        if (![name isEqualToString:@"CIMedianFilter"]) {
            [filter setValue:@(radius) forKey:@"inputRadius"];
        }
        CIImage *result = [filter valueForKey:kCIOutputImageKey];
        CGImageRef cgImage = [context createCGImage:result fromRect:[result extent]];
        UIImage *resultImage = [UIImage imageWithCGImage:cgImage];
        CGImageRelease(cgImage);
        return resultImage;
    }else
    {
        return nil;
    }
}

/**
 *  调整图片饱和度, 亮度, 对比度
 *
 *  @param image      目标图片
 *  @param saturation 饱和度
 *  @param brightness 亮度: -1.0 ~ 1.0
 *  @param contrast   对比度
 *
 */
+ (UIImage *)colorControlsWithOriginalImage:(UIImage *)image saturation:(CGFloat)saturation brightness:(CGFloat)brightness contrast:(CGFloat)contrast
{
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *inputImage = [[CIImage alloc] initWithImage:image];
    CIFilter *filter = [CIFilter filterWithName:@"CIColorControls"];
    [filter setValue:inputImage forKey:kCIInputImageKey];
    [filter setValue:@(saturation) forKey:@"inputSaturation"];
    [filter setValue:@(brightness) forKey:@"inputBrightness"];
    [filter setValue:@(contrast) forKey:@"inputContrast"];
    CIImage *result = [filter valueForKey:kCIOutputImageKey];
    CGImageRef cgImage = [context createCGImage:result fromRect:[result extent]];
    UIImage *resultImage = [UIImage imageWithCGImage:cgImage];
    CGImageRelease(cgImage);
    return resultImage;
}

/**
 * 创建一张实时模糊效果View（毛玻璃效果）
 *
 **/
+ (UIVisualEffectView *)effectViewWithFrame:(CGRect)frame
{
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
    effectView.frame = frame;
    return effectView;
}


/**
 * 全屏截图
 *
 **/
+ (UIImage *)shotScreen
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    UIGraphicsBeginImageContext(window.bounds.size);
    [window.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

/**
 * 截取一张view生成图片
 *
 **/
+ (UIImage *)shotWithView:(UIView *)view
{
    UIGraphicsBeginImageContext(view.bounds.size);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext()
    ;
    return image;
}

/**
 * 截取view中某个区域生成一张图片
 *
 **/
+ (UIImage *)shotWithView:(UIView *)view socpe:(CGRect)scope
{
    CGImageRef imageRef = CGImageCreateWithImageInRect([self shotWithView:view].CGImage, scope);
    UIGraphicsBeginImageContext(scope.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect rect = CGRectMake(0, 0, scope.size.width, scope.size.height);
    CGContextTranslateCTM(context, 0, rect.size.height);// 下移
    CGContextScaleCTM(context, 1.0f, -1.0f);// 上翻
    CGContextDrawImage(context, rect, imageRef);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    CGImageRelease(imageRef);
//    CGContextRelease(context);
    return image;
}

/**
 * 压缩图片到指定尺寸
 *
 **/
+ (UIImage *)compressOriginalImage:(UIImage *)image toSize:(CGSize)size
{
    UIImage *resultImage = image;
    UIGraphicsBeginImageContext(size);
    [resultImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
    resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultImage;
}

/**
 * 压缩图片到指定文件大小
 *
 **/
+ (NSData *)compressOriginalImage:(UIImage *)image toMaxDataSizeKBytes:(CGFloat)size
{
    NSData *data = UIImageJPEGRepresentation(image, 1.0);
    CGFloat dataKBytes = data.length / 1000.0;
    CGFloat maxQuality = 0.9f;
    CGFloat lastData = dataKBytes;
    while (dataKBytes > size && maxQuality > 0.01) {
        maxQuality = maxQuality - 0.01f;
        data = UIImageJPEGRepresentation(image, maxQuality);
        dataKBytes = data.length / 1000.0;
        if (lastData == dataKBytes) {
            break;
        }else
        {
            lastData = dataKBytes;
        }
    }
    return data;
}

/**
 * 获取设备IP地址
 *
 **/
+ (NSString *)getIPAddress
{
    NSString *address = @"error";
    struct ifaddrs *interfacs = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    success = getifaddrs(&interfacs);
    if (success == 0) {
        temp_addr = interfacs;
        while (temp_addr != NULL) {
            if (temp_addr->ifa_addr->sa_family == AF_INET) {
                if ([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            temp_addr = temp_addr->ifa_next;
        }
    }
    freeifaddrs(interfacs);
    return address;
}

/**
 * 判断字符串中是否含有空格
 *
 **/
+ (BOOL)isHaveSpaceInString:(NSString *)string
{
    NSRange _range = [string rangeOfString:@" "];
    if (_range.location != NSNotFound) {
        return YES;
    }else
    {
        return NO;
    }
}

/**
 * 判断字符串中是否含有某个字符串
 *
 **/
+ (BOOL)isHaveString:(NSString *)string1 InString:(NSString *)string2
{
    NSRange _range = [string2 rangeOfString:string1];
    if (_range.location != NSNotFound) {
        return YES;
    }else
    {
        return NO;
    }
}

/**
 * 判断字符串中是否含有中文
 *
 **/
+ (BOOL)isHaveChineseInString:(NSString *)string
{
    for (NSInteger i = 0; i < [string length]; i++) {
        int a = [string characterAtIndex:i];
        if (a > 0x4e00 && a < 0x9fff) {
            return YES;
        }
    }
    return NO;
}

/**
 * 判断字符串是否全部是数字
 *
 **/
+ (BOOL)isAllNum:(NSString *)string
{
    unichar c;
    for (int i = 0; i < string.length; i++) {
        c = [string characterAtIndex:i];
        if (!isdigit(c)) {
            return NO;
        }
    }
    return YES;
}

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
+ (UIView *)createDashedLineWithFrame:(CGRect)lineFrame lineLength:(int)length lineSpacing:(int)spacing lineColor:(UIColor *)color
{
    UIView *dashedLine = [[UIView alloc] initWithFrame:lineFrame];
    dashedLine.backgroundColor = [UIColor clearColor];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:dashedLine.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(dashedLine.frame) / 2, CGRectGetHeight(dashedLine.frame))];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    [shapeLayer setStrokeColor:color.CGColor];
    [shapeLayer setLineWidth:CGRectGetHeight(dashedLine.frame)];
    [shapeLayer setLineJoin:kCALineJoinRound];
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:length], [NSNumber numberWithInt:spacing], nil]];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, CGRectGetWidth(dashedLine.frame), 0);
    [shapeLayer setPath:path];
    CGPathRelease(path);
    [dashedLine.layer addSublayer:shapeLayer];
    return dashedLine;

}


/*
 * 设置不同字体颜色
 *
 */
+ (NSMutableAttributedString *)fuwenbenString:(NSString *)string FontNumber:(id)font andRange:(NSRange)range AndColor:(UIColor *)vaColor andAllColor:(UIColor *)alColor
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:string];
    
    if (str != nil) {
        [str addAttribute:NSForegroundColorAttributeName value:alColor range:NSMakeRange(0, string.length)];
        [str addAttribute:NSFontAttributeName value:font range:range];
        [str addAttribute:NSForegroundColorAttributeName value:vaColor range:range];
    }
    
    return [str copy];
}

/**
 *  阿拉伯数字转中文
 *
 **/
+ (NSString *)translation:(int)arebic

{   NSString *str = [NSString stringWithFormat:@"%d",arebic];
    NSArray *arabic_numerals = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"0"];
    NSArray *chinese_numerals = @[@"一",@"二",@"三",@"四",@"五",@"六",@"七",@"八",@"九",@"零"];
    NSArray *digits = @[@"个",@"十",@"百",@"千",@"万",@"十",@"百",@"千",@"亿",@"十",@"百",@"千",@"兆"];
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjects:chinese_numerals forKeys:arabic_numerals];
    
    NSMutableArray *sums = [NSMutableArray array];
    for (int i = 0; i < str.length; i ++) {
        NSString *substr = [str substringWithRange:NSMakeRange(i, 1)];
        NSString *a = [dictionary objectForKey:substr];
        NSString *b = digits[str.length -i-1];
        NSString *sum = @"";
        if (![a isEqualToString:@"一"]) {
            sum = [a stringByAppendingString:b];
        }else
        {
            sum = b;
        }
        
        if ([a isEqualToString:chinese_numerals[9]])
        {
            if([b isEqualToString:digits[4]] || [b isEqualToString:digits[8]])
            {
                sum = b;
                if ([[sums lastObject] isEqualToString:chinese_numerals[9]])
                {
                    [sums removeLastObject];
                }
            }else
            {
                sum = chinese_numerals[9];
            }
            
            if ([[sums lastObject] isEqualToString:sum])
            {
                continue;
            }
        }
        
        [sums addObject:sum];
    }
    
    NSString *sumStr = [sums  componentsJoinedByString:@""];
    NSString *chinese = [sumStr substringToIndex:sumStr.length-1];
    
    return chinese;
}
/**
 * 将图片导成base64字符串
 *
 */
+ (NSString *)base64String:(UIImage *)image
{
    NSData *data = UIImageJPEGRepresentation(image, 1.0f);
    NSString *encodeImageStr = [data base64Encoding];
    return encodeImageStr;
}

/**
 * 获取图片网址
 *
 */
+ (NSString *)getImageURL:(NSString *)str
{
    NSString *string = [NSString stringWithFormat:@"http://sss.haojila.net%@",str];
    return string;
}
/**
 * 时间格式转换
 *
 */
+ (NSString *)exchangeDate:(NSString *)date formatter:(NSString *)formatter
{
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSXXX"];
    NSDate *inputDate = [inputFormatter dateFromString:date];
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:formatter];
    NSString *dateString = [outputFormatter stringFromDate:inputDate];
    return dateString;
}
/**
 * JSON转字典
 *
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    
    if (jsonString == nil) {
        
        return nil;
        
        
        
    }
    
    
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *err;
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                         
                                                        options:NSJSONReadingMutableContainers
                         
                                                          error:&err];
    
    if(err) {
        
        NSLog(@"json解析失败：%@",err);
        
        return nil;
        
    }
    
    return dic;
    
}

/**
 * 字典转JSON
 *
 */
+ (NSString*)dictionaryToJson:(NSDictionary *)dic
{
    
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
}
/**
 * 系统时间转换
 *
 */

+ (NSString *)getTime:(NSString *)dateStr index:(NSInteger)i flag:(BOOL)flag
{
    NSArray *arrWeek = [NSArray arrayWithObjects:@"周日",@"周一",@"周二",@"周三",@"周四",@"周五",@"周六",@"周日",@"周一",@"周二", nil];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSXXX"];
    NSDate *date = [formatter dateFromString:dateStr];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSInteger unitFlags = NSCalendarUnitYear |
    NSCalendarUnitMonth |
    NSCalendarUnitDay |
    NSCalendarUnitWeekday |
    NSCalendarUnitHour |
    NSCalendarUnitMinute |
    NSCalendarUnitSecond;
    NSDateComponents *comps = [calendar components:unitFlags fromDate:date];
    NSInteger week = [comps weekday] + i - 1;
    
//    NSInteger year=[comps year];
//    NSInteger month = [comps month];
//    NSInteger day = [comps day] + i;
    
    
        NSInteger hour = [comps hour];
        NSInteger minute = [comps minute];
    //    NSInteger second = [comps second];
    NSInteger dis = i; //前后的天数
    
    NSDate*nowDate = [NSDate date];
    NSDate* theDate;
    
    if(dis!=0)
    {
        NSTimeInterval  oneDay = 24*60*60*1;  //1天的长度
        
        theDate = [nowDate initWithTimeIntervalSinceNow: +oneDay*dis ];
        //or
        
    }
    else
    {
        theDate = nowDate;
    }
    
    NSDateFormatter*df = [[NSDateFormatter alloc]init];//格式化
    [df setDateFormat:@"yyyy"];
    NSString* s1 = [df stringFromDate:theDate];
    NSString *m_labYear = [NSString stringWithFormat:@"%@-",s1];
    NSLog(@"%@",m_labYear);
    NSDateFormatter*df1 = [[NSDateFormatter alloc]init];//格式化
    [df1 setDateFormat:@"MM"];
    NSString* s2 = [df1 stringFromDate:theDate];
    NSString *m_labDate =[NSString stringWithFormat:@"%@-",s2];
    NSDateFormatter*df2 = [[NSDateFormatter alloc]init];//格式化
    [df2 setDateFormat:@"dd"];
    NSString* s3 = [df2 stringFromDate:theDate];
    NSString *m_labToday =[NSString stringWithFormat:@"%@",s3];

    
    NSString *m_labWeek =[NSString stringWithFormat:@"%@",[arrWeek objectAtIndex:week]];
    NSString *m_hour = [NSString stringWithFormat:@"%.2ld",hour];
    NSString *m_minute = [NSString stringWithFormat:@"%.2ld",minute];
    NSLog(@"%@",m_labDate);
    NSLog(@"%@",m_labToday);
    
    if (flag) {
        NSString *string = [NSString stringWithFormat:@"%@%@%@ %@ %@:%@",m_labYear,m_labDate,m_labToday,m_labWeek,m_hour,m_minute];
        return string;
    }else
    {
        NSString *string = [NSString stringWithFormat:@"%@%@%@ %@",m_labYear,m_labDate,m_labToday,m_labWeek];
        return string;
    }
    
}

@end

