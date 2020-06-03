#
# Be sure to run `pod lib lint RQKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RQKit'
  s.version          = '0.1.6'
  s.summary          = 'A collection of iOS components'
  s.description      = 'RQKit is personal development kit'

  s.homepage         = 'https://github.com/CoderXie/RQKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'CoderXie' => '1173044198@qq.com' }
  s.source           = { :git => 'https://github.com/CoderXie/RQKit.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.requires_arc = true
  s.source_files = 'RQKit/RQKit.h'

  s.subspec 'Base' do |ss|
    ss.ios.deployment_target = '9.0'
    ss.source_files = 'RQKit/Base/*.{h,m}'
  end
  
  s.subspec 'Network' do |ss|
    ss.ios.deployment_target = '9.0'
    ss.dependency 'AFNetworking/NSURLSession', '~> 4.0'
    ss.source_files = 'RQKit/Network/*.{h,m}'
  end
  
  s.subspec 'Cache' do |ss|
    ss.ios.deployment_target = '9.0'
    ss.dependency 'RQKit/Category'
    ss.source_files = 'RQKit/Cache/*.{h,m}'
  end
  
  s.subspec 'Model' do |ss|
    ss.ios.deployment_target = '9.0'
    ss.source_files = 'RQKit/Model/*.{h,m}'
  end
  
  s.subspec 'Category' do |ss|
    ss.ios.deployment_target = '9.0'
    ss.dependency 'RQKit/Base'
    ss.source_files = 'RQKit/Category/**/*.{h,m}'
  end
  
  s.subspec 'Utility' do |ss|
    ss.ios.deployment_target = '9.0'
    ss.source_files = 'RQKit/Utility/*.{h,m}'
  end
  
end
