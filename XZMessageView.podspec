#
# Be sure to run `pod lib lint XZMessageView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'XZMessageView'
  s.version          = '0.1.0'
  s.summary          = 'A simple way to display message on top of screen'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'XZMessageView is a customized message view to show your message on top of screen, also it gives you flexiblity to customize the font/color/duration/delay.'

  s.homepage         = 'https://github.com/chaucyzhang/XZMessageView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'tringappsXiZhang' => 'xi.zhang@tringapps.com' }
  s.source           = { :git => 'https://github.com/XZMessageView/XZMessageView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/xizhang2'

  s.ios.deployment_target = '8.0'

  s.source_files = 'XZMessageView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'XZMessageView' => ['XZMessageView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
