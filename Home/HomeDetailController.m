//
//  HomeDetailController.m
//  GrowthPlan
//
//  Created by 李嘉伦 on 2019/12/3.
//  Copyright © 2019 lijialun.develop.GrowthPlan. All rights reserved.
//

#import "HomeDetailController.h"
#import "GPNaviController.h"
#import "UIColor+Hex.h"
#import "TYAttributedLabel.h"
#import "TYTextStorage.h"
#import <WebKit/WebKit.h>
#import "SVProgressHUD.h"
#import "CommentView.h"
#import "GPNSdate.h"

@interface HomeDetailController ()<WKUIDelegate,WKNavigationDelegate>
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)WKWebView *webView;

@property(nonatomic,assign)CGFloat contectHeight; //scrollView 的可滑动的高度
@end

@implementation HomeDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    GPNaviController *gpNav = (GPNaviController*)self.navigationController;
    [gpNav setbackNav:self andTitle:@"返回"];
    self.contectHeight = 0;
    [SVProgressHUD showWithStatus:@"加载中……"];
    [self setupUI];
}

-(void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.hidden = NO;
    self.tabBarController.tabBar.hidden = YES;
}


-(void)loadHtmlSuccess {
    
    //评论
     UILabel *comment = [UILabel new];
     UIImageView *editImg = [UIImageView new];
    
     [self.scrollView addSubview:comment];
     [self.scrollView addSubview:editImg];
     
    
    for (NSInteger i = 0; i < _articleModel.Comments.count; i ++) {
        CommentView *cView = [CommentView new];
        [self.scrollView addSubview:cView];
        cView.tag = i + 20;
        CGFloat heigh = [GPNSdate getStringHeightWithText:_articleModel.Comments[i].comment font:[UIFont systemFontOfSize:14] viewWidth:screenWidth-40];
        self.contectHeight =  self.contectHeight + heigh + 30 + 20;
        if (i == 0) {
            [cView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(comment.mas_bottom).offset(10);
                make.left.mas_equalTo(20);
                make.width.mas_equalTo(screenWidth-40);
                make.height.mas_equalTo(heigh + 30);
            }];
            
        }else
        {
            [cView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo([self.scrollView viewWithTag:(20 + i - 1)] .mas_bottom).offset(20);
                make.left.mas_equalTo(20);
                make.width.mas_equalTo(screenWidth-40);
                make.height.mas_equalTo(heigh + 30);
            }];
        }
        [cView refreshUIWithCommentModel:_articleModel.Comments[i]];
    }
    
    [self.scrollView setContentSize:CGSizeMake(self.scrollView.contentSize.width, self.scrollView.contentSize.height + self.contectHeight + 50)];
    
    [comment mas_makeConstraints:^(MASConstraintMaker *make) {
           make.left.mas_equalTo(30);
           make.top.mas_equalTo(self.webView.mas_bottom).offset(10);
           make.width.mas_equalTo(screenWidth-60);
           make.height.mas_equalTo(30);
    }];
    
    [editImg mas_makeConstraints:^(MASConstraintMaker *make) {
           make.left.mas_equalTo(screenWidth-55);
           make.top.mas_equalTo(self.webView.mas_bottom).offset(10);
           make.width.mas_equalTo(25);
           make.height.mas_equalTo(25);
    }];
    
    
    comment.text = @"评论";
    comment.font = [UIFont systemFontOfSize:17 weight:200];
    editImg.image = [UIImage imageNamed:@"change"];
}

