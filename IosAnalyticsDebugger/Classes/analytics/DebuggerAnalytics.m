// Generated by Avo VERSION 56.1.0, PLEASE EDIT WITH CARE

#import <Foundation/Foundation.h>
#import "DebuggerAnalytics.h"
#pragma GCC diagnostic ignored "-Wundeclared-selector"

@interface NSArray (Map)

- (NSArray *)mapArray:(id (^)(id obj))block;

@end

@implementation NSArray (Map)

- (NSArray *)mapArray:(id (^)(id obj))block {
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:[self count]];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [result addObject:block(obj)];
    }];
    return result;
}

@end


@interface AvoInvoke : NSObject

+ (void)invoke:(NSString *)eventId hash:(NSString *)hash messages:(NSArray *)messages;

+ (void)invokeMeta:(NSString *)type messages:(NSArray *)messages;

@end

static double samplingRate = 1.0;

NSString * toISO8601UTC(NSDate *date);
NSString * toISO8601UTC(NSDate *date) {
  NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
  [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"];
  [formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
  [formatter setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"]];
  return [formatter stringFromDate:date];
};

@implementation AvoInvoke

+ (void)invoke:(NSString *)eventId hash:(NSString *)hash messages:(NSArray *)messages {
  NSLog(@"samplingrate=%f", samplingRate);
  if (samplingRate > 0) {
    if (drand48() < samplingRate) {
      NSLog(@"invoke wN77oskJtdl2DSrSThvm LowQacyet fwtXqAc0fCLy7b7oGW40 6nSgGof_U");
      NSDictionary *payload = @{
        @"ac": @"wN77oskJtdl2DSrSThvm",
        @"br": @"LowQacyet",
        @"en": @"dev",
        @"ev": eventId,
        @"ha": hash,
        @"sc": @"fwtXqAc0fCLy7b7oGW40",
        @"se": toISO8601UTC([NSDate date]),
        @"so": @"6nSgGof_U",
        @"va": [messages count] == 0 ? @YES : @NO,
        @"me": messages,
        @"or": @"event"
      };

      NSError *jsonError = nil;
      NSData *json = [NSJSONSerialization dataWithJSONObject:payload options:kNilOptions error:&jsonError];
      NSURL *url = [NSURL URLWithString:@"https://api.avo.app/i"];
      NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
      [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
      [request setHTTPMethod:@"POST"];
      [request setHTTPBody:json];

      NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error != nil) {
          NSLog(@"%@", [error localizedDescription]);
          return;
        }
        if (data == nil) {
          NSLog(@"No data");
          return;
        }
        NSError *jsonError = nil;
        NSDictionary *responseJSON = (NSDictionary *)[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&jsonError];
        NSNumber *rate = responseJSON[@"sa"];
        if (rate != nil) {
          samplingRate = [rate doubleValue];
        }
      }];
      [task resume];
    }
  }
}

+ (void)invokeMeta:(NSString *)type messages:(NSArray *)messages {
  if (samplingRate > 0) {
    if (drand48() < samplingRate) {
      NSLog(@"invokeMeta wN77oskJtdl2DSrSThvm LowQacyet fwtXqAc0fCLy7b7oGW40 6nSgGof_U");
      NSDictionary *payload = @{
        @"ac": @"wN77oskJtdl2DSrSThvm",
        @"br": @"LowQacyet",
        @"en": @"dev",
        @"ty": type,
        @"sc": @"fwtXqAc0fCLy7b7oGW40",
        @"se": toISO8601UTC([NSDate date]),
        @"so": @"6nSgGof_U",
        @"va": [messages count] == 0 ? @YES : @NO,
        @"me": @[]
      };

      NSError *jsonError = nil;
      NSData *json = [NSJSONSerialization dataWithJSONObject:payload options:kNilOptions error:&jsonError];
      NSURL *url = [NSURL URLWithString:@"https://api.avo.app/i"];
      NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
      [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
      [request setHTTPMethod:@"POST"];
      [request setHTTPBody:json];

      NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error != nil) {
          NSLog(@"%@", [error localizedDescription]);
          return;
        }
        if (data == nil) {
          NSLog(@"No data");
          return;
        }
        NSError *jsonError = nil;
        NSDictionary *responseJSON = (NSDictionary *)[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&jsonError];
        NSNumber *rate = responseJSON[@"sa"];
        if (rate != nil) {
          samplingRate = [rate doubleValue];
        }
      }];
      [task resume];
    }
  }
}

@end

@implementation DebuggerAnalytics

static AVOEnv __ENV__ = -1;
static BOOL __STRICT__ = YES;

