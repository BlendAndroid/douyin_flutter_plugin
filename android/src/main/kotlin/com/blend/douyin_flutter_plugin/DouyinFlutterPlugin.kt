package com.blend.douyin_flutter_plugin

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** DouyinFlutterPlugin */
class DouyinFlutterPlugin : FlutterPlugin, MethodCallHandler {

    // Flutter 和原生 Android 之间通信的 MethodChannel
    private lateinit var channel: MethodChannel

    // 向 Flutter引擎 注册插件
    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "douyin_flutter_plugin")
        // 注册 MethodCallHandler 的回调
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        if (call.method == "getPlatformVersion") {
            result.success("Android ${android.os.Build.VERSION.RELEASE}")
        } else {
            result.notImplemented()
        }
    }

    // 从 Flutter引擎 注销插件
    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
