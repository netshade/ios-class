//
//  Person.h
//  Lab11
//
//  Created by Chris Zelenak on 12/4/13.
//  Copyright (c) 2013 Bootstrapping iOS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Person : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSDate * birthDate;
@property (nonatomic, retain) NSNumber * salary;
@property (nonatomic, retain) NSNumber * vegetarian;

@end
