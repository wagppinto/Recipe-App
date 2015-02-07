//
//  RecipesTableViewDataSource.h
//  Recipe App
//
//  Created by Wagner Pinto on 2/4/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecipesTableViewDataSource : NSObject <UITableViewDataSource>



- (void)registerTableView:(UITableView *)tableView;

- (NSString *)getImageStringAtIndex:(int)index;

@end
