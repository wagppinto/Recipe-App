//
//  RecipeDetailViewController.h
//  Recipe App
//
//  Created by Wagner Pinto on 2/5/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecipeDetailViewController : UIViewController

@property (nonatomic,assign) NSInteger indexRecipes;

- (float) sizeOfPreviousView:(UIView *)nameOfView;

@end
