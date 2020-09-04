package com.example.hybrid_composition

import android.R
import android.content.Context
import android.view.View
import android.widget.ListView
import android.widget.SimpleAdapter
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

/** HybridCompositionPlugin */
class HybridCompositionPlugin: FlutterPlugin {
  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    flutterPluginBinding.platformViewRegistry.registerViewFactory("visual_display_view", HybridViewFactory())
    flutterPluginBinding.platformViewRegistry.registerViewFactory("hybrid_composition_view", HybridViewFactory())
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {}
}

class HybridView(context: Context) : PlatformView {
  val listView = ListView(context)

  init {
    val data = (0..100).map { mapOf("label" to "$it") }
    listView.adapter = SimpleAdapter(context, data, R.layout.simple_list_item_1, arrayOf("label"), intArrayOf(R.id.text1))
  }

  override fun getView(): View {
    return listView
  }

  override fun dispose() {}
}

class HybridViewFactory : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
  override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
    return HybridView(context)
  }
}
