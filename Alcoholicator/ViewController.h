//
//  ViewController.h
//  Alcoholicator
//
//  Created by Beni Cheni on 4/7/15.
//  Copyright (c) 2015 Princess of Darkness Factory. All rights reserved.
//

#define OUNCES_IN_ONE_BEER_GLASS 12 //assume they are 12oz beer bottles
#define OUNCES_IN_ONE_WINE_GLASS 5  // wine glasses are usually 5oz
#define ALCOHOL_PERCENTAGE_OF_WINE 0.13  // 13% is average

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *beerPercentTextField;
@property (weak, nonatomic) IBOutlet UISlider *beerCountSlider;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@property (assign) int numberOfBeers;
@property (assign) float alcoholPercentageOfBeer;
@property (assign) float ouncesOfAlcoholPerBeer;
@property (assign) float ouncesOfAlcoholTotal;

@end
