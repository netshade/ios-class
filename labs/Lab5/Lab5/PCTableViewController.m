//
//  PCTableViewController.m
//  Lab5
//
//  Created by Chris Zelenak on 12/3/13.
//  Copyright (c) 2013 Bootstrapping iOS. All rights reserved.
//

#import "PCTableViewController.h"

@interface PCTableViewController ()

@end

@implementation PCTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    requestData = [[NSMutableData alloc] init];
    [self refresh];
}

-(IBAction) doRefresh:(id)sender
{
    [self refresh];
}

-(void) refresh {
    [connection cancel];
    [self.refreshControl beginRefreshing];
    NSURL * theUrl = [NSURL URLWithString:@"http://bootstrapping-ios.com/echo?names=one&names=two&names=three"];
    NSURLRequest * req = [NSURLRequest requestWithURL:theUrl];
    //    NSURL * theUrl = [NSURL URLWithString:@"http://bootstrapping-ios.com/echo"];
    //    NSMutableURLRequest * req = [NSMutableURLRequest requestWithURL:theUrl];
    //    [req setHTTPMethod:@"POST"];
    //    [req setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    //    [req setHTTPBody:[@"names=one&names=two&names=three" dataUsingEncoding:NSUTF8StringEncoding]];
    connection = [[NSURLConnection alloc] initWithRequest:req delegate:self startImmediately:YES];
}

-(void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSHTTPURLResponse * resp = (NSHTTPURLResponse *) response;
    NSLog(@"Got response code: %i", [resp statusCode]);
}

-(void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [requestData appendData:data];
}

-(void) connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"Connection finished");
    NSError * error = nil;
    id jsonObj = [NSJSONSerialization JSONObjectWithData:requestData options:0 error:&error];
    if(!error){
        self.items = (NSDictionary *)jsonObj;
        [self.tableView reloadData];
    }
    [self.refreshControl endRefreshing];
}

-(void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [[[UIAlertView alloc] initWithTitle:@"Error"
                                message:[error description]
                               delegate:nil
                      cancelButtonTitle:@"Dismiss"
                      otherButtonTitles:nil] show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return ((NSArray * )self.items[@"names"]).count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"DefaultCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = self.items[@"names"][indexPath.row];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
