#import <Foundation/Foundation.h>

int main(){
  NSNumber * n = @(20.0f);
  double d = [n doubleValue];
  int i = [n intValue];
  NSNumber * b = @(YES);
  NSLog(@"Number is %@, double value is %f, int value is %i", n, d, i);
  NSLog(@"Boolean number is %@, bool value is %i", b, [b boolValue]);
}
