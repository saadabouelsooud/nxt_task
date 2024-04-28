package com.example.task

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import com.google.android.material.bottomsheet.BottomSheetDialog
import android.view.WindowManager
import android.widget.TextView

class MainActivity: FlutterActivity() {
    private val CHANNEL = "native_channel"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "showBottomSheet") {
                // get parameters from flutter
                val body = call.argument<String>("body")
                val output = showBottomSheetFromNative(body)
                result.success(output)
            } else {
                result.notImplemented()
            }
        }
    }

    private fun showBottomSheetFromNative(body: String?): Boolean {
        val bottomSheetDialog = BottomSheetDialog(this)
        val view = layoutInflater.inflate(R.layout.bottom_sheet_layout, null)
        bottomSheetDialog.setContentView(view)
    
        val textView = view.findViewById<TextView>(R.id.bottom_sheet_text)
        textView.text = body


        // Set the height to be 25% of the screen height
        val height = resources.displayMetrics.heightPixels
        val layoutParams = WindowManager.LayoutParams()
        layoutParams.copyFrom(bottomSheetDialog.window?.attributes)
        layoutParams.height = (height * 0.25).toInt()
        bottomSheetDialog.window?.attributes = layoutParams
    
        bottomSheetDialog.show()
        return true
    }
}
