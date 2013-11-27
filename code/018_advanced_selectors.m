#import <Foundation/Foundation.h>

int main(){
  NSString * anAllCapsString = @"THIS STRING SHOULD BE LOWERCASE";
  NSString * theMessageToSend = @"lowercaseString";
  SEL aSelector = NSSelectorFromString(theMessageToSend);
  if([anAllCapsString respondsToSelector:aSelector]){
    NSLog(@"All caps string (%@) converted: %@", anAllCapsString, [anAllCapsString performSelector:aSelector]);
  }
  return 0;
}
