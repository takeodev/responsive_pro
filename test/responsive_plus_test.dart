import 'package:flutter_test/flutter_test.dart';
import 'package:responsive_plus/responsive_plus.dart';
import 'package:responsive_plus/responsive_plus_platform_interface.dart';
import 'package:responsive_plus/responsive_plus_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockResponsivePlusPlatform
    with MockPlatformInterfaceMixin
    implements ResponsivePlusPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ResponsivePlusPlatform initialPlatform = ResponsivePlusPlatform.instance;

  test('$MethodChannelResponsivePlus is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelResponsivePlus>());
  });

  test('getPlatformVersion', () async {
    ResponsivePlus responsivePlusPlugin = ResponsivePlus();
    MockResponsivePlusPlatform fakePlatform = MockResponsivePlusPlatform();
    ResponsivePlusPlatform.instance = fakePlatform;

    expect(await responsivePlusPlugin.getPlatformVersion(), '42');
  });
}
