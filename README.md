# responsive_pro

[![pub package](https://img.shields.io/pub/v/responsive_pro?color=blue)](https://pub.dev/packages/responsive_pro)
[![likes](https://img.shields.io/pub/likes/responsive_pro)](https://pub.dev/packages/responsive_pro/score)
[![pub points](https://img.shields.io/pub/points/responsive_pro)](https://pub.dev/packages/responsive_pro/score)

<p align="center">
  <a href="https://www.takeodev.com/">
    <img src="https://www.takeodev.com/files/logo_takeo.png" alt="Desenvolvedor Takeo" width="120">
  </a>
</p>

---

**responsive_pro** é um plugin Flutter, 100% Dart que fornece utilidades
avançadas de responsividade, escalonamento de fonte e adaptação
automática de layouts para todas as plataformas suportadas pelo Flutter
(Android, iOS, Web, Windows, macOS e Linux).

> ⚠️ *Dart-only plugin* --- não utiliza código nativo.

---

## <span id="sumario"></span> 📘 Sumário

- [Sobre](#1-sobre)
- [Instalação](#2-instalacao)
- [Como Utilizar](#3-uso)
    - [Importação](#3-1-importacao)
    - [Bases de Redimensionamento](#3-2-bases)
- [Exemplos de Uso](#4-exemplos)
    - [Container Responsivo](#4-1-container)
    - [Texto Responsivo](#4-2-texto)
    - [Ícone Responsivo](#4-3-icone)
    - [Espaçamento / Padding](#4-4-padding)
    - [Utilitários](#4-5-utilitarios)
- [Notas Importantes](#5-notas-importantes)
- [Desenvolvedor](#6-desenvolvedor)
- [Licença](#7-licenca)
- [Contribuições](#8-contribuicao)

---

## <span id="1-sobre"></span> 🎯 Sobre

O objetivo do **responsive_pro** é simplificar a criação de interfaces
adaptáveis, permitindo:

- Ajuste automático de tamanho de fontes
- Cálculo de proporções responsivas
- Adaptação a telas pequenas, médias e grandes
- Uso consistente em mobile, web e desktop

Ideal para projetos que precisam se comportar bem em diferentes tamanhos
de tela sem depender de bibliotecas pesadas.

---

## <span id="2-instalacao"></span> 📦 Instalação

No `pubspec.yaml`:

``` yaml
dependencies:
  responsive_pro: ^1.2.1
```

Ou Execute:

``` bash
flutter pub add responsive_pro
```

Em seguida Execute:

``` bash
flutter pub get
```

---

## <span id="3-uso"></span> 🚀 Como Utilizar

### <span id="3-1-importacao"></span> Importação

``` dart@
import 'package:responsive_pro/responsive_pro.dart';
```

### <span id="3-2-bases"></span> 📚 Bases de Redimensionamento

Substitua qualquer valor **double** que necesside de responsividade por:

| Como Utilizar      | Base                         | Recomendação de Uso             |
|--------------------|------------------------------|---------------------------------|
| `context.h(v)`     | Altura da Tela               | Dimensão Vertical               |
| `context.w(v)`     | Largura da Tela              | Dimensão Horizontal             |
| `context.short(v)` | Menor Lado da Tela           | Texto, ícones, paddings         |
| `context.long(v)`  | Maior Lado da Tela           | Efeitos Tela Cheia (fullscreen) |
| `context.diag(v)`  | Diagonal da Tela (Pitágoras) | Proportional ao Dispositivo     |
| `context.mix(v)`   | Média da Altura x Largura    | Padding, UI Balanceado          |
| `context.space(v)` | Média da Altura x Largura    | Padding, SizedBox de Espaço     |
| `context.font(v)`  | Menor Lado + Accessibilidade | Texto Responsivo                |
| `context.icon(v)`  | Menor Lado + Accessibilidade | Ícone Responsivo                |

---

## <span id="4-exemplos"></span> 🔧 Exemplos de Uso

### <span id="4-1-container"></span> 📏 Container Responsivo

``` dart@
Container(
  width: context.w(80),
  height: context.h(20),
  child: ...
);
```

### <span id="4-2-texto"></span> 🔤 Texto Responsivo

``` dart@
Text(
  "Olá",
  style: TextStyle(fontSize: context.font(4)),
);
```

### <span id="4-3-icone"></span> 🔣 Ícone Responsivo

```dart@
Icon(
  Icons.home,
  size: context.icon(4),
);
```

### <span id="4-4-padding"></span> 📐 Espaçamento / Padding

```dart@
Padding(
  padding: EdgeInsets.all(context.mix(2)),
  child: ...
);
```

---

### <span id="4-5-utilitarios"></span> 🖥 Utilitários

Cada uma das opções abaixo retorna um valor **boolean** e verifica a dimensão da tela para o
resultado:

```dart@
if (context.isMobile) ... // Verifica se é Celular / Mobile
if (context.isTablet) ... // Verifica se é Tablet
if (context.isDesktop) ... // Verifica se é Desktop
if (context.isUltraWide) ... // Verifica se é Ultra Wide
if (context.isLarge) ... // Verifica se é uma Tela Larga (Destktop >)
if (context.isPortrait) ... // Verifica se está em Modo Retrato
if (context.isLandscape) ... // Verifica se está em Modo Paisagem
```

---

## <span id="5-notas-importantes"></span> 📝 Notas Importantes

- Funciona em **todas as plataformas Flutter**.
- Não depende de código nativo.
- Não precisa de permissões ou configurações adicionais.
- Ideal para apps que exigem adaptação automática de UI.

---

## <span id="6-desenvolvedor"></span> 👨‍💻 Desenvolvedor

<p align="center">
  <a href="https://www.takeodev.com/">
    <img src="https://www.takeodev.com/files/foto_takeo.png" width="120" height="120" alt="Foto de Perfil">
  </a>
  <br>
  <b>Fernando Takeo Miyaji</b>
</p>

---

## <span id="7-licenca"></span> ⚖️ Licença

MIT © 2026 **Fernando Takeo Miyaji**

---

## <span id="8-contribuicao"></span> ⭐ Contribuições

Pull Requests são sempre Bem Vindos!  
Se você gostou desse package, considere dar um *Like* no **pub.dev** ou no *
*[GitHub](https://github.com/takeodev)**.