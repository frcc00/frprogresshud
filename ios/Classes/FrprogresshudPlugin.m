#import "FrprogresshudPlugin.h"
#import "MBProgressHUD.h"

@interface FrprogresshudPlugin(){
    MBProgressHUD *hud;
}

@end

@implementation FrprogresshudPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"frprogresshud"
            binaryMessenger:[registrar messenger]];
  FrprogresshudPlugin* instance = [[FrprogresshudPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"show" isEqualToString:call.method]) {
      if (hud != nil) {
          [hud hideAnimated:YES];
      }
      hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    result(nil);
  }
    if ([@"dismiss" isEqualToString:call.method]) {
        if (hud != nil) {
            [hud hideAnimated:YES];
        }
        result(nil);
    }
}

@end
