Pod::Spec.new do |s|
  s.name             = "CCSpotlight"
  s.version          = "1.0.0"
  s.summary          = "An easy way to use Spotlight."
  s.description      = <<-DESC
                       It is a framework used on iOS, which implement by Objective-C.
                       DESC
  s.homepage         = "https://github.com/LiDechao/CCSpotlight"
  s.license          = 'MIT'
  s.author           = { "idechao" => "idechao@163.com" }
  s.source           = { :git => "https://github.com/LiDechao/CCSpotlight.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/NAME'

  s.platform     = :ios, '8.0'
  # s.ios.deployment_target = '5.0'
  # s.osx.deployment_target = '10.7'
  s.requires_arc = true

  s.source_files = 'CCSpotlight/*'
  # s.resources = 'Assets'

  # s.ios.exclude_files = 'Classes/osx'
  # s.osx.exclude_files = 'Classes/ios'
  # s.public_header_files = 'Classes/**/*.h'
  s.frameworks = 'Foundation', 'UIKit'
  s.weak_frameworks = 'CoreSpotlight'

end
