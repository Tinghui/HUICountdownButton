Pod::Spec.new do |s|
  s.name         = "HUICountdownButton"
  s.version      = "1.0.2"
  s.license      = 'MIT'
  s.summary      = "UIButton subclass with countdown"
  s.homepage     = "https://github.com/Tinghui/HUICountdownButton"
  s.authors      = { "Tinghui" => "tinghui.zhang3@gmail.com" }  
  s.source       = { :git => "https://github.com/Tinghui/HUICountdownButton.git", :tag => s.version }
  s.source_files = 'HUICountdownButton/HUICountdownButton.{h,m}'
  s.requires_arc = true
  s.platform     = :ios, '5.0'
end
