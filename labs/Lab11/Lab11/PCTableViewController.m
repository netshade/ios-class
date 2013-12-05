//
//  PCTableViewController.m
//  Lab11
//
//  Created by Chris Zelenak on 12/4/13.
//  Copyright (c) 2013 Bootstrapping iOS. All rights reserved.
//

#import "PCTableViewController.h"
#import "PCAppDelegate.h"
#import "Person.h"
#import "PCViewController.h"

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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void) viewWillAppear:(BOOL)animated
{
    self.persons = [self refreshWithString:nil];
    [self.tableView reloadData];
}

-(NSArray *) refreshWithString:(NSString *)searchString {
    PCAppDelegate * appDelegate = (PCAppDelegate *)[[UIApplication sharedApplication] delegate];
    NSFetchRequest * request = [[NSFetchRequest alloc] initWithEntityName:@"Person"];
    if(searchString){
        [request setPredicate:[NSPredicate predicateWithFormat:@"name contains[c] %@", searchString]];
    }
    return [[appDelegate mainContext] executeFetchRequest:request error:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    self.searchingPersons = [self refreshWithString:searchText];
}

-(void) searchDisplayController:(UISearchDisplayController *)controller didShowSearchResultsTableView:(UITableView *)tableView
{
    self.isSearching = YES;
}

-(void) searchDisplayController:(UISearchDisplayController *)controller didHideSearchResultsTableView:(UITableView *)tableView
{
    self.isSearching = NO;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView == self.searchDisplayController.searchResultsTableView){
        return self.searchingPersons.count;
    } else {
        return self.persons.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if(tableView == self.searchDisplayController.searchResultsTableView){
        cell.textLabel.text = ((Person *)self.searchingPersons[indexPath.row]).name;
    } else {
        cell.textLabel.text = ((Person *)self.persons[indexPath.row]).name;
    }
    
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


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView == self.tableView){
        if (editingStyle == UITableViewCellEditingStyleDelete) {
            PCAppDelegate * appDelegate = (PCAppDelegate *)[[UIApplication sharedApplication] delegate];
            NSManagedObjectContext * context = [appDelegate mainContext];
            Person * p = self.persons[indexPath.row];
            [context deleteObject:p];
            self.persons = [self refreshWithString:nil];
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }
    }
}

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


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"ExistingItem"]){
        Person * p;
        if(self.isSearching){
            p = self.searchingPersons[[self.searchDisplayController.searchResultsTableView indexPathForSelectedRow].row];
        } else {
            p = self.persons[[self.tableView indexPathForSelectedRow].row];
        }
        PCViewController * c = (PCViewController *)[segue destinationViewController];
        [c setSubject:p];
    }
}

@end
