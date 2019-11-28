// Generated by Avo VERSION 51.37.0, PLEASE EDIT WITH CARE


#ifndef Avo_h
#define Avo_h

typedef NS_ENUM(NSInteger, AVOEnv) {
  AVOEnvProd = 0,
  AVOEnvDev = 1,
};

@protocol AVOCustomDestination

- (void)make:(AVOEnv)avoEnv;

- (void)logEvent:(nonnull NSString*)eventName withEventProperties:(nonnull NSDictionary*)eventProperties;

- (void)setUserProperties:(nonnull NSString*)userId withUserProperties:(nonnull NSDictionary*)userProperties;

- (void)identify:(nonnull NSString*)userId;

- (void)unidentify;

@end

@interface Avo : NSObject

+ (void)initAvoWithEnv:(AVOEnv)env
  customDestination:(nonnull id<AVOCustomDestination>)customDestination;

+ (void)initAvoWithEnv:(AVOEnv)env
  customDestination:(nonnull id<AVOCustomDestination>)customDestination
  strict:(BOOL)strict;

+ (void)initAvoWithEnv:(AVOEnv)env
  customDestination:(nonnull id<AVOCustomDestination>)customDestination
  debugger:(nonnull NSObject *)debugger;

+ (void)initAvoWithEnv:(AVOEnv)env
  customDestination:(nonnull id<AVOCustomDestination>)customDestination
  strict:(BOOL)strict
  debugger:(nonnull NSObject *)debugger;

/**
 * App Opened: No description
 *
 * @see <a href="https://www.avo.app/schemas/0cd8DLUxoxnhXaqRxL6O/events/oZvpnm2MM">App Opened</a>
 */
+ (void)appOpened;

/**
 * Play: Sent when the user plays a track.
 * 
 * @param currentSongName The name of the song that's currently playing.
 *
 * @see <a href="https://www.avo.app/schemas/0cd8DLUxoxnhXaqRxL6O/events/6p9dLEHQVr">Play</a>
 */
+ (void)playWithCurrentSongName:(nonnull NSString *)currentSongName;

/**
 * Pause: Sent when the user pauses a track.
 * 
 * @param currentSongName The name of the song that's currently playing.
 *
 * @see <a href="https://www.avo.app/schemas/0cd8DLUxoxnhXaqRxL6O/events/Ei7HeAerpy">Pause</a>
 */
+ (void)pauseWithCurrentSongName:(nonnull NSString *)currentSongName;

/**
 * Play Next Track: Sent when the user plays next track.
 * 
 * @param currentSongName The name of the song that's currently playing.
 * @param upcomingTrackName The name of the upcoming track.
 *
 * @see <a href="https://www.avo.app/schemas/0cd8DLUxoxnhXaqRxL6O/events/rQvcOWggzs">Play Next Track</a>
 */
+ (void)playNextTrackWithCurrentSongName:(nonnull NSString *)currentSongName
  upcomingTrackName:(nonnull NSString *)upcomingTrackName;

/**
 * Play Previous Track: Sent when the user plays previous track.
 * 
 * @param currentSongName The name of the song that's currently playing.
 * @param upcomingTrackName The name of the upcoming track.
 *
 * @see <a href="https://www.avo.app/schemas/0cd8DLUxoxnhXaqRxL6O/events/xBjjLugyOM">Play Previous Track</a>
 */
+ (void)playPreviousTrackWithCurrentSongName:(nonnull NSString *)currentSongName
  upcomingTrackName:(nonnull NSString *)upcomingTrackName;

@end

#endif
