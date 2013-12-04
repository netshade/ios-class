//
//  PCTableViewController.m
//  Lab9
//
//  Created by Chris Zelenak on 12/4/13.
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
    buffer = [[NSMutableData alloc] init];
    NSFileManager * manager = [NSFileManager defaultManager];
    NSString * cacheDir = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    NSString * cachePath = [NSString stringWithFormat:@"%@/cache.json", cacheDir];
    if([manager fileExistsAtPath:cachePath]){
        NSData * json = [[NSData alloc] initWithContentsOfFile:cachePath];
        self.items = [NSJSONSerialization JSONObjectWithData:json options:0 error:nil];
        [self.tableView reloadData];
    } else {
        NSURL * theUrl = [NSURL URLWithString:@"http://www.bootstrapping-ios.com/echoWait?names=one&names=two&names=three"];
        NSURLRequest * req = [NSURLRequest requestWithURL:theUrl];
        NSURLConnection * conn = [[NSURLConnection alloc] initWithRequest:req delegate:self startImmediately:YES];
    }
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [buffer appendData:data];
}

-(void) connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString * cacheDir = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    NSString * cachePath = [NSString stringWithFormat:@"%@/cache.json", cacheDir];
    [buffer writeToFile:cachePath atomically:YES];
    self.items = [NSJSONSerialization JSONObjectWithData:buffer options:0 error:nil];
    [self.tableView reloadData];
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
    return ((NSArray *)self.items[@"names"]).count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = ((NSArray *) self.items[@"names"])[indexPath.row];
    
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
