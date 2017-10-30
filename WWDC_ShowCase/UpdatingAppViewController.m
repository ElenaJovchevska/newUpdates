
#import "UpdatingAppViewController.h"

@implementation UpdatingAppViewController {
    UISearchController *searchController;
    __weak IBOutlet UITableView *tableView;
    __weak IBOutlet UILabel *staticViewLabel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    staticViewLabel.text = @"I am static!";
    self.navigationItem.title = NSLocalizedString(@"Updating your app", @"title for Updating your app for iOS11");
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    self.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeAlways;
    [self setupSearchController];
}

- (void)setupSearchController
{
    searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    searchController.searchResultsUpdater = self;
    searchController.dimsBackgroundDuringPresentation = NO;
    self.definesPresentationContext = YES;
    searchController.searchBar.delegate = self;
    searchController.hidesNavigationBarDuringPresentation = NO;
    self.navigationItem.searchController = searchController;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    UITableViewCell *cell = [UITableViewCell new];
    cell.textLabel.text = @"Hello!";
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1f;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [UITableViewCell new];
    cell.textLabel.text = @"Hello!";
    return cell;
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
}

@end
