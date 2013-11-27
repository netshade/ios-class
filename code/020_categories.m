#import <Foundation/Foundation.h>

@interface NSDictionary(AsJson)

-(NSString *) asJson;

@end

@implementation NSDictionary(AsJson)

-(NSString *) asJson {
  if([NSJSONSerialization isValidJSONObject:self]){
    NSError * error;
    NSData * jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                        options:NSJSONWritingPrettyPrinted
                                                          error:&error];
    if(error == nil){
      return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    } else {
      return nil;
    }
  } else {
    return nil;
  }

}

@end


int main(){
  NSLog(@"Dictionary as json: %@", [@{ @"A string": @"String!",
                                       @"A number": @(20),
                                       @"An Array": @[@(1), @(2), @(3)]} asJson]);
}
