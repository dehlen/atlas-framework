Pod::Spec.new do |s|
  s.name         = "AtlasFramework"
  s.version      = "1.0.5"
  s.summary      = "Atlas is a framework that helps you structure your iOS app using the MVVM-C architecture pattern."
  s.description  = <<-DESC
  Atlas is a framework that helps you structure your iOS app using the MVVM-C architecture pattern.
  The Atlas framework is based on the concepts introduced in the MVVM-C talk by Steve Scott.
                   DESC
  s.homepage     = "https://stash.dm-drogeriemarkt.com/projects/OSI/repos/atlas/browse"
  s.license      = { :type => "MIT", :file => "LICENSE.txt" }
  s.author             = { 
  	"Engel, Stefan" => "stefan.engel@dm.de",
  	"Olbrich, Jan" => "jan.olbrich@dm.de" 
  }
  s.source       = { :git => "https://stash.dm-drogeriemarkt.com/scm/osi/atlas.git", :tag => "#{s.version}" }
  s.source_files  = "Atlas/Atlas/**/*.{h,m,swift}"
  s.public_header_files = "Atlas/Atlas/**/*.h"
  s.swift_version = '4.2'
  s.platform     = :ios, '9.0'
end
