//
//  MSBackgroundColorUIButton.m
//  Customizable uibutton with background color for state
//
//  Created by Mihai Serban on 4/19/13.
//  Copyright (c) 2013 http://flavors.me/mihaiserban. All rights reserved.
//  Distribuited under MIT License
//

#import "MSBackgroundColorUIButton.h"

@interface MSBackgroundColorUIButton ()

@property (nonatomic, retain) UIColor *_normalColor;
@property (nonatomic, retain) UIColor *_highlightedColor;
@property (nonatomic, retain) UIColor *_selectedColor;
@end

@implementation MSBackgroundColorUIButton
@synthesize _normalColor;
@synthesize _highlightedColor;
@synthesize _selectedColor;

#pragma mark Settings

- (void)setNormalColor:(UIColor *)normalColor {
    [self setBackgroundColor:normalColor];
    self._normalColor = normalColor;
}

- (void)setHighlightedColor:(UIColor *)highlightedColor {
    self._highlightedColor = highlightedColor;
}

- (void)setSelectedColor:(UIColor *)selectedColor
{
    self._selectedColor = selectedColor;
}
#pragma mark Actions

- (void)didTapButtonForHighlight:(UIButton *)sender {
    //NSLog(@"didTapButtonForHighlight");
    if (sender.selected) {
        if (self._normalColor) {
            [self setBackgroundColor:_normalColor];
        }
    }
    else{
        if (self._highlightedColor) {
            [self setBackgroundColor:_highlightedColor];
        }
    }
}

- (void)didSelectButton:(UIButton *)sender {
    //NSLog(@"didSelectButton");
    if (sender.selected) {
        [self setSelected:NO];
        
        if (self._normalColor) {
            [self setBackgroundColor:_normalColor];
        }
    }
    else{
        [self setSelected:YES];
        
        if (self._selectedColor) {
            [self setBackgroundColor:_selectedColor];
        }
    }
}

- (void)didTouchUpOutsideButton:(UIButton *)sender {
    //NSLog(@"didTouchUpOutsideButton");
    if (!sender.selected) {
        if (self._normalColor) {
            [self setBackgroundColor:_normalColor];
        }
    }
    else{
        if (self._highlightedColor) {
            [self setBackgroundColor:_highlightedColor];
        }
    }
}

- (void)didDragInsideButton:(UIButton *)sender {
    //NSLog(@"didDragInsideButton");
    if (sender.selected) {
        if (self._normalColor) {
            [self setBackgroundColor:_normalColor];
        }
    }
    else{
        if (self._highlightedColor) {
            [self setBackgroundColor:_highlightedColor];
        }
    }
}

- (void)didDragOutsideButton:(UIButton *)sender {
    //NSLog(@"didDragOutsideButton");
    if (!sender.selected) {
        if (self._normalColor) {
            [self setBackgroundColor:_normalColor];
        }
    }
    else{
        if (self._highlightedColor) {
            [self setBackgroundColor:_highlightedColor];
        }
    }
}
#pragma mark Initialization

- (void)setupButton {
    [self addTarget:self action:@selector(didTapButtonForHighlight:) forControlEvents:UIControlEventTouchDown];
    [self addTarget:self action:@selector(didSelectButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addTarget:self action:@selector(didTouchUpOutsideButton:) forControlEvents:UIControlEventTouchUpOutside];
    
    [self addTarget:self action:@selector(didDragInsideButton:) forControlEvents:UIControlEventTouchDragInside];
    [self addTarget:self action:@selector(didDragOutsideButton:) forControlEvents:UIControlEventTouchDragOutside];
}

- (id)init {
    self = [super init];
    if (self) {
        [self setupButton];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupButton];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupButton];
    }
    return self;
}

@end
