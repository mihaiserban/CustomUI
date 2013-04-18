//
//  MSBackgroundColorUIButton.h
//  Customizable uibutton with background color for state
//
//  Created by Mihai Serban on 4/19/13.
//  Copyright (c) 2013 http://flavors.me/mihaiserban. All rights reserved.
//  Distribuited under MIT License
//

#import <UIKit/UIKit.h>

@interface MSBackgroundColorUIButton : UIButton

- (void)setNormalColor:(UIColor *)normalColor;
- (void)setHighlightedColor:(UIColor *)highlightedColor;
- (void)setSelectedColor:(UIColor *)selectedColor;
@end
