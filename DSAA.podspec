Pod::Spec.new do |s|

  s.name         = "DSAA"
  s.version      = "0.0.1"
  s.summary      = "Collection of Data Structures (ADTs) and Algorithms"
  s.homepage     = "https://github.com/eneko/DSAA"
  s.license      = "MIT"
  s.author             = { "Eneko Alonso" => "eneko.alonso@gmail.com" }
  s.social_media_url   = "http://twitter.com/eneko"

  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"
  s.tvos.deployment_target = "9.0"

  s.source       = { :git => "https://github.com/eneko/DSAA.git", :tag => s.version }

  s.source_files  = "Sources/**/*.swift"

end