static NSObject * __DEBUGGER__ = nil;

+ (BOOL)mobileDebuggerEnabled {
    return [__DEBUGGER__ performSelector:@selector(isEnabled)];
}

+ (void)mobileDebuggerPostEvent: (NSString *)name withTimestamp:(NSNumber *)timestamp withId:(NSString *)eventId
                                withEventProps:(NSArray<NSDictionary *> *) eventProps withUserProps:(NSArray<NSDictionary *> *) userProps
                                withMessages:(NSArray<NSDictionary *> *)messages {
    [__DEBUGGER__ performSelector:@selector(publishEvent:withParams:) withObject:name withObject:@{@"timestamp" : timestamp, @"id":eventId, @"messages": messages, @"eventProps": eventProps, @"userProps": userProps}];
}

+ (NSArray *)assertInt:(NSString *)propertyId propertyName:(NSString *)propertyName value:(id)value
{
  NSString* type = [NSString stringWithUTF8String:[value objCType]];
  if (![type isEqualToString:@"i"]) {
    return @[@{@"tag": @"expectedIntType", @"propertyId": propertyId,
        @"message": [NSString stringWithFormat:@"%@ should be of type int but you provided %@", propertyName, type]}];
  }
  return @[];
}

+ (NSArray *)assertFloat:(NSString *)propertyId propertyName:(NSString *)propertyName value:(id)value
{
  NSString* type = [NSString stringWithUTF8String:[value objCType]];
  if (![type isEqualToString:@"d"]) {
    return @[@{@"tag": @"expectedFloatType", @"propertyId": propertyId,
        @"message": [NSString stringWithFormat:@"%@ should be of type float but you provided %@", propertyName, type]}];
  }
  return @[];
}

+ (NSArray *)assertBool:(NSString *)propertyId propertyName:(NSString *)propertyName value:(id)value
{
  NSString* type = [NSString stringWithUTF8String:[value objCType]];
  if (![type isEqualToString:@"c"]) {
    return @[@{@"tag": @"expectedBoolType", @"propertyId": propertyId,
        @"message": [NSString stringWithFormat:@"%@ should be of type bool but you provided %@", propertyName, type]}];
  }
  return @[];
}

+ (NSArray *)assertNonOptional:(NSString *)propertyId propertyName:(NSString *)propertyName value:(id)value
{
  if (value == nil) {
    return @[@{@"tag": @"expectedNonOptional", @"propertyId": propertyId,
        @"message": [NSString stringWithFormat:@"%@ is a required property but you provided null", propertyName]}];
  }
  return @[];
}

+ (NSArray *)assertMaxIntWithProperty:(NSString *)propertyId propertyName:(NSString *)propertyName max:(NSInteger)max value:(NSInteger)value
{
  if (value > max) {
    return @[@{@"tag": @"expectedMax", @"propertyId": propertyId,
        @"message": [NSString stringWithFormat:@"%@ has a maximum value of %@ but you provided the value %@", propertyName, @(max), @(value)]}];
  }
  return @[];
}

+ (NSArray *)assertFloatMaxWithProperty:(NSString *)propertyId propertyName:(NSString *)propertyName max:(double)max value:(double)value
{
  if (value > max) {
    return @[@{@"tag": @"expectedMax", @"propertyId": propertyId,
        @"message": [NSString stringWithFormat:@"%@ has a maximum value of %@ but you provided the value %@", propertyName, @(max), @(value)]}];
  }
  return @[];
}

+ (NSArray *)assertMinIntWithProperty:(NSString *)propertyId propertyName:(NSString *)propertyName min:(NSInteger)min value:(NSInteger)value
{
  if (value < min) {
    return @[@{@"tag": @"expectedMin", @"propertyId": propertyId,
        @"message": [NSString stringWithFormat:@"%@ has a minimum value of %@ but you provided the value %@", propertyName, @(min), @(value)]}];
  }
  return @[];
}

+ (NSArray *)assertMinFloatWithProperty:(NSString *)propertyId propertyName:(NSString *)propertyName min:(double)min value:(double)value
{
  if (value < min) {
    return @[@{@"tag": @"expectedMin", @"propertyId": propertyId,
        @"message": [NSString stringWithFormat:@"%@ has a minimum value of %@ but you provided the value %@", propertyName, @(min), @(value)]}];
  }
  return @[];
}

+ (NSArray *)assertNonNullEnum:(NSString *)propertyId propertyName:(NSString *)propertyName value:(unsigned long)value
{
  if (value < 0) {
    return @[@{@"tag": @"expectedInitializedEnum", @"propertyId": propertyId,
        @"message":[NSString stringWithFormat:@"%@ must not be a NULL enum", propertyName]}];
  }
  return @[];
}

