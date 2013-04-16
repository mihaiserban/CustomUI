//
//  MSAdjustableUILabel.m
//  Adjustable character spacing UILabel for iOS
//
//  Created by Mihai Serban on 4/16/13.
//  Copyright (c) 2013 http://flavors.me/mihaiserban. All rights reserved.
//  Distribuited under MIT License
//

#import "MSAdjustableUILabel.h"

@implementation MSAdjustableUILabel

@synthesize characterSpacing;

- (id)initWithCoder:(NSCoder*)coder
{
    if (self == [super initWithCoder:coder]) {
        
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}


- (void) drawRect:(CGRect)rect
{
    
    // Drawing code
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSelectFont (context, [self.font.fontName cStringUsingEncoding:NSMacOSRomanStringEncoding], self.font.pointSize, kCGEncodingMacRoman);
    if (characterSpacing) {
        CGContextSetCharacterSpacing(context, characterSpacing);
    }
    else
    {
        CGContextSetCharacterSpacing(context, 1);
    }
    
    CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
    CGAffineTransform myTextTransform = CGAffineTransformScale(CGAffineTransformIdentity, 1.f, -1.f );
    CGContextSetTextMatrix (context, myTextTransform);
    
    // draw 1 but invisbly to get the string length.
    CGPoint p =CGContextGetTextPosition(context);
    float centeredY = (self.font.pointSize + (self.frame.size.height- self.font.pointSize)/2)-2;
    CGContextShowTextAtPoint(context, 0, centeredY, [self.text cStringUsingEncoding:NSMacOSRomanStringEncoding], [self.text length]);
    CGPoint v =CGContextGetTextPosition(context);
    
    // calculate width and draw second one.
    float width = v.x - p.x;
    float centeredX =(self.frame.size.width- width)/2;
    CGContextSetFillColorWithColor(context, [self.textColor CGColor]);
    CGContextShowTextAtPoint(context, 0, centeredY, [self.text cStringUsingEncoding:NSMacOSRomanStringEncoding], [self.text length]);
    
}
@end
