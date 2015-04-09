//
//  ViewController.m
//  Alcoholicator
//
//  Created by Beni Cheni on 4/7/15.
//  Copyright (c) 2015 Princess of Darkness Factory. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (assign) float ouncesOfAlcoholPerWineGlass;
@property (assign) float numberOfWineGlassesForEquivalentAlcoholAmount;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)textFieldDidChange:(UITextField *)sender {
    NSString *enteredText = sender.text;
    float enteredNumber = [enteredText floatValue];
    
    if (enteredNumber == 0) {
        // The user typed 0, or something that's not a number, so clear the field
        sender.text = nil;
    }
}

- (IBAction)sliderValueDidChange:(UISlider *)sender {
    NSLog(@"Slider value changed to %f", sender.value);
    [self.beerPercentTextField resignFirstResponder];
    
    [self calculateGenericNumbers];
    
    // now, calculate the equivalent amount of wine...
    self.ouncesOfAlcoholPerWineGlass = OUNCES_IN_ONE_WINE_GLASS * ALCOHOL_PERCENTAGE_OF_WINE;
    self.numberOfWineGlassesForEquivalentAlcoholAmount = self.ouncesOfAlcoholTotal / self.ouncesOfAlcoholPerWineGlass;
    
    NSString *glassWord = NSLocalizedString(@"glass", @"singular glass");
    
    if (self.numberOfWineGlassesForEquivalentAlcoholAmount > 1) {
        glassWord = NSLocalizedString(@"glasses", @"plural of glass");
    }
    
    self.title = [NSString stringWithFormat:NSLocalizedString(@"Wine (%.1f %@)", @"Number of glasses"), self.numberOfWineGlassesForEquivalentAlcoholAmount, glassWord];
}

- (IBAction)buttonPressed:(UIButton *)sender {
    [self.beerPercentTextField resignFirstResponder];

    [self calculateGenericNumbers];
    
    // now, calculate the equivalent amount of wine...
    self.ouncesOfAlcoholPerWineGlass = OUNCES_IN_ONE_BEER_GLASS * ALCOHOL_PERCENTAGE_OF_WINE;
    self.numberOfWineGlassesForEquivalentAlcoholAmount = self.ouncesOfAlcoholTotal / self.ouncesOfAlcoholPerWineGlass;
    
    // decide whether to use "beer"/"beers" and "glass"/"glasses"
    NSString *beerText = NSLocalizedString(@"beer", @"singular beer");
    
    if (self.numberOfBeers > 1) {
        beerText = NSLocalizedString(@"beers", @"plural of beer");
    }
    
    NSString *wineText = NSLocalizedString(@"glass", @"singular glass");
    
    if (self.numberOfWineGlassesForEquivalentAlcoholAmount > 1) {
        wineText = NSLocalizedString(@"glasses", @"plural of glass");
    }
    
    // generate the result text, and display it on the label
    NSString *resultText
        = [NSString stringWithFormat:NSLocalizedString(@"%d %@ (with %.2f%% alcohol) contains as much alcohol as %.1f %@ of wine.", nil),
                self.numberOfBeers,
                beerText,
                [self.beerPercentTextField.text floatValue],
                self.numberOfWineGlassesForEquivalentAlcoholAmount,
                wineText];
    self.resultLabel.text = resultText;
}

- (void)calculateGenericNumbers {
    // first, calculate how much alcohol is in all those beers...
    self.numberOfBeers = self.beerCountSlider.value;
    self.alcoholPercentageOfBeer = [self.beerPercentTextField.text floatValue] / 100;
    self.ouncesOfAlcoholPerBeer = OUNCES_IN_ONE_BEER_GLASS * self.alcoholPercentageOfBeer;
    self.ouncesOfAlcoholTotal = self.ouncesOfAlcoholPerBeer * self.numberOfBeers;
    
}

- (IBAction)tapGestureDidFire:(UITapGestureRecognizer *)sender {
    [self.beerPercentTextField resignFirstResponder];
}

@end
