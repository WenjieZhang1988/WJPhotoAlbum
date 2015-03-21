//
//  ViewController.m
//  WJPhotoAlbum
//
//  Created by Kevin on 15/3/21.
//  Copyright (c) 2015年 Kevin. All rights reserved.
//

#import "ViewController.h"
#import "WJLayout.h"
#import "WJImageCell.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

/** 所有的图片名 */
@property (strong, nonatomic) NSMutableArray *images;
/** 九宫格 */
@property (weak, nonatomic) UICollectionView *collectionView;

@end

@implementation ViewController

static NSString *const ID = @"image";

/**
 *  懒加载
 *
 *  @return 所有图片名
 */
- (NSMutableArray *)images {
    if (_images == nil) {
        self.images = [[NSMutableArray alloc] init];
        for (int i = 1; i <= 20; i++) {
            [self.images addObject:[NSString stringWithFormat:@"%i", i]];
        }
    }
    return _images;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建布局
    WJLayout *layout = [[WJLayout alloc] init];
    // 创建 collectionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 200) collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor lightGrayColor];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [collectionView registerNib:[UINib nibWithNibName:@"WJImageCell" bundle:nil] forCellWithReuseIdentifier:ID];
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
}

#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WJImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    cell.image = self.images[indexPath.item];
    return cell;
}

@end
