# Mantém a ponte JavaScript usada pelo jogo (botão "Sair do jogo")
-keepclassmembers class com.empreenderthz.velocitygp.MainActivity$Bridge {
    @android.webkit.JavascriptInterface <methods>;
}
