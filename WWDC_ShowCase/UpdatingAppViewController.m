
#import "UpdatingAppViewController.h"
#import "ScrollViewController.h"
#import "SafeAreaViewController.h"

@implementation UpdatingAppViewController {
    UISearchController *searchController;
    __weak IBOutlet UITableView *tableView;
    __weak IBOutlet UILabel *staticViewLabel;
    __weak IBOutlet UITabBarItem *favoriteTabBar;
    NSInteger numOfRows;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    numOfRows = 20;
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
    } else if (indexPath.row == 1) {
        cell.textLabel.text = @"Safe Area New!";
    } else {
        cell.textLabel.text = @"Hello!";
    }
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
    return numOfRows;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        ScrollViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ScrollViewControllerIdentifier"];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 1) {
        SafeAreaViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SafeAreaViewControllerIdentifier"];
        [self.navigationController pushViewController:vc animated:YES];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - UITableViewDelegate new methods
- (UISwipeActionsConfiguration *)tableView:(UITableView *)tableView leadingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UISwipeActionsConfiguration *swipeConfig = [UISwipeActionsConfiguration configurationWithActions:@[[self deleteActionForRowAtIndexPath:indexPath]]];
    return swipeConfig;
}

- (UIContextualAction *)deleteActionForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIContextualAction *action = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleDestructive title:@"Delete" handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
        numOfRows -= 1;
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        completionHandler(YES);
    }];
    return action;
}
                                  
- (UISwipeActionsConfiguration *)tableView:(UITableView *)tableView trailingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UISwipeActionsConfiguration *swipeConfig = [UISwipeActionsConfiguration configurationWithActions:@[[self deleteActionForRowAtIndexPath:indexPath]]];
    return swipeConfig;
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
