package com.example.iba_course
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel


class MainActivity: FlutterActivity() {
    private val CHANNEL = "samples.flutter.dev/battery"
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
      MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
      call, result ->
      if (call.method == "getBatteryLevel") {
          result.success(20);
      }
      else if(call.method == "addNmbers") {
          val sum: Int =  addNumbers(call)
              result.success(hashMapOf(
                  "Sum" to sum,
              ));
      }
      else{
      //result.error("UNAVAILABLE", "Battery level not available.", null)
          result.notImplemented()
     }
     }


    }
    private fun addNumbers(call: MethodCall): Int {
        val args = call.arguments as Map<String, Any>
        val a = args["n1"] as Int;
        val b = args["n2"] as Int;
        val c = args["n3"] as Int;
        val sum: Int = a + b + c;
        return sum;
    }
}
