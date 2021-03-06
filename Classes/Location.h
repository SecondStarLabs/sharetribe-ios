//
//  Location.h
//  Sharetribe
//
//  Created by Janne Käki on 6/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface Location : NSObject <MKAnnotation>

@property (strong) CLLocation *location;
@property (strong) NSString *address;
@property (assign) BOOL addressIsAutomatic;

- (id)initWithLatitude:(CLLocationDegrees)latitude longitude:(CLLocationDegrees)longitude address:(NSString *)address;

- (id)copy;

- (NSDictionary *)asJSON;

+ (Location *)currentLocation;
+ (void)setCurrentLocation:(Location *)newCurrentLocation;

+ (Location *)locationFromDict:(NSDictionary *)dict;

@end
