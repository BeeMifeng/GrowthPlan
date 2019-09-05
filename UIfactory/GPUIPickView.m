//
//  GPUIPickView.m
//  GrowthPlan
//
//  Created by lijialun on 2019/4/4.
//  Copyright © 2019年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import "GPUIPickView.h"



@interface GPUIPickView()<UIPickerViewDelegate,UIPickerViewDataSource>
@property(nonatomic,strong)UIPickerView *pickView;
@property(nonatomic,strong)UIButton *sureBtn;
@property(nonatomic,strong)UIButton *cancelBtn;

@property(nonatomic,strong)NSMutableArray *oneArr;
@property(nonatomic,strong)NSMutableArray *twoArr;
@property(nonatomic,strong)NSMutableArray *threeArr;

@property(nonatomic,strong)NSArray *dataArr;
@property(nonatomic,assign)PickType type;

@property(nonatomic,copy)NSString *seletedOne;
@property(nonatomic,copy)NSString *seletedTwo;
@property(nonatomic,copy)NSString *seletedThree;
@property(nonatomic,copy)NSString *seletedTitle;
@end

@implementation GPUIPickView

- (instancetype)initWithPickType:(PickType)type {
    self = [super init];
    self.type = type;
    
    if (self) {
        self.frame = CGRectMake(0, 0, screenWidth, screenHeight);
        self.backgroundColor = [UIColor colorFromHex:0x000 alpha:0.5];
        
        [[UIApplication sharedApplication].delegate.window addSubview:self];
        
        
        self.pickView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, screenHeight- 150, screenWidth, 150)];
        [self addSubview:self.pickView];
        self.pickView.backgroundColor = [UIColor whiteColor];
        self.pickView.delegate = self;
        self.pickView.dataSource = self;
        
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, screenHeight- 200, screenWidth, 50)];
        view.backgroundColor = [UIColor whiteColor];
        [self addSubview:view];
        
        self.cancelBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        self.cancelBtn.frame = CGRectMake(0, 0, 100, 50);
        [view addSubview:self.cancelBtn];
        [self.cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [self.cancelBtn addTarget:self action:@selector(cancelAction) forControlEvents:UIControlEventTouchUpInside];
        
        self.sureBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        self.sureBtn.frame = CGRectMake(screenWidth-100, 0, 100, 50);
        [view addSubview:self.sureBtn];
        [self.sureBtn setTitle:@"确定" forState:UIControlStateNormal];
        [self.sureBtn addTarget:self action:@selector(sureAction) forControlEvents:UIControlEventTouchUpInside];
        
        self.dataArr = @[@"",@"",@""];
        self.oneArr = [NSMutableArray new];
        self.twoArr = [NSMutableArray new];
        self.threeArr = [NSMutableArray new];
        
    }
    
    switch (type) {
        case BirthDay:
        {
                NSDate *date =[NSDate date];
                NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
                [formatter setDateFormat:@"yyyy"];
                NSInteger currentYear = [[formatter stringFromDate:date] integerValue];
            
                for (NSInteger i = 0; i < 100; i++) {
                    [self.oneArr addObject:[NSString stringWithFormat:@"%ld",currentYear - i]];
                }
            
                self.twoArr = [NSMutableArray arrayWithArray:@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",]];
            
                for (NSInteger i = 1; i < 32; i++) {
                    [self.threeArr addObject:[NSString stringWithFormat:@"%ld",(long)i]];
                }
        }
        break;
            
        case Provice:
        {
            NSData *data = [NSData dataWithContentsOfFile:gp_province_grade_info];
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            self.dataArr = dic[@"provinceAndCity"];
            for (NSDictionary *Cdic in self.dataArr) {
                [self.oneArr addObject:Cdic[@"province"]];
                self.twoArr = Cdic[@"citys"];
            }
        }
        break;
            
        default:
            break;
    }
    
    if (self.oneArr.count > 0)self.seletedOne = self.oneArr[0];
    if (self.twoArr.count > 0)self.seletedTwo = self.twoArr[0];
    if (self.threeArr.count > 0)self.seletedThree = self.threeArr[0];
    
    return self;
}


