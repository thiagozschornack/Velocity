# Velocity GP — app Android

Projeto Android Studio que empacota o jogo (pasta `app/src/main/assets/index.html`) num app nativo
em tela cheia, na horizontal, 100% offline e sem nenhuma permissão.

- Pacote: `com.empreenderthz.velocitygp`
- Versão: 3.0.0 (versionCode 1)
- Android mínimo: 7.0 (API 24) · alvo: Android 16 (API 36, exigido pela Google Play desde 31/08/2026)
- Dependência única: `androidx.webkit` (para servir o jogo por uma origem https local segura)

## 1. Abrir e testar no seu celular
1. Instale o **Android Studio** (versão recente) e abra esta pasta (`File › Open`).
2. Aguarde o Gradle sincronizar (ele baixa o Android Gradle Plugin 8.11.1 e o Gradle 8.14.3).
3. No celular: ative **Opções do desenvolvedor › Depuração USB** e conecte pelo cabo.
4. Clique em **Run ▶**. O jogo abre na horizontal.

## 2. Criar a chave de assinatura (uma vez só — guarde com muito cuidado)
No Android Studio: **Build › Generate Signed App Bundle or APK › Android App Bundle › Create new…**
- Salve como `velocitygp-upload.jks` na raiz deste projeto, alias `velocitygp`.
- Depois copie `keystore.properties.exemplo` para `keystore.properties` e preencha as senhas.
  Com isso, `./gradlew bundleRelease` já gera o arquivo assinado.

> Se perder essa chave, não conseguirá atualizar o app. Faça cópia de segurança fora do computador.
> Com a **Assinatura de apps do Google Play** (padrão), essa chave é apenas a "chave de upload" e pode ser redefinida pelo suporte do Google se necessário.

## 3. Gerar o pacote para a loja
```
./gradlew bundleRelease
```
Arquivo gerado: `app/build/outputs/bundle/release/app-release.aab`

## 4. Publicar na Google Play
1. Crie a conta em **play.google.com/console** (taxa única de US$ 25) e confirme sua identidade.
2. **Criar app** › nome "Velocity GP", idioma Português (Brasil), tipo **Jogo**, **Gratuito**.
3. Preencha **Ficha da loja principal** com os textos de `ficha-da-loja.md`, o ícone 512×512,
   o recurso gráfico 1024×500 e as capturas de tela (pasta da loja).
4. **Política de privacidade**: publique `politica-de-privacidade.html` no seu servidor e informe a URL.
5. **Conteúdo do app**: classificação indicativa (questionário IARC), público-alvo (13+),
   anúncios = Não, Segurança dos dados = não coleta nem compartilha dados.
6. **Teste** › envie o `.aab` primeiro para **Teste interno**.
   Contas pessoais criadas depois de novembro de 2023 precisam de um **teste fechado com
   pelo menos 12 testadores ativos por 14 dias seguidos** antes de liberar a produção.
7. Depois do teste, promova a versão para **Produção** e envie para revisão.

## 5. Atualizar o jogo no futuro
1. Substitua `app/src/main/assets/index.html` pela nova versão do jogo.
2. Em `app/build.gradle.kts`, aumente `versionCode` (2, 3, 4…) e ajuste `versionName`.
3. Gere novamente com `./gradlew bundleRelease` e envie o `.aab` na Play Console.

## Comportamento no celular
- Botão **Voltar**: pausa a corrida ou retorna ao menu; no menu principal, dois toques fecham o app.
- Ao sair do app, a corrida é pausada e o som para automaticamente.
- Tela sempre ligada durante o jogo; barras do sistema ocultas (deslize da borda para mostrá-las).
- Direção por **inclinação** ligada por padrão (pode trocar para botões em Ajustes).
- Controles Bluetooth funcionam sem configuração.
