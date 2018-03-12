//
//  MoreChooseView.m
//  PopView
//
//  Created by 李林 on 2018/3/9.
//  Copyright © 2018年 李林. All rights reserved.
//

#import "MoreChooseView.h"
#import "PopSliderBelowStaticVar.h"
#import "PopView.h"

@implementation MoreChooseItemModel
@end

@implementation MoreChooseDataModel
@end



@interface MoreChooseViewCellectionCell:UICollectionViewCell
@property (nonatomic ,strong) UIButton *btn;
@property (nonatomic ,strong) MoreChooseItemModel *itemModel;

@end
@implementation MoreChooseViewCellectionCell
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.btn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btn.frame = self.bounds;
        [self.contentView addSubview:self.btn];
        [self.btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [self.btn setTitleColor:[UIColor greenColor] forState:UIControlStateSelected];
        [self.btn setImage:nil forState:UIControlStateNormal];
        [self.btn setImage:[UIImage imageNamed:@"selected_icon"] forState:UIControlStateSelected];
        self.btn.titleLabel.font = [UIFont systemFontOfSize:13];
        self.btn.layer.cornerRadius = 3;
        self.btn.layer.borderColor = [UIColor greenColor].CGColor;
        self.btn.userInteractionEnabled = NO;
        [self.btn setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
    }
    return self;
}
- (void)setItemModel:(MoreChooseItemModel *)itemModel{
    _itemModel = itemModel;
    [self.btn setTitle:itemModel.itemName forState:UIControlStateNormal];
    self.btn.selected = itemModel.seleted;
    self.btn.layer.borderWidth = itemModel.seleted ? 0.5 : 0;
    self.btn.backgroundColor = itemModel.seleted ? [UIColor colorWithRed:237.0/255 green:251.0/255 blue:238.0/255 alpha:1]  : [UIColor colorWithRed:246.0/255 green:246.0/255 blue:246.0/255 alpha:1];
}
@end

@interface MoreChooseView()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic ,strong)UICollectionView *collectionView;
@property(nonatomic ,strong) UIView *toolView;
@property(nonatomic ,strong) NSArray<MoreChooseDataModel *> *dataArr;
@property(nonatomic ,strong) UICollectionViewFlowLayout *layout;
@end

@implementation MoreChooseView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.toolView];
        [self addSubview:self.collectionView];
    }
    return self;
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.dataArr.count;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSArray *items = [self.dataArr objectAtIndex:section].items;
    return items.count;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MoreChooseViewCellectionCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"MoreChooseViewCellectionCell" forIndexPath:indexPath];
    cell.itemModel = [[self.dataArr objectAtIndex:indexPath.section].items objectAtIndex:indexPath.row];
    return cell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionReusableView *view=[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"CollectionReusableView" forIndexPath:indexPath];
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UILabel *label = [view viewWithTag:11];
        if (label == nil) {
            label = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, 100, 60)];
            label.tag = 11;
            [view addSubview:label];
            label.textColor = [UIColor darkGrayColor];
            label.font = [UIFont systemFontOfSize:15];
        }
        label.text = [self.dataArr objectAtIndex:indexPath.section].type;
    }else{
        UIView *lineView = [view viewWithTag:12];
        if (lineView == nil) {
            lineView = [[UIView alloc]initWithFrame:CGRectMake(15, 0, self.bounds.size.width - 30, 0.5)];
            lineView.tag = 12;
            [view addSubview:lineView];
        }
        if (indexPath.section == self.dataArr.count-1) {
            lineView.backgroundColor = [UIColor clearColor];
        }else{
            lineView.backgroundColor = segmentingLineColor;
        }
    }
    return view;
}


//头部试图的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(50, 60);
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return CGSizeMake(50, 1);
}

//设置每个item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat col = 4;
    CGFloat itemWidth = (self.bounds.size.width - self.layout.sectionInset.left - self.layout.sectionInset.right - (col-1)*self.layout.minimumInteritemSpacing)/col;
    return CGSizeMake(itemWidth, 30);
}


