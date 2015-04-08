//
//  WhiskeyViewController.m
//  Alcoholicator
//
//  Created by Beni Cheni on 4/7/15.
//  Copyright (c) 2015 Princess of Darkness Factory. All rights reserved.
//

#import "WhiskeyViewController.h"

@interface WhiskeyViewController ()

@property (assign) int ouncesInOneBeerGlass;  //assume they are 12oz beer bottles
@property (assign) int numberOfBeers;
@property (assign) float alcoholPercentageOfBeer;
@property (assign) float ouncesOfAlcoholPerBeer;
@property (assign) float ouncesOfAlcoholTotal;

@property (assign) float ouncesInOneWhiskeyShot; // a 1oz shot
@property (assign) float alcoholPercentageOfWhiskey; // 40% is average
@property (assign) float ouncesOfAlcoholPerWhiskeyShot;
@property (assign) float numberOfWhiskeyShotsForEquivalentAlcoholAmount;

@end

@implementation WhiskeyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _ouncesInOneBeerGlass = 12;  //assume they are 12oz beer bottles
    _ouncesInOneWhiskeyShot = 1;
    _alcoholPercentageOfWhiskey = 0.4;  // 40% is average
    _ouncesOfAlcoholPerWhiskeyShot = _ouncesInOneWhiskeyShot * _alcoholPercentageOfWhiskey;
}

- (void)sliderValueDidChange:(UISlider *)sender {
    _numberOfBeers = self.beerCountSlider.value;
    _alcoholPercentageOfBeer = [self.beerPercentTextField.text floatValue] / 100;
    _ouncesOfAlcoholPerBeer = _ouncesInOneBeerGlass * _alcoholPercentageOfBeer;
    _ouncesOfAlcoholTotal = _ouncesOfAlcoholPerBeer * _numberOfBeers;
    _numberOfWhiskeyShotsForEquivalentAlcoholAmount = _ouncesOfAlcoholTotal / _ouncesOfAlcoholPerWhiskeyShot;
    
    NSString *shotWord = NSLocalizedString(@"Shot", @"Singular Shot");
    
    if (_numberOfWhiskeyShotsForEquivalentAlcoholAmount >= 2) {
        shotWord = NSLocalizedString(@"Shots", @"Plural of Shot");
    }
    
    self.title = [NSString stringWithFormat:NSLocalizedString(@"Whiskey (%.1f %@)", @"Number of Shots"), _numberOfWhiskeyShotsForEquivalentAlcoholAmount, shotWord];
}

- (void)buttonPressed:(UIButton *)sender {
    [self.beerPercentTextField resignFirstResponder];
    
    NSString *beerText;
    
    if (_numberOfBeers == 1) {
        beerText = NSLocalizedString(@"beer", @"singular beer");
    } else {
        beerText = NSLocalizedString(@"beers", @"plural of beer");
    }
    
    NSString *whiskeyText;
    
    if (_numberOfWhiskeyShotsForEquivalentAlcoholAmount == 1) {
        whiskeyText = NSLocalizedString(@"shot", @"singular shot");
    } else {
        whiskeyText = NSLocalizedString(@"shots", @"plural of shot");
    }
    
    NSString *resultText
        = [NSString stringWithFormat:NSLocalizedString(@"%d %@ (with %.2f%% alcohol) contains as much alcohol as %.1f %@ of whiskey.", nil),
                    _numberOfBeers,
                    beerText,
                    [self.beerPercentTextField.text floatValue],
                    _numberOfWhiskeyShotsForEquivalentAlcoholAmount,
                    whiskeyText];
    self.resultLabel.text = resultText;
}

@end
