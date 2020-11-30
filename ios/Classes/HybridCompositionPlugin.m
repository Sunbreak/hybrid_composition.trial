#import "HybridCompositionPlugin.h"

# pragma HybridCompositionPlugin

@implementation HybridCompositionPlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [registrar registerViewFactory:[[HybridViewFactory alloc] init] withId:@"visual_display_view"];
  [registrar registerViewFactory:[[HybridViewFactory alloc] init] withId:@"hybrid_composition_view"];
}

@end

# pragma HybridView

@interface HybridView () <UITableViewDataSource>

@property (nonatomic, strong) NSArray<NSNumber *> *array;
@property (nonatomic, strong) UITableView *listView;

@end

@implementation HybridView 

- (instancetype)initWithFrame:(CGRect)frame {
  NSMutableArray *array = [NSMutableArray array];
  for (int i = 0; i < 100; i++) {
    [array addObject:[NSNumber numberWithInt:i]];
  }
  _array = [NSArray arrayWithArray:array];
  _listView = [[UITableView alloc] initWithFrame:frame];
  _listView.dataSource = self;
  return self;
}

- (nonnull UIView *)view {
  return self.listView;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
  if (cell == nil)
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
  NSNumber *number = [self.array objectAtIndex: indexPath.row];
  cell.textLabel.text = [NSString stringWithFormat:@"%d", number.intValue];
  return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.array.count;
}

@end

# pragma HybridViewFactory

@implementation HybridViewFactory

- (nonnull NSObject<FlutterPlatformView> *)createWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id _Nullable)args {
  return [[HybridView alloc] initWithFrame:frame];
}

@end
