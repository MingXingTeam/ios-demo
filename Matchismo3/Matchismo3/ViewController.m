//
//  ViewController.m
//  Matchismo3
//
//  Created by maomao on 15/3/17.
//  Copyright (c) 2015年 ths. All rights reserved.
//
/*
 
 游戏控制器
 
 */
#import "ViewController.h"
#import "PlayingCardDeck.h"//增加了耦合性 导致这个视图控制器只能玩牌的匹配游戏
#import "CardMatchingGame.h"

@interface ViewController ()

//之所以是weak是因为当view被释放时 我们希望这个UILabel也从堆中释放
//这里采用了outlet机制
//@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
//翻牌的次数
//@property (nonatomic) int flipCount;
//牌堆
@property (nonatomic,strong) Deck *deck;
//游戏
@property (nonatomic,strong) CardMatchingGame *game;//有些人喜欢用gameModel或者Model 但是老头子觉得不好
//考虑一下为什么这里必须是strong
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@end

@implementation ViewController

- (CardMatchingGame *)game{
    if(!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    return _game;
}

//重写setter方法 惰性实例化
//- (Deck *)deck{
//    if(!_deck) _deck = [self createDeck];
//    return _deck;
//}

- (Deck *)createDeck{
    return [[PlayingCardDeck alloc] init];
}

//重写setter方法。使UI更新和属性同步。
//- (void)setFlipCount:(int)flipCount{
//    _flipCount = flipCount;
//    self.flipsLabel.text = [NSString stringWithFormat:@"Flips:%d",self.flipCount];
//    NSLog(@"flipCount = %d",self.flipCount);
//}

//实际上这个方法返回void。之所以用IBAction（IBAction被typedef类型定义为void）是为了区别这是目标动作函数
//这里采用了目标动作机制
- (IBAction)touchCardButton:(UIButton *)sender {
    //会自动从图像资源中找名为cardback的图片 实际上会根据你的屏幕分辨率自动给合适分辨率的图
//    UIImage *cardImage = [UIImage imageNamed:@"cardback"]; 去掉局部变量 精简代码
    //sender是按钮 发送消息的人
    //forState是让指明按钮的状态：比如默认、禁用、高亮等
    //说明文档中的retain的意思就是strong的意思
    //按住option键点击方法 弹出说明文档框 双击方法则直接跳到说明文档中。
//    if([sender.currentTitle length]){
//        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
//                      forState:UIControlStateNormal];//虽然会自动换行，但是当参数名较长时，按回车键会以冒号自动对齐更好。
//        [sender setTitle:@"" forState:UIControlStateNormal];
//        self.flipCount++;//同时调用了setter和getter
//    }else{
//        Card *card = [self.deck drawRandomCard];
//        if(card){
//            [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
//                          forState:UIControlStateNormal];//虽然会自动换行，但是当参数名较长时，按回车键会以冒号自动对齐更好。
//            [sender setTitle:card.contents forState:UIControlStateNormal];
//        }
//        self.flipCount++;//同时调用了setter和getter
//    }
    
    //获取发送消息的按钮的索引
    NSUInteger cardIndex = [self.cardButtons indexOfObject:sender];
    //选择牌
    [self.game chooseCardAtIndex:cardIndex];
    //更新UI,模型和视图同步更新
    [self updateUI];
}

- (void)updateUI{
    for(UIButton *cardButton in self.cardButtons){
        NSUInteger cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score:%ld",(long)self.game.score];
}

//注意OC方法的命名方式：最后一个单词总是提示使用者参数是什么。比如这里是Card
- (NSString *)titleForCard:(Card *)card{
    return card.isChosen ? card.contents:@"";
}

//注意OC方法的命名方式：最后一个单词总是提示使用者参数是什么。比如这里是Card
- (UIImage *)backgroundImageForCard:(Card *)card{
    return [UIImage imageNamed:card.isChosen?@"cardfront":@"cardback"];
}

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view, typically from a nib.
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

@end
