//
//  ViewController.m
//  Instakilo
//
//  Created by Arsalan Vakili on 2015-06-25.
//  Copyright (c) 2015 Arsalan Vakili. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"
#import "HeaderView.h"

@interface ViewController (){
//    NSArray *arrayOfImages1, *arrayofImages2, *arrayofImages3;
//    NSArray *arrayOfDescriptions1, *arrayOfDescription2, *arrayOfDescription3;
    
    NSArray *arrayOfImages;
    NSArray *arrayOfDescriptions;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self myCollectionView] setDataSource:self ];
    [[self myCollectionView ] setDelegate:self];
//    arrayOfImages1= @[@"image-1", @"image-2", @"image-5"];
//    arrayofImages2= @[@"image-6",@"image-3", @"image-10", @"image-4"];
//    arrayofImages3 = @[@"image-7", @"image-8",@"image-9"];
//    arrayOfDescriptions1= @[@"pretty",@"outstanding", @"wow", @"great"];
//    arrayOfDescription2= @[@"no-way",@"unbelievable", @"great", @"beauty"];
//    arrayOfDescription3= @[@"ok!!1", @"fruity", @"unspeakable"];
    
    arrayOfImages= [NSArray alloc] initWithArray:[@[@"image-1", @"image-2", @"image-5"], @[@"image-6",@"image-3]]
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return  3;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [arrayOfImages1 count];
   
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    HeaderView *header= [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
    header.headerLabel.text= @"Section Title";
    
    NSString *myString;
    switch (indexPath.section) {
        case 0:
            myString= @"nature Photos";
            break;
         case 1:
            myString= @"dream photos";
            
         case 2:
            myString= @"decent Photos";
            break;
            
        default:
            break;
    }
    
    header.headerLabel.text= myString;
    
    return header;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cell";
    CustomCell *cell= [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
   // NSString *myString;
    
    switch (indexPath.section) {
        case 0:
            [[cell myImage] setImage: [UIImage imageNamed:[arrayOfImages1 objectAtIndex:indexPath.item]]];
             [[cell photoDescription] setText:[arrayOfDescriptions1 objectAtIndex:indexPath.item]];
            break;
            
        case 1:
            [[cell myImage] setImage:[ UIImage imageNamed:[arrayofImages2 objectAtIndex:indexPath.item]]];
            [[cell photoDescription] setText:[arrayOfDescription2 objectAtIndex:indexPath.item]];
            break;
            
        case 2:
            [[cell myImage] setImage:[ UIImage imageNamed:[arrayofImages3 objectAtIndex:indexPath.item]]];
            [[cell photoDescription] setText:[arrayOfDescription3 objectAtIndex:indexPath.item]];
            
            break;
        default:
            break;
    }
    ;
    
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