//cell的点击事件
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //cell被电击后移动的动画
    MoreChooseDataModel *sectionItems = [self.dataArr objectAtIndex:indexPath.section];
    MoreChooseItemModel *item = [sectionItems.items objectAtIndex:indexPath.row];
    if (sectionItems.radio) {
        for (MoreChooseItemModel *item in sectionItems.items) {
            item.seleted = NO;
        }
    }
    item.seleted = !item.seleted;
    [self.collectionView reloadData];
}

- (void)resetClick{
    for (MoreChooseDataModel *sectionsModel in self.dataArr) {
        for (MoreChooseItemModel *model in sectionsModel.items) {
            model.seleted = NO;
        }
    }
    [self.collectionView reloadData];
}

- (void)sureClick{
    [PopView hidenPopView];
}

- (UIView *)toolView{
    if (_toolView == nil) {
        _toolView = [[UIView alloc] initWithFrame:CGRectMake(0, self.bounds.size.height - 60, self.bounds.size.width, 60)];
        UIButton *resetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [resetBtn setTitle:@"重置" forState:UIControlStateNormal];
        [resetBtn addTarget:self action:@selector(resetClick) forControlEvents:UIControlEventTouchUpInside];
        CGFloat margin = 10;
        resetBtn.frame = CGRectMake(margin, margin, self.bounds.size.width/2 - 2*margin, _toolView.bounds.size.height - 2*margin);
        resetBtn.backgroundColor = [UIColor colorWithRed:245.0/255 green:245.0/255 blue:245.0/255 alpha:1];
        [resetBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [_toolView addSubview:resetBtn];
        resetBtn.layer.cornerRadius = 2;
        
        UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [sureBtn setTitle:@"确定" forState:UIControlStateNormal];
        [sureBtn addTarget:self action:@selector(sureClick) forControlEvents:UIControlEventTouchUpInside];
        sureBtn.frame = CGRectMake(self.bounds.size.width/2 + margin, margin, self.bounds.size.width/2 - 2*margin, _toolView.bounds.size.height - 2*margin);
        sureBtn.backgroundColor = [UIColor colorWithRed:99/255.0 green:213/255.0 blue:99/255.0 alpha:1];;
        [_toolView addSubview:sureBtn];
        sureBtn.layer.cornerRadius = 2;
        
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, segmentingLineHeight)];
        [_toolView addSubview:lineView];
        lineView.backgroundColor = segmentingLineColor;
    }
    return _toolView;
}

- (UICollectionView *)collectionView{
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumInteritemSpacing = 10;
        layout.minimumLineSpacing = 15;
        layout.sectionInset = UIEdgeInsetsMake(0, 15, 20, 15);
        self.layout = layout;
        
        
        _collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height - self.toolView.bounds.size.height) collectionViewLayout:layout];
        _collectionView.backgroundColor=[UIColor whiteColor];
        _collectionView.delegate=self;
        _collectionView.dataSource=self;
        [_collectionView registerClass:[MoreChooseViewCellectionCell class] forCellWithReuseIdentifier:@"MoreChooseViewCellectionCell"];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CollectionReusableView"];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"CollectionReusableView"];

    }
    return _collectionView;
}

- (NSArray<MoreChooseDataModel *> *)dataArr{
    if (_dataArr == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"moreFilter" ofType:@"plist"];
        NSArray *arr = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *dataArr = [[NSMutableArray alloc] init];
        for (NSDictionary *sectionDict in arr) {
            MoreChooseDataModel *sections = [[MoreChooseDataModel alloc] init];
            sections.type = sectionDict[@"type"];
            sections.radio = [sectionDict[@"radio"] boolValue];
            NSArray *items = sectionDict[@"items"];
            NSMutableArray *itemsArr = [[NSMutableArray alloc] init];
            for (NSDictionary *itemDict in items) {
                MoreChooseItemModel *item = [[MoreChooseItemModel alloc] init];
                item.itemName = itemDict[@"itemName"];
                item.seleted = [itemDict[@"seleted"] boolValue];
                [itemsArr addObject:item];
            }
            sections.items = itemsArr;
            [dataArr addObject:sections];
        }
        _dataArr = dataArr;
    }
    return _dataArr;
}
@end
