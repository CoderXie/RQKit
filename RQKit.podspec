#
# Be sure to run `pod lib lint RQKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RQKit'
  s.version          = '0.1.3'
  s.summary          = 'A collection of iOS components'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'RQKit is personal development kit'

  s.homepage         = 'https://github.com/CoderXie/RQKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'CoderXie' => '1173044198@qq.com' }
  s.source           = { :git => 'https://github.com/CoderXie/RQKit.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.requires_arc = true
  s.source_files = 'RQKit/RQKit.h'

  s.subspec 'Core' do |ss|
    ss.ios.deployment_target = '9.0'
    ss.source_files = 'RQKit/Core/*.{h,m}'
  end
  
  s.subspec 'Foundation' do |ss|
    ss.ios.deployment_target = '9.0'
    ss.source_files = 'RQKit/Foundation/*.{h,m}'
  end
  
  s.subspec 'UIKit' do |ss|
    ss.ios.deployment_target = '9.0'
    ss.source_files = 'RQKit/UIKit/*.{h,m}'
  end
  
  s.subspec 'Utility' do |ss|
    ss.ios.deployment_target = '9.0'
    ss.source_files = 'RQKit/Utility/*.{h,m}'
  end
  
end
