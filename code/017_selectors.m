#import <Foundation/Foundation.h>

int main(){
  SEL aSelector = @selector(length);
  NSString * foo = @"Foo";
  if([foo respondsToSelector:aSelector]){
    NSLog(@"The length of foo is %i", (int) [foo performSelector:aSelector]);
  }
  return 0;
}
