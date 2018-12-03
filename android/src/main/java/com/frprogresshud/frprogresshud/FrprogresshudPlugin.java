package com.frprogresshud.frprogresshud;

import android.app.Activity;

import com.kaopiz.kprogresshud.KProgressHUD;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** FrprogresshudPlugin */
public class FrprogresshudPlugin implements MethodCallHandler {

  Activity activity = null;
  KProgressHUD kProgressHUD = null;

  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "frprogresshud");
    final FrprogresshudPlugin frprogresshudPlugin = new FrprogresshudPlugin();
    frprogresshudPlugin.activity = registrar.activity();
    channel.setMethodCallHandler(frprogresshudPlugin);
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    if (call.method.equals("show")) {
        if (kProgressHUD != null){
            kProgressHUD.dismiss();
        }
        kProgressHUD = KProgressHUD.create(activity)
              .setStyle(KProgressHUD.Style.SPIN_INDETERMINATE)
//              .setLabel("Please wait")
//              .setDetailsLabel("Downloading data")
//              .setCancellable(true)
              .setAnimationSpeed(2)
              .setDimAmount(0.5f)
              .show();
      result.success(null);
    }
      if (call.method.equals("dismiss")) {
          if (kProgressHUD != null){
              kProgressHUD.dismiss();
          }
          result.success(null);
      }
  }
}
