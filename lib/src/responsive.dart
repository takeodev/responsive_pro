// responsive_pro.dart
//
// Responsive PRO - por Takeo + ChatGPT
// Mobile • Tablet • Web • Desktop • Ultrawide
//
// OBJETIVO
// --------
// Oferecer uma API simples e poderosa para responsividade em Flutter,
// respeitando proporções reais da tela (altura, largura e diagonal),
// com escalas adequadas para fontes, ícones, espaços e breakpoints.
//
// COMO USAR
// ---------
// import 'responsive_pro.dart';
//
// Text(
//   "Olá",
//   style: TextStyle(fontSize: context.font(4)),
// );
//
// Container(width: context.w(80), height: context.h(20));
//
// Padding(padding: EdgeInsets.all(context.space(2)));
//
// DETALHES IMPORTANTES
// ---------------------
// - Todas as medidas são baseadas em PORCENTAGEM (%).
// - Média entre height/witdh (mix) evita distorções em telas longas ou ultrawide.
// - short() é a MELHOR opção para fontes — garante consistência.
// - O plugin é seguro para mobile, tablet, web, desktop e landscape.
// - Não faz cache global propositalmente: MediaQuery pode mudar (girar tela).
// • Pode ser otimizado no futuro com cache inteligente por Frame.
//
// AUTOR RECOMENDADO PARA O PACKAGE:
// "Responsive PRO for Flutter" by Fernando Takeo Miyaji
//

import 'dart:math';
import 'package:flutter/material.dart';

/// ======================================================================================
/// Arquivo         : src/responsive.dart
/// Projeto         : Responsive Pro
/// Plataforma      : Android
/// Autor           : Fernando Takeo Miyaji
/// ======================================================================================

class Responsive {
  final MediaQueryData mq;

  // 1% da altura
  late final double hUnit;
  // 1% da largura
  late final double wUnit;

  // 1% do menor lado (ideal para fontes e ícones)
  late final double shortUnit;
  // 1% do maior lado
  late final double longUnit;

  // 1% da diagonal (ideal para imagens e elementos geométricos)
  late final double diagUnit;

  // média entre hUnit e wUnit (ideal para padding e espaçamento)
  late final double mixUnit;

  // textScaleFactor do usuário (acessibilidade)
  late final TextScaler scaleFactor;

  Responsive._(this.mq) {
    // unidades percentuais
    hUnit = mq.size.height / 100;
    wUnit = mq.size.width / 100;

    shortUnit = mq.size.shortestSide / 100;
    longUnit = mq.size.longestSide / 100;

    diagUnit =
        sqrt(mq.size.width * mq.size.width + mq.size.height * mq.size.height) /
            100;

    // equilíbrio entre altura e largura
    mixUnit = (hUnit + wUnit) / 2;

    scaleFactor = mq.textScaler;
  }

  /// Acesso padrão
  static Responsive of(BuildContext context) =>
      Responsive._(MediaQuery.of(context));

  // -----------------------------------------------------------
  //  MEDIDAS BÁSICAS: usar quando o design depende de apenas um eixo
  // -----------------------------------------------------------

  /// Retorna um valor baseado **exclusivamente na altura**.
  ///
  /// ✔ Uso recomendado:
  ///   - Telas onde a altura é o fator principal (scroll, listas, formulários).
  ///   - Espaçamentos verticais, headers, rodapés.
  ///
  /// ❌ Evitar quando:
  ///   - A largura é muito variável (telas rotacionadas ou em web desktop).
  ///   - Portrait e landscape mudam muito a proporção.
  double height(double v) => hUnit * v;

  /// Retorna um valor baseado **exclusivamente na largura**.
  ///
  /// ✔ Uso recomendado:
  ///   - Botões que ocupam percentual horizontal.
  ///   - Grids e containers proporcionais à largura.
  ///
  /// ❌ Evitar quando:
  ///   - A largura é extremamente reduzida (celular em portrait estreito).
  ///   - Elementos que também dependem da altura (imagens quadradas).
  double width(double v) => wUnit * v;

  // -----------------------------------------------------------
  // MEDIDAS INTELIGENTES (short/long/diag/mix)
  // -----------------------------------------------------------

