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
  NSError * error;
  NSData * jsonData = [NSJSONSerialization dataWithJSONObject:a
                                                      options:NSJSONWritingPrettyPrinted
                                                        error:&error];
  if(error == nil){
    if([jsonData writeToFile:@"./013_json_example.json" atomically:YES]){
      NSData * inputJsonData = [NSData dataWithContentsOfFile:@"./013_json_example.json"];
      if(inputJsonData){
        id jsonDict = [NSJSONSerialization JSONObjectWithData:inputJsonData
                                                      options:0
                                                        error:&error];
        if(error == nil){
          if([a isEqualToDictionary:jsonDict]){
            return 0;
          } else {
            return 1;
          }
        } else {
          NSLog(@"Error decoding json data, %@", error);
          return 1;
        }
      }
    } else {
      NSLog(@"Error writing json data");
      return 1;
    }
  } else {
    NSLog(@"Error serializing dictionary as JSON, %@",  error);
    return 1;
  }
}
