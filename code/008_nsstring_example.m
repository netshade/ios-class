#import <Foundation/Foundation.h>

int main(){
  NSString * s = @"This is an NSString";
  NSMutableString * so = [[NSMutableString alloc]
                                  initWithString:@"This is a mutable string"];

  [so appendString:s];

  NSLog(@"The mutable string is %@", so);
  return 0;
}
