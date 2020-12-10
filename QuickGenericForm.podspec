#
# Be sure to run `pod lib lint QuickGenericForm.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'QuickGenericForm'
  s.version          = '0.1.0'
  s.summary          = 'A quick way to create Type-safe forms.'

  s.homepage         = 'https://github.com/frusoft/QuickGenericForm'

  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Nicolas Frugoni' => 'nfrugoni19@gmail.com' }
  s.source           = { :git => 'https://github.com/frusoft/QuickGenericForm.git', :tag => s.version.to_s }

  s.ios.deployment_target = '12.0'

  s.source_files = 'QuickGenericForm/Classes/**/*'
end
