//
//  Cloud.m
//  panda-run
//
//  Created by Qi He on 12-8-1.
//  Copyright (c) 2012年 Heyook. All rights reserved.
//

#import "Cloud.h"
#import "Constants.h"

@implementation Cloud

static const int NUM_CLOUDS = 3;
static NSString *clouds[NUM_CLOUDS] = {IMAGE_CLOUD1, IMAGE_CLOUD2, IMAGE_CLOUD3 };

+ (Cloud *)createCloud
{
  int randomIndex = arc4random() % NUM_CLOUDS;
  return (Cloud *)[Cloud createSpriteItemWithName:clouds[randomIndex]];
}

- (void)reset
{	
  float x = cosf( arc4random() % 10 ) * 0.10f - 0.10f;
  float h = (arc4random() % 5 * 0.025 + 0.8) * _screenHeight;
  
  self.position = CGPointMake(_screenWidth + arc4random() % 10 * 5, h );
  self.velocity = CGPointMake(x, 0);
  
  int randomIndex = arc4random() % NUM_CLOUDS;
  CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:clouds[randomIndex]];
  [self setDisplayFrame:frame];
}

- (void) update:(ccTime)delta
{
  self.position = ccpAdd(self.position, self.velocity);
	if ( [self isOutsideScreen] ){
    [self reset];
	}
}


@end
