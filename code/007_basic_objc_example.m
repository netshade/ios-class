#import <Foundation/Foundation.h>

int main(){
  NSString * anExampleString = @"This is a pointer to an NSString object";
  int strLen = [anExampleString length];

  NSString * aSecondString = [anExampleString stringByAppendingString:@" that had a second string appended to it"];

  if([anExampleString
       compare:@"this is a pointer to an nsstring object"
       options:NSCaseInsensitiveSearch] == NSOrderedSame){
    NSLog(@"The string %@ was case insensitive equal", anExampleString);
  }
}
