Pod::Spec.new do |s|

s.platform = :ios
s.ios.deployment_target = '11.0'
s.name = "SegmentedButton"
s.summary = "A segmented button designed to mimic the one seen in the Apple Maps app on iOS 13"
s.requires_arc = true
s.version = "0.1.0"
s.license = { :type => "Apache 2.0", :file => "LICENSE" }
s.author = { "Brandon Stillitano" => "b.stillitano95@gmail.com" }
s.homepage = "https://github.com/bstillitano/SegmentedButton"
s.source = { :git => "https://github.com/bstillitano/SegmentedButton.git",
             :tag => "#{s.version}" }
s.framework = "Foundation"
s.framework = "UIKit"
s.framework = "MobileCoreServices"
s.dependency 'SnapKit', '~> 5.0.0'
s.source_files = "SegmentedButton/**/*.{swift}"
s.resources = "SegmentedButton/**/*.{png,jpeg,jpg,storyboard,xib,xcassets}"
s.swift_version = "5.0"

end
