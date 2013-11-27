#import <Foundation/Foundation.h>

int main(){
  NSDictionary * a = @{
    @"A string": @"Bar",
    @"A number": @(20),
    @"An array": @[
      @(30), @"Foo", @{
        @"Key 1": @"Value 1",
        @"Key 2": @"Value 2",
        @"Key 3": @"Value 3"
      }
    ],
    @"A bool number": @(YES),
    @"A dictionary": @{
      @"String 2": @"Foo",
      @"Number 2": @(300)
    }
  };
  if([a writeToFile:@"./012_plist_example.plist" atomically:YES]){
    NSDictionary * b = [[NSDictionary alloc] initWithContentsOfFile:@"./012_plist_example.plist"];
    if([a isEqualToDictionary:b]){
      NSLog(@"Dictionaries are equal");
      return 0;
    } else {
      NSLog(@"Dictionaries are not equal");
      return 1;
    }
  } else {
    return 1;
  }
}