-(instancetype)initWithdataArr:(NSArray*)dataArr {
    self = [super init];
    if (self) {
        self.type = OtherPickType;
        self.frame = CGRectMake(0, 0, screenWidth, screenHeight);
        self.backgroundColor = [UIColor colorFromHex:0x000 alpha:0.5];
        
        [[UIApplication sharedApplication].delegate.window addSubview:self];
        
        
        self.pickView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, screenHeight- 150, screenWidth, 150)];
        [self addSubview:self.pickView];
        self.pickView.backgroundColor = [UIColor whiteColor];
        self.pickView.delegate = self;
        self.pickView.dataSource = self;
        
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, screenHeight- 200, screenWidth, 50)];
        view.backgroundColor = [UIColor whiteColor];
        [self addSubview:view];
        
        self.cancelBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        self.cancelBtn.frame = CGRectMake(0, 0, 100, 50);
        [view addSubview:self.cancelBtn];
        [self.cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [self.cancelBtn addTarget:self action:@selector(cancelAction) forControlEvents:UIControlEventTouchUpInside];
        
        self.sureBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        self.sureBtn.frame = CGRectMake(screenWidth-100, 0, 100, 50);
        [view addSubview:self.sureBtn];
        [self.sureBtn setTitle:@"确定" forState:UIControlStateNormal];
        [self.sureBtn addTarget:self action:@selector(sureAction) forControlEvents:UIControlEventTouchUpInside];
        
        self.oneArr = [dataArr mutableCopy];
        self.seletedOne = self.oneArr[0];
    }
    return self;
}


-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) return self.oneArr.count;
    if (component == 1) return self.twoArr.count;
    if (component == 2) return self.threeArr.count;
    return 0;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    if (self.type == Provice) return 2;
    if (self.type == BirthDay) return 3;
    return 1;
}

-(UIView*)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    
    UILabel *label = nil;
    switch (self.type) {
        case Provice:
        {
            label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, screenWidth/2, 50)];
        }
        break;
        case BirthDay:
        {
            label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, screenWidth/3, 50)];
        }
        break;
            
        default:
            label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 50)];
        break;
    }

    label.textAlignment = NSTextAlignmentCenter;
    if (component == 0) label.text = self.oneArr[row];
    if (component == 1) label.text = self.twoArr[row];
    if (component == 2) label.text = self.threeArr[row];
    return label;
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 50;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    switch (self.type) {
        case BirthDay:
        {
            if (component == 0) {
                self.seletedOne = self.oneArr[row];
            }if (component == 1) {
                self.seletedTwo = self.twoArr[row];
            }else if(component == 2){
                self.seletedThree = self.threeArr[row];
            }
        }
        break;
            
        case Provice:
        {
            if (component == 0) {
                NSDictionary *dataDic = self.dataArr[row];
                self.twoArr = dataDic[@"citys"];
                [pickerView reloadComponent:1];
                [pickerView selectRow:0 inComponent:1 animated:YES];
                self.seletedOne = self.oneArr[row];
                if (self.twoArr.count > 0) {
                    self.seletedTwo = self.twoArr[0];
                }else
                {
                    self.seletedTwo = @"";
                }
            }if (component == 1 && self.twoArr.count > 0) {
                self.seletedTwo = self.twoArr[row];
            }
        }
        break;
        default:
             self.seletedOne = self.oneArr[row];
        break;
    }
}

-(void)cancelAction {
    [self removeFromSuperview];
}

-(void)sureAction {
    if (_delegate && [_delegate respondsToSelector:@selector(didClickSure:)]) {
        
        if (self.seletedTwo) {
            
            if (self.seletedThree) {
                [_delegate didClickSure:[NSString stringWithFormat:@"%@-%@-%@",self.seletedOne,self.seletedTwo,self.seletedThree]];
            }else
            {
               [_delegate didClickSure:[NSString stringWithFormat:@"%@-%@",self.seletedOne,self.seletedTwo]];
            }
        }else
        {
          [_delegate didClickSure:[NSString stringWithFormat:@"%@",self.seletedOne]];
        }
        [self removeFromSuperview];
    }
}
@end
