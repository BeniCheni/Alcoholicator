//
//  WhiskeyViewController.m
//  Alcoholicator
//
//  Created by Beni Cheni on 4/7/15.
//  Copyright (c) 2015 Princess of Darkness Factory. All rights reserved.
//

#import "WhiskeyViewController.h"

@interface WhiskeyViewController ()

@property (assign) float ouncesOfAlcoholPerWhiskeyShot;
@property (assign) float numberOfWhiskeyShotsForEquivalentAlcoholAmount;

@end

@implementation WhiskeyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)sliderValueDidChange:(UISlider *)sender {
    NSLog(@"Slider value changed to %f", sender.value);
    [self.beerPercentTextField resignFirstResponder];
    
    // first, calculate how much alcohol is in all those beers...
    self.numberOfBeers = self.beerCountSlider.value;
    self.alcoholPercentageOfBeer = [self.beerPercentTextField.text floatValue] / 100;
    self.ouncesOfAlcoholPerBeer = OUNCES_IN_ONE_BEER_GLASS * self.alcoholPercentageOfBeer;
    self.ouncesOfAlcoholTotal = self.ouncesOfAlcoholPerBeer * self.numberOfBeers;
    
    // now, calculate the equivalent amount of whiskey shots...
    self.ouncesOfAlcoholPerWhiskeyShot = OUNCES_IN_ONE_WHISKEY_SHOT * ALCOHOL_PERCENTAGE_OF_WHISKEY;
    self.numberOfWhiskeyShotsForEquivalentAlcoholAmount = self.ouncesOfAlcoholTotal / self.ouncesOfAlcoholPerWhiskeyShot;
    
    NSString *shotWord = NSLocalizedString(@"shot", @"singular shot");
    
    if (self.numberOfWhiskeyShotsForEquivalentAlcoholAmount > 1) {
        shotWord = NSLocalizedString(@"shots", @"plural of shot");
    }
    
    self.title = [NSString stringWithFormat:NSLocalizedString(@"Whiskey (%.1f %@)", @"Number of shots"), self.numberOfWhiskeyShotsForEquivalentAlcoholAmount, shotWord];
}

- (void)buttonPressed:(UIButton *)sender {
    [self.beerPercentTextField resignFirstResponder];
    
    // first, calculate how much alcohol is in all those beers...
    self.numberOfBeers = self.beerCountSlider.value;
    self.alcoholPercentageOfBeer = [self.beerPercentTextField.text floatValue] / 100;
    self.ouncesOfAlcoholPerBeer = OUNCES_IN_ONE_BEER_GLASS * self.alcoholPercentageOfBeer;
    self.ouncesOfAlcoholTotal = self.ouncesOfAlcoholPerBeer * self.numberOfBeers;
    
    // now, calculate the equivalent amount of whiskey shots...
    self.ouncesOfAlcoholPerWhiskeyShot = OUNCES_IN_ONE_WHISKEY_SHOT * ALCOHOL_PERCENTAGE_OF_WHISKEY;
    self.numberOfWhiskeyShotsForEquivalentAlcoholAmount = self.ouncesOfAlcoholTotal / self.ouncesOfAlcoholPerWhiskeyShot;
    
    NSString *beerText = NSLocalizedString(@"beer", @"singular beer");
    
    if (self.numberOfBeers > 1) {
        beerText = NSLocalizedString(@"beers", @"plural of beer");
    }
    
    NSString *whiskeyText = NSLocalizedString(@"shot", @"singular shot");
    
    if (self.numberOfWhiskeyShotsForEquivalentAlcoholAmount > 1) {
        whiskeyText = NSLocalizedString(@"shots", @"plural of shot");
    }
    
    self.title = [NSString stringWithFormat:NSLocalizedString(@"Whiskey (%.1f %@)", @"Number of shots"), _numberOfWhiskeyShotsForEquivalentAlcoholAmount, whiskeyText];;
    
    NSString *resultText
        = [NSString stringWithFormat:NSLocalizedString(@"%d %@ (with %.2f%% alcohol) contains as much alcohol as %.1f %@ of whiskey.", nil),
           self.numberOfBeers,
           beerText,
           [self.beerPercentTextField.text floatValue],
           _numberOfWhiskeyShotsForEquivalentAlcoholAmount,
           whiskeyText];
    self.resultLabel.text = resultText;
}

@end
