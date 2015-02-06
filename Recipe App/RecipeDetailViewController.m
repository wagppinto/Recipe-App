//
//  RecipeDetailViewController.m
//  Recipe App
//
//  Created by Wagner Pinto on 2/5/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RecipeDetailViewController.h"
#import "RecipesTableViewDataSource.h"
#import "RARecipes.h"

@interface RecipeDetailViewController ()

@property (nonatomic, strong) UIScrollView *detailScrollView;

@end

@implementation RecipeDetailViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    float newViewYOrigin = 0;
    float paddingBetweenViews = 30;
    
    //create the scrollView for Description and Ingredientes
    self.view.backgroundColor = [UIColor whiteColor];
    self.detailScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview: self.detailScrollView];
    
    //creating a label for the description of the recipe
    UILabel *descrip = [[UILabel alloc]initWithFrame:CGRectMake(20,0, (self.view.frame.size.width - 30), 0)];
    NSString *recipeDescription = [RARecipes descriptionAtIndex:self.indexRecipes];
    descrip.numberOfLines = 0;
    descrip.text = recipeDescription;
    [descrip sizeToFit];
    [self.detailScrollView addSubview:descrip];
    
    // Creating a separate view window to be below description
    newViewYOrigin += descrip.frame.size.height + paddingBetweenViews;
    NSLog(@"%f", newViewYOrigin);
    
    UIView *ingredientsWithVolume = [[UIView alloc]initWithFrame:CGRectMake(20, newViewYOrigin, self.view.frame.size.width, self.view.frame.size.height)];
    [self.detailScrollView addSubview:ingredientsWithVolume];
    
    
        //Creating label for the ingredientes of the recipe
        for (int i = 0; i < [RARecipes ingredientCountAtIndex:self.indexRecipes]; i++) {
            UILabel *ingredientsKey = [[UILabel alloc]initWithFrame:CGRectMake(0, i*30, self.view.frame.size.width, 30)];
            ingredientsKey.text = [RARecipes ingredientTypeAtIndex:i inRecipeAtIndex:self.indexRecipes];
            [ingredientsKey sizeToFit];
            [ingredientsWithVolume addSubview:ingredientsKey];
                NSLog(@"Pass: %i: %f", i, newViewYOrigin);
            
            //Creating label for the ingrediente's volume of the recipe
            UILabel *volumeKey = [[UILabel alloc]initWithFrame:CGRectMake(200, i*30, self.view.frame.size.width, 30)];
            volumeKey.numberOfLines = 0;
            volumeKey.text = [RARecipes ingredientVolumeAtIndex:i inRecipeAtIndex:self.indexRecipes];
            [volumeKey sizeToFit];
            [ingredientsWithVolume addSubview:volumeKey];
        }
    NSLog(@"Volume key: %f", ingredientsWithVolume.frame.size.height);
    newViewYOrigin += ingredientsWithVolume.frame.size.height + paddingBetweenViews;
    //NSLog(@"%f", newViewYOrigin);
    //create view view for the recipe's directions
    UIView *recipeDirections = [[UIView alloc]initWithFrame:CGRectMake(20, newViewYOrigin, self.view.frame.size.width, self.view.frame.size.height)];
    [self.detailScrollView addSubview:recipeDirections];


    //create the label for the recipe descrition:
    NSArray *directionsArray = [RARecipes directionsAtIndex:self.indexRecipes];
    int paddingBetweenLabels = 20;
    float heightOfDirectionLabel = 0;
    for (int i = 0; i < directionsArray.count; i++){
        NSString *direction = directionsArray[i];
        NSString *directionNumber = [NSString stringWithFormat: @"%i. %@", i+1, direction];
        UILabel *recipeDirectionsLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, heightOfDirectionLabel, self.view.frame.size.width - 50, 0)];
        recipeDirectionsLabel.numberOfLines = 0;
        recipeDirectionsLabel.text = directionNumber;
        [recipeDirectionsLabel sizeToFit];
        heightOfDirectionLabel += recipeDirectionsLabel.frame.size.height + paddingBetweenLabels;
        //recipeDirectionsLabel.backgroundColor = [UIColor blueColor];
        [recipeDirections addSubview:recipeDirectionsLabel];
        
        // Changes frame of View to match the height of the stacked directions
        CGRect frame = recipeDirections.frame;
        frame.size.height = heightOfDirectionLabel;
        recipeDirections.frame = frame;
        
        
    }
    
    // Combined height value of all views
    float contentHeight = recipeDirections.frame.size.height + ingredientsWithVolume.frame.size.height + descrip.frame.size.height;
    self.detailScrollView.contentSize = CGSizeMake(self.view.frame.size.width, contentHeight);

    
}

// Automatically calculates size of the View and how to place it under the previous view.
- (float) sizeOfPreviousView:(UIView *)nameOfView {
    float sizeofPreviousViewFloat = nameOfView.frame.size.height + nameOfView.frame.origin.y;
    return sizeofPreviousViewFloat;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
