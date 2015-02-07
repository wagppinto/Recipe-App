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
    self.title = @"Recipes";
    self.view.backgroundColor = [UIColor whiteColor];
    self.detailScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview: self.detailScrollView];
    //self.detailScrollView.backgroundColor = [UIColor greenColor];
    
    // creating view with image
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 300, 300)];
    // imageView.center = self.detailScrollView.center;
    imageView.clipsToBounds = YES;

    RecipesTableViewDataSource *imageList = [RecipesTableViewDataSource new];
    NSString *imageString = [imageList getImageStringAtIndex:self.indexRecipes];
    
    UIImage *imagePic = [UIImage imageNamed:imageString];
    imageView.image = imagePic;
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    
    [self.detailScrollView addSubview:imageView];
    newViewYOrigin += imageView.frame.size.height + paddingBetweenViews;
    
    //creating a label for the description of the recipe
    UILabel *descrip = [[UILabel alloc]initWithFrame:CGRectMake(20, newViewYOrigin, (self.view.frame.size.width - 30), 0)];
    NSString *recipeDescription = [RARecipes descriptionAtIndex:self.indexRecipes];
    descrip.numberOfLines = 0;
    descrip.text = recipeDescription;
    [descrip sizeToFit];
    [self.detailScrollView addSubview:descrip];
    // descrip.backgroundColor = [UIColor blueColor];
    
    // Creating a separate view window to be below description
    newViewYOrigin += descrip.frame.size.height + paddingBetweenViews;

    UIView *ingredientsWithVolume = [[UIView alloc]initWithFrame:CGRectMake(20, newViewYOrigin, self.view.frame.size.width, 0)];

    [self.detailScrollView addSubview:ingredientsWithVolume];
    //ingredientsWithVolume.backgroundColor = [UIColor redColor];

        //Creating label for the ingredientes of the recipe
        for (int i = 0; i < [RARecipes ingredientCountAtIndex:self.indexRecipes]; i++) {
            UILabel *ingredientsKey = [[UILabel alloc]initWithFrame:CGRectMake(0, i * paddingBetweenViews, self.view.frame.size.width, 0)];
            ingredientsKey.text = [RARecipes ingredientTypeAtIndex:i inRecipeAtIndex:self.indexRecipes];
            [ingredientsKey sizeToFit];
            [ingredientsWithVolume addSubview:ingredientsKey];
            newViewYOrigin += ingredientsKey.frame.size.height;
            //ingredientsKey.backgroundColor = [UIColor orangeColor];

            
            //Creating label for the ingrediente's volume of the recipe
            UILabel *volumeKey = [[UILabel alloc]initWithFrame:CGRectMake(200, i * paddingBetweenViews, self.view.frame.size.width, 0)];
            volumeKey.numberOfLines = 0;
            volumeKey.text = [RARecipes ingredientVolumeAtIndex:i inRecipeAtIndex:self.indexRecipes];
            [volumeKey sizeToFit];
            [ingredientsWithVolume addSubview:volumeKey];
        }

    newViewYOrigin += paddingBetweenViews * 3;

    //create view view for the recipe's directions
    UIView *recipeDirections = [[UIView alloc]initWithFrame:CGRectMake(20, newViewYOrigin, self.view.frame.size.width, self.view.frame.size.height)];
    [self.detailScrollView addSubview:recipeDirections];
    //recipeDirections.backgroundColor = [UIColor redColor];


    //create the label for the recipe descrition:
    NSArray *directionsArray = [RARecipes directionsAtIndex:self.indexRecipes];
    float heightOfDirectionLabel = 0;
    for (int i = 0; i < directionsArray.count; i++){
        NSString *direction = directionsArray[i];
        NSString *directionNumber = [NSString stringWithFormat: @"%i. %@", i+1, direction];
        UILabel *recipeDirectionsLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, heightOfDirectionLabel, self.view.frame.size.width - 50, 0)];
        recipeDirectionsLabel.numberOfLines = 0;
        recipeDirectionsLabel.text = directionNumber;
        [recipeDirectionsLabel sizeToFit];
        heightOfDirectionLabel += recipeDirectionsLabel.frame.size.height + paddingBetweenViews;
        //recipeDirectionsLabel.backgroundColor = [UIColor blueColor];
        [recipeDirections addSubview:recipeDirectionsLabel];
        
        // Changes frame of View to match the height of the stacked directions
        CGRect frame = recipeDirections.frame;
        frame.size.height = heightOfDirectionLabel;
        recipeDirections.frame = frame;
        
        
    }
    
    // Combined height value of all views
    self.detailScrollView.contentSize = CGSizeMake(self.view.frame.size.width, newViewYOrigin + recipeDirections.frame.size.height);

    
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