+ (void)avoLoggerLogEventSent:(NSString *)eventName eventProperties:(NSDictionary *)eventProperties userProperties:(NSDictionary *)userProperties
{
  NSLog(@"[avo] Event Sent: %@ Event Props: %@ User Props: %@", eventName, eventProperties, userProperties);
}

NSString * const clientAsString[] = {
  @"Cloud Functions",
  @"Web",
  @"Landing Page",
  @"Cli",
  @"Web Debugger",
  @"Android Debugger",
  @"Ios Debugger",
  @"React Native Debugger (ios)",
  @"React Native Debugger (android)"
};

static AVOEnumClient sysClient = AVOEnumClientNULL;
static NSString * sysVersion = nil;

+ (void)setSystemPropertiesWithClient:(AVOEnumClient)client
  version:(nullable NSString *)version
{
  if (((int)client) >= 0 && ((int)client) < 9) {
    sysClient = client;
    [self assertClient:sysClient];
  }
  if (version != nil) {
    sysVersion = version;
    [self assertVersion:sysVersion];
  }
}

static id<AVOCustomDestination> customNodeJs = nil;

+ (void)initAvoWithEnv:(AVOEnv)env
  client:(AVOEnumClient)client
  version:(nullable NSString *)version
  customNodeJsDestination:(nonnull id<AVOCustomDestination>)customNodeJsDestination
  strict:(BOOL)strict
  debugger:(nonnull NSObject *)debugger
{
  __DEBUGGER__ = debugger;
  
  [self initAvoWithEnv:env client:client version:version customNodeJsDestination:customNodeJsDestination strict:strict];
}

+ (void)initAvoWithEnv:(AVOEnv)env
  client:(AVOEnumClient)client
  version:(nullable NSString *)version
  customNodeJsDestination:(nonnull id<AVOCustomDestination>)customNodeJsDestination
  debugger:(nonnull NSObject *)debugger
{
  __DEBUGGER__ = debugger;
  BOOL strict = debugger == nil;
  
  [self initAvoWithEnv:env client:client version:version customNodeJsDestination:customNodeJsDestination strict:strict];
}

+ (void)initAvoWithEnv:(AVOEnv)env
  client:(AVOEnumClient)client
  version:(nullable NSString *)version
  customNodeJsDestination:(nonnull id<AVOCustomDestination>)customNodeJsDestination
{
  [self initAvoWithEnv:env client:client version:version customNodeJsDestination:customNodeJsDestination strict:YES];
}

+ (void)initAvoWithEnv:(AVOEnv)env
  client:(AVOEnumClient)client
  version:(nullable NSString *)version
  customNodeJsDestination:(nonnull id<AVOCustomDestination>)customNodeJsDestination
  strict:(BOOL)strict
{
  __ENV__ = env;
  
  __STRICT__ = strict;
  
  if (__ENV__ == AVOEnvProd) {
  }
  if (__ENV__ == AVOEnvDev) {
  }
  customNodeJs = customNodeJsDestination;
  [customNodeJs make:env];
  
  [self setSystemPropertiesWithClient:client version:version];
  if (__ENV__ != AVOEnvProd) {
    // debug console in Avo
    [AvoInvoke invokeMeta:@"init" messages:@[]];
  }
}

+ (NSArray *)assertVersion:(nonnull NSString *)version
{
  NSMutableArray *messages = [[NSMutableArray alloc] init];
  [messages addObjectsFromArray:[self assertNonOptional:@"2fad5bf3-7782-49a2-acc2-825daf823095" propertyName:@"Version" value:version]];
  return messages;
}

+ (NSArray *)assertSchemaId:(nonnull NSString *)schemaId
{
  NSMutableArray *messages = [[NSMutableArray alloc] init];
  [messages addObjectsFromArray:[self assertNonOptional:@"40958e87-d69a-4d5a-98f8-b36922466787" propertyName:@"Schema Id" value:schemaId]];
  return messages;
}

+ (NSArray *)assertClient:(AVOEnumClient)client
{
  NSMutableArray *messages = [[NSMutableArray alloc] init];
  [messages addObjectsFromArray:[self assertNonNullEnum:@"9e5c4ff5-d5f6-4e82-b061-d5fa02755aae" propertyName:@"Client" value:client]];
  return messages;
}

