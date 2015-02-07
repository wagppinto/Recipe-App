//
//  RecipesTableViewDataSource.m
//  Recipe App
//
//  Created by Wagner Pinto on 2/4/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RecipesTableViewDataSource.h"
#import "RARecipes.h"

static NSString * const cellIdentifier = @"identifier";


@implementation RecipesTableViewDataSource 


-(void)registerTableView:(UITableView *)tableView
{
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [RARecipes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = [RARecipes titleAtIndex:indexPath.row];
    return cell;
}

- (NSString *)getImageStringAtIndex:(int)index {
     NSArray *imageList = @[@"garlicpork.jpg", @"salmon.jpg", @"pumpkinpie.jpg", @"jamba.jpg", @"chocolate.jpg",];
    
    return imageList[index];
}



@end
