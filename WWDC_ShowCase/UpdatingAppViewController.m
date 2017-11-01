
#import "UpdatingAppViewController.h"
#import "ScrollViewController.h"

@implementation UpdatingAppViewController {
    UISearchController *searchController;
    __weak IBOutlet UITableView *tableView;
    __weak IBOutlet UILabel *staticViewLabel;
    __weak IBOutlet UITabBarItem *favoriteTabBar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //header, footer and row now have estimatedHeight by default, to AutomaticDimension.
    //Now you can set separatorInsets to be calculated from Automatic Insets or Cell Edges (without margins included).
    tableView.separatorInsetReference = UITableViewSeparatorInsetFromCellEdges;
    //[tableView setBackgroundColor:[UIColor redColor]];
    //tableView.separatorInsetReference = UITableViewSeparatorInsetFromAutomaticInsets;
    staticViewLabel.text = @"I am static!";
    self.navigationItem.title = NSLocalizedString(@"Updating your app", @"title for Updating your app for iOS11");
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    self.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeAlways;
    [self setupSearchController];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    self.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeAlways;
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
    if (indexPath.row == 0) {
        cell.textLabel.text = @"Scroll View New!";
        return cell;
    }
    cell.textLabel.text = @"Hello!";
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1f;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        ScrollViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ScrollViewControllerIdentifier"];
        [self.navigationController pushViewController:vc animated:YES];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