  /// Retorna um valor baseado no **menor lado da tela** (altura ou largura).
  ///
  /// ✔ Uso recomendado:
  ///   - Ícones, fontes, bordas, paddings.
  ///   - Elementos que precisam manter proporção mesmo rotacionando o device.
  ///
  /// ❌ Evitar quando:
  ///   - Quer diferenciar realmente portrait de landscape.
  ///   - Necessita grande precisão em telas grandes (web/tablet).
  double short(double v) => shortUnit * v;

  /// Retorna um valor baseado no **maior lado da tela** (altura ou largura).
  ///
  /// ✔ Uso recomendado:
  ///   - Telas imersivas, backgrounds grandes.
  ///   - Animações que ocupam grande área.
  ///
  /// ❌ Evitar quando:
  ///   - Ajustando elementos pequenos (pode exagerar o tamanho).
  ///   - Interfaces que precisam de proporções finas.
  double long(double v) => longUnit * v;

  /// Retorna um valor baseado na **diagonal da tela** (pitagórica).
  ///
  /// ✔ Uso recomendado:
  ///   - UI proporcional entre dispositivos de tamanhos MUITO diferentes.
  ///   - Apps que precisam manter proporção em relação ao tamanho real da tela.
  ///   - Ajuste universal de fonte, ícones grandes, banners.
  ///
  /// ❌ Evitar quando:
  ///   - Layouts muito sensíveis (formularios, listas, tabelas).
  ///   - Web: monitores grandes podem distorcer a escala.
  double diag(double v) => diagUnit * v;

  /// Retorna uma média entre **altura e largura**.
  ///
  /// ✔ Uso recomendado:
  ///   - Elementos que devem variar suavemente entre portrait e landscape.
  ///   - Botões, cards, títulos, paddings e espaçamentos gerais.
  ///
  /// ❌ Evitar quando:
  ///   - Precisa precisão absoluta com base em apenas uma dimensão.
  ///   - Telas extremamente assimétricas (monitor ultrawide + responsive design).
  double mix(double v) => mixUnit * v;

  // -----------------------------------------------------------
  //  ESCALAS ESPECIALIZADAS
  // -----------------------------------------------------------

  /// Fonte responsiva.
  /// Usa short() como base e respeita acessibilidade.
  ///
  /// Bom para:
  /// - qualquer texto do aplicativo
  ///
  /// Evitar:
  /// - Não há contraindicações reais.
  double font(double v) => scaleFactor.scale(shortUnit * v);

  /// Ícones responsivos.
  /// Levemente menores que o tamanho de fonte equivalente.
  double icon(double v) => scaleFactor.scale(shortUnit * (v * 0.85));

  // -----------------------------------------------------------
  // BREAKPOINTS
  // -----------------------------------------------------------

  bool get isMobile => mq.size.width < 600;

  bool get isTablet => mq.size.width >= 600 && mq.size.width < 1024;

  bool get isDesktop => mq.size.width >= 1024 && mq.size.width < 1600;

  bool get isUltraWide => mq.size.width >= 1600;

  bool get isPortrait => mq.orientation == Orientation.portrait;

  bool get isLandscape => mq.orientation == Orientation.landscape;
}

/// EXTENSÕES PARA O CONTEXT
/// API super curta:
/// context.font(4)
/// context.h(20)
/// context.space(2)
///
extension ResponsiveExt on BuildContext {
  Responsive get _r => Responsive.of(this);

  // Medidas percentuais
  double h(double v) => _r.height(v);
  double w(double v) => _r.width(v);

  // Medidas inteligentes
  double short(double v) => _r.short(v);
  double long(double v) => _r.long(v);
  double diag(double v) => _r.diag(v);
  double mix(double v) => _r.mix(v);

  // Tipografia / Espaços / Ícones
  double font(double v) => _r.font(v);
  double icon(double v) => _r.icon(v);

  // Breakpoints
  bool get isMobile => _r.isMobile;
  bool get isTablet => _r.isTablet;
  bool get isDesktop => _r.isDesktop;
  bool get isUltraWide => _r.isUltraWide;
  bool get isLarge => _r.isDesktop || _r.isUltraWide;
  bool get isPortrait => _r.isPortrait;
  bool get isLandscape => _r.isLandscape;
}