-(void)setupUI {
    self.scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    UILabel *title = [UILabel new];
    UILabel *time = [UILabel new];
    UIImageView *likeImg = [UIImageView new];
    UILabel *likeNum = [UILabel new];
    UIImageView *shareImg = [UIImageView new];
    UIView *lineView = [UIView new];
    
    //webview
    
    //js脚本
    NSString *jScript = @"var meta = document.createElement('meta');meta.setAttribute('name', 'viewport');meta.setAttribute('content', 'width=device-width');document.getElementsByTagName('head')[0].appendChild(meta); var imgs = document.getElementsByTagName('img');for (var i in imgs){imgs[i].style.maxWidth='100%';imgs[i].style.height='auto';}";

    //注入
    WKUserScript *wkUScript = [[WKUserScript alloc] initWithSource:jScript injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
    WKUserContentController *wkUController = [[WKUserContentController alloc] init];
    [wkUController addUserScript:wkUScript];
    //配置对象
    WKWebViewConfiguration *wkWebConfig = [[WKWebViewConfiguration alloc] init];
    wkWebConfig.userContentController = wkUController;
    // 创建设置对象
    WKPreferences *preference = [[WKPreferences alloc]init];
    // 设置字体大小(最小的字体大小)
    preference.minimumFontSize = 18 ;
    wkWebConfig.preferences = preference;
    
    self.webView = [[WKWebView alloc]initWithFrame:CGRectMake(20, 100, screenWidth-40, 0) configuration:wkWebConfig];
    
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:title];
    [self.scrollView addSubview:time];
    [self.scrollView addSubview:likeImg];
    [self.scrollView addSubview:likeNum];
    [self.scrollView addSubview:shareImg];
    [self.scrollView addSubview:lineView];
    [self.scrollView addSubview:self.webView];
  
    
    //布局
    //scrollview里面直接布局label，如字符串太长会直接撑开contentSize title 用绝对定位
    [title setFrame:CGRectMake(25, 10, screenWidth-50, 50)];
    
    [time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
        make.top.mas_equalTo(title.mas_bottom).offset(5);
        make.height.mas_equalTo(15);
        make.width.mas_equalTo(100);
    }];
    
    [shareImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(screenWidth - 48);
        make.top.mas_equalTo(title.mas_bottom).offset(5);
        make.height.mas_equalTo(18);
        make.width.mas_equalTo(18);
    }];
    
    [likeNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(shareImg.mas_left).offset(-5);
        make.top.mas_equalTo(title.mas_bottom).offset(6.5);
        make.height.mas_equalTo(15);
        make.width.mas_equalTo(50);
    }];
    
    
    [likeImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(likeNum.mas_left).offset(-3);
        make.top.mas_equalTo(title.mas_bottom).offset(5);
        make.height.mas_equalTo(18);
        make.width.mas_equalTo(18);
    }];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
        make.top.mas_equalTo(time.mas_bottom).offset(10);
        make.width.mas_equalTo(screenWidth-60);
        make.height.mas_equalTo(.5);
    }];
   
   
    
    //设置属性
    title.text = self.articleModel.title;
    title.textColor = [UIColor colorFromHex:0x333333 alpha:1.0];
    title.numberOfLines = 0;
    title.font = [UIFont systemFontOfSize:17];
    
    time.text = [self.articleModel.updateTime substringToIndex:10];
    time.textColor = [UIColor colorFromHex:0x999999 alpha:1.0];
    time.font = [UIFont systemFontOfSize:15];
    
    likeNum.text = self.articleModel.likeCount;
    likeNum.textColor = [UIColor colorFromHex:0x999999 alpha:1.0];
    likeNum.font = [UIFont systemFontOfSize:15];
    
    likeImg.image = [UIImage imageNamed:@"support"];
    shareImg.image = [UIImage imageNamed:@"share"];
    
    lineView.backgroundColor = [UIColor colorFromHex:0xE3E3E3 alpha:1.0];
    
    CGRect frame = self.webView.frame;
    frame.size.height = 0;
    self.webView.frame = frame;
    self.webView.scrollView.scrollEnabled = NO;
    [self.webView loadHTMLString:self.articleModel.content baseURL:nil];
    self.webView.navigationDelegate = self;
    self.webView.UIDelegate = self;
    
    
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
    [webView evaluateJavaScript:@"document.body.scrollHeight" completionHandler:^(id _Nullable result,NSError *_Nullable error) {
        
        [SVProgressHUD dismiss];
        //获取页面高度
        CGFloat scrollHeight = [result doubleValue];
        self.webView.frame = CGRectMake(self.webView.frame.origin.x, self.webView.frame.origin.y, self.webView.frame.size.width, scrollHeight);
        [self.scrollView setContentSize:CGSizeMake(screenWidth, scrollHeight + 200)];
        [self loadHtmlSuccess];
    }];
    
    
}

@end
