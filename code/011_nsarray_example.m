#import <Foundation/Foundation.h>

int main(){
  NSArray * a = @[@"Foo", @"bar", @"baz"];
  NSMutableArray * b = [[NSMutableArray alloc] init];
  [b addObject:@"Not foo"];
  NSLog(@"The contents of a are %@ and b are %@", a, b);

  for(id obj in a){
    NSLog(@"The array contains %@", obj);
  }
  return 0;
}
