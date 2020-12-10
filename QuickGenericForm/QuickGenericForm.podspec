Pod::Spec.new do |s|
  s.name             = 'QuickGenericForm'
  s.version          = '0.1.0'
  s.summary          = 'Generic lib to create Type-Safe Forms quickly.'

  s.homepage     = 'https://github.com/frugoman'

  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Nicolas Frugoni' => 'nfrugoni19@gmail.com' }
  s.source           = { :git => 'https://github.com/frugoman/QuickGenericForm.git', :tag => s.version.to_s }

  s.swift_versions = "5.2"
  s.ios.deployment_target = '12.0'

  s.source_files = 'QuickGenericForm/Classes/**/*'
end