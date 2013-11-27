#import <Foundation/Foundation.h>

int main(){
  NSString * anObject = nil;
  if([anObject whoaThisProbablyDoesntExist] == nil){
    NSLog(@"Ah well");
  }
}
