#import <Foundation/Foundation.h>

int main(){
  NSDictionary * a = @{
    @"Foo": @"The Foo string",
    @"Bar": @"The Bar string"
  };

  NSMutableDictionary * b = [[NSMutableDictionary alloc] init];
  [b setObject:@"Another string" forKey:@(20)];

  NSLog(@"a's value for Foo is %@, and b's value for 20 is %@",
                            [a objectForKey:@"Foo"],
                            [b objectForKey:@(20)]);

  for(id key in a){
    NSLog(@"The value for %@ is %@", key, [a objectForKey:key]);
  }
  return 0;
}