/**
 * Debugger Started: Sent when the web debugger is started.
 * 
 * @param frameLocation Describes from where the debugger was started.
 * @param schemaId The ID of the schema that this event is related to.
 *
 * @see <a href="https://www.avo.app/schemas/fwtXqAc0fCLy7b7oGW40/branches/LowQacyet/events/Od3PNKHK1">Debugger Started</a>
 */
+ (void)debuggerStartedWithFrameLocation:(nullable NSString *)frameLocation
  schemaId:(nonnull NSString *)schemaId
{
  // assert properties
  if (__ENV__ != AVOEnvProd || [self mobileDebuggerEnabled]) {
    NSMutableArray *messages = [[NSMutableArray alloc] init];
    [messages addObjectsFromArray:[self assertSchemaId:schemaId]];
    [messages addObjectsFromArray:[self assertClient:sysClient]];
    [messages addObjectsFromArray:[self assertVersion:sysVersion]];
    // debug console in Avo
    [AvoInvoke invoke:@"Od3PNKHK1" hash:@"270a4f670f4787243be9eac317c57b95fad54605b471c9314725bd56643e7528" messages:messages];
    if ((__ENV__ != AVOEnvProd && __DEBUGGER__ != nil) || (__ENV__ == AVOEnvProd && [self mobileDebuggerEnabled])) {
      // Avo mobile debugger
      NSArray<NSDictionary *> * eventProps = @[
        @{@"id" : @"zXjbg4Ek9", @"name" : @"Frame Location", @"value" : frameLocation ? [frameLocation description] : @"nil"},
        @{@"id" : @"40958e87-d69a-4d5a-98f8-b36922466787", @"name" : @"Schema Id", @"value" : schemaId ? [schemaId description] : @"nil"}, 
        @{@"id" : @"9e5c4ff5-d5f6-4e82-b061-d5fa02755aae",@"name" : @"Client",  @"value" : clientAsString[sysClient] ? [clientAsString[sysClient] description] : @"nil"}, 
        @{@"id" : @"2fad5bf3-7782-49a2-acc2-825daf823095",@"name" : @"Version",  @"value" : sysVersion ? [sysVersion description] : @"nil"}];
      NSArray<NSDictionary *> * userProps = @[];
      [self mobileDebuggerPostEvent:@"Debugger Started" withTimestamp:[NSNumber numberWithDouble:[[NSDate date] timeIntervalSince1970]] withId:@"Od3PNKHK1" withEventProps:eventProps withUserProps:userProps withMessages:messages];
    }
    if (__ENV__ != AVOEnvProd) {
      if (__STRICT__) {
        if ([messages count] > 0) {
          NSDictionary * message = [messages objectAtIndex:0];
          [NSException raise:@"Error sending event" format:@"%@: %@", [message objectForKey:@"propertyId"], [message objectForKey:@"message"]];
        }
      } else {
        for (id message in messages) {
          NSLog(@"[avo] ERROR %@", [message objectForKey:@"message"]);
        }
      }
    }
  }
  
  if (__ENV__ != AVOEnvProd) {
    NSMutableDictionary *avoLogEventProperties = [[NSMutableDictionary alloc] init];
    if (frameLocation != nil) {
      avoLogEventProperties[@"Frame Location"] = frameLocation;
    }
    if (schemaId != nil) {
      avoLogEventProperties[@"Schema Id"] = schemaId;
    }
    if (((int)sysClient) >= 0 && ((int)sysClient) < 9) {
      avoLogEventProperties[@"Client"] = clientAsString[sysClient];
    }
    if (sysVersion != nil) {
      avoLogEventProperties[@"Version"] = sysVersion;
    }
    
    NSDictionary *avoLogUserProperties = @{};
    
    [self avoLoggerLogEventSent:@"Debugger Started" eventProperties:avoLogEventProperties userProperties:avoLogUserProperties];
  }
  
  NSMutableDictionary *customNodeJsEventProperties = [[NSMutableDictionary alloc] init];
  if (frameLocation != nil) {
    customNodeJsEventProperties[@"Frame Location"] = frameLocation;
  }
  if (schemaId != nil) {
    customNodeJsEventProperties[@"Schema Id"] = schemaId;
  }
  if (((int)sysClient) >= 0 && ((int)sysClient) < 9) {
    customNodeJsEventProperties[@"Client"] = clientAsString[sysClient];
  }
  if (sysVersion != nil) {
    customNodeJsEventProperties[@"Version"] = sysVersion;
  }
  
  [customNodeJs logEvent:@"Debugger Started" withEventProperties:customNodeJsEventProperties];
}

@end

// AVOMODULEMAP:"DebuggerAnalytics"
// AVOEVENTMAP:["debuggerStarted"]
