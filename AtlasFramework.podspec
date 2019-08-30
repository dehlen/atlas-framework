Pod::Spec.new do |s|
  s.name         = "AtlasFramework"
  s.version      = "1.0.11"
  s.summary      = "Atlas is a framework that helps you structure your iOS app using the MVVM-C architecture pattern."
  s.description  = <<-DESC
  Atlas is a framework that helps you structure your iOS app using the MVVM-C architecture pattern.
  The Atlas framework is based on the concepts introduced in the MVVM-C talk by Steve Scott.
                   DESC
  s.homepage     = "https://gitlab.dm-drogeriemarkt.com/mein-dm/mobile-framework/atlas"
  s.license      = { :type => "MIT", :file => "LICENSE.txt" }
  s.author             = {
  	"Engel, Stefan" => "stefan.engel@dm.de"
  }
  s.source       = { :git => "git@gitlab.dm-drogeriemarkt.com:mein-dm/mobile-framework/atlas.git", :tag => "#{s.version}" }
  s.source_files  = "Atlas/Atlas/**/*.{h,m,swift}"
  s.public_header_files = "Atlas/Atlas/**/*.h"
  s.swift_version = '4.2'
  s.platform     = :ios, '9.0'
end
