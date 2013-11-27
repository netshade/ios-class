#import <Foundation/Foundation.h>

@protocol CameraDevice

-(NSString *) manufacturerName;

@optional

-(int) flashStrength;

@end

@interface AnExpensiveCanonCamera : NSObject<CameraDevice>
@end

@implementation AnExpensiveCanonCamera

-(NSString *) manufacturerName { return @"CANON"; }
-(int) flashStrength { return 75; }

@end

@interface TheCheapestCameraEver : NSObject<CameraDevice>
@end

@implementation TheCheapestCameraEver

-(NSString *) manufacturerName { return @"SCHMONY"; }

@end


int main(){
  NSArray * cameras = @[
    [[AnExpensiveCanonCamera alloc] init],
    [[TheCheapestCameraEver alloc] init]
  ];
  for(NSObject<CameraDevice> * camera in cameras){
    if([camera respondsToSelector:@selector(flashStrength)]){
      NSLog(@"%@ camera has flash strength %i", [camera manufacturerName], [camera flashStrength]);
    } else {
      NSLog(@"%@ camera has no flash", [camera manufacturerName]);
    }
  }
  return 0;
}
