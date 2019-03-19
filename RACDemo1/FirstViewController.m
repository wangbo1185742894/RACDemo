//
//  FirstViewController.m
//  RACDemo
//
//  Created by 阿兹尔 on 3/10/19.
//  Copyright © 2019 王博. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UITextField *tf1;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RACCommand *racCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            NSLog(@"input___%@",input);
            [subscriber sendNext:@"lalal1"];
            return [RACDisposable disposableWithBlock:^{
                NSLog(@"销毁了");
            }];
        }];
    }];
    
    
    
    [racCommand .executionSignals.switchToLatest  subscribeNext:^(id  _Nullable x) {
        
        NSLog(@"executionSignals subscribeNext_____%@",x);
    }];
    
    [[racCommand.executing skip:1] subscribeNext:^(NSNumber * _Nullable x) {
        NSLog(@"executing subscribeNext____%@",x);
        
    }];
    
   
    
    [racCommand execute:@(0)];
    
    
//    RACSubject *subject = [RACSubject subject];
//
//    [subject subscribeNext:^(NSString *  _Nullable x) {
//        NSLog(@"%@",x);
//    }];
//
//    [subject sendNext:@"lala"];
//    [subject sendCompleted];
//
//    return;
    
//    __weak __typeof__(self) weakSelf = self;
//
//    [[_btn1 rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
//        [weakSelf.btn1  setTitle:@"lalalla" forState:UIControlStateNormal];
//    }];
//
//
//    [RACObserve(_btn1, currentTitle)subscribeNext:^(id  _Nullable x) {
//        NSLog(@"_btn.currentTitle 改变了%@",x);
//    }];
//
//
//    [[self rac_signalForSelector:@selector(textFieldDidEndEditing:) fromProtocol:@protocol(UITextFieldDelegate) ]subscribeNext:^(RACTuple * _Nullable x) {
//        NSLog(@"%@",x);
//    }];
//    _tf1.delegate = self;
//
//    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UIKeyboardDidHideNotification object:nil]subscribeNext:^(NSNotification * _Nullable x) {
//        NSLog(@"%@",x);
//    }];
//
//    [[self.tf1.rac_textSignal filter:^BOOL(NSString * _Nullable value) {
//
//        return YES;
//    }] subscribeNext:^(NSString * _Nullable x) {
//
//    }];;
////    [[RACSignal interval:2 onScheduler:[RACScheduler mainThreadScheduler]] subscribeNext:^(NSDate * _Nullable x) {
////        NSLog(@"%@",x);
////    }];
////
////    [[RACSignal interval:3 onScheduler:[RACScheduler schedulerWithPriority:RACSchedulerPriorityHigh]] subscribeNext:^(NSDate * _Nullable x) {
////
////    }];
//
//
//    NSArray *list = @[@"123",@"234",@"345",@"456"];
//    [list.rac_sequence.signal subscribeNext:^(id  _Nullable x) {
//        NSLog(@"%@",x);
//    }];
//
//    RACSignal  * signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
//        [subscriber sendNext:@"信号测试"];
//        NSError *error = [NSError errorWithDomain:NSURLErrorDomain code:1001 userInfo:nil];
//        [subscriber sendError:error];
//
//       return  [RACDisposable disposableWithBlock:^{
//            NSLog(@"销毁了");
//        }];
//    }];
//
//    [signal subscribeNext:^(id  _Nullable x) {
//
//    }];
//
//
//
//    @weakify(self)
//    // 1创建信号
//    RACSignal *signal1 = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
//        //4 发送信号
//        @strongify(self)
//        [subscriber sendNext:@"测试信号"];
//        NSError *error = [NSError errorWithDomain:NSURLErrorDomain code:1001 userInfo:nil];
//        // 发送错误信号
//        [subscriber sendError:error];
//
//        return [RACDisposable disposableWithBlock:^{
//
//        }];
//    }];
//
//
////    2 接受信号
//    [signal1 subscribeNext:^(id  _Nullable x) {
//
//    }];
////    接受错误信号
//    [signal1 subscribeError:^(NSError * _Nullable error) {
//
//    }];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.tf1 resignFirstResponder];
}

@end
