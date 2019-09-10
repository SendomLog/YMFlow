#
# Be sure to run `pod lib lint YMSocket.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YMFlow'
  s.version          = '0.1.5'
  s.summary          = '基于Mars封装的Socket库。'

  s.description      = <<-DESC
    基于Mars封装的Socket库。
  DESC

  s.homepage         = 'https://github.com/SendomLog/YMFlow'
  s.license          = { type: 'MIT', file: 'LICENSE' }
  s.author           = { 'sunhongwei' => 'hongwei.sun@yimifudao.com' }
  s.source           = { git: 'https://github.com/SendomLog/YMFlow.git', tag: s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.static_framework = true
#  s.source_files = 'YMFlow/Classes/**/**{h,m,mm,cc}'
  s.public_header_files = 'YMFlow/Framework/**/*.h'
  # s.public_header_files = "YMFlow/YMFlow.framework/Headers/*.h",

  s.ios.frameworks = 'SystemConfiguration', 'CoreTelephony', 'Foundation'

  s.ios.libraries = 'z', 'resolv.9', 'c++'

  s.vendored_frameworks = 'YMFlow/Framework/*.framework'

  s.pod_target_xcconfig = { 'ENABLE_BITCODE' => 'NO' }
  
  s.user_target_xcconfig = {
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
  }
  
end
