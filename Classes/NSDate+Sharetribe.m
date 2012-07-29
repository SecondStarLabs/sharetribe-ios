//
//  NSDate+Sharetribe.m
//  Kassi
//
//  Created by Janne Käki on 2/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSDate+Sharetribe.h"

@implementation NSDate (Sharetribe)

- (NSString *)agestamp
{
    NSTimeInterval interval = -[self timeIntervalSinceNow];
    if (interval < kOneHour) {
        int minutes = (int)(interval/kOneMinute);
        if (minutes == 1) {
            return @"1 minute ago";
        }
        return [NSString stringWithFormat:@"%d minutes ago", minutes];
    } else if (interval < kOneDay) {
        int hours = (int)(interval/kOneHour);
        if (hours == 1) {
            return @"1 hour ago";
        }
        return [NSString stringWithFormat:@"%d hours ago", hours];
    } else {
        int days = (int)(interval/kOneDay);
        if (days == 1) {
            return @"1 day ago";
        }
        return [NSString stringWithFormat:@"%d days ago", days];
    }
}

+ (NSDate *)dateFromTimestamp:(NSString *)timestamp
{
    timestamp = [timestamp stringByReplacingOccurrencesOfString:@":" withString:@""];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = kTimestampFormatInAPI;
    return [formatter dateFromString:timestamp];
}

@end