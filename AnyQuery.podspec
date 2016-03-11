Pod::Spec.new do |s|
  s.name             = "AnyQuery"
  s.version          = "0.1.3"
  s.summary          = "Soft-typed query for anything"
  s.description      = <<-DESC
                     Soft-typed query for anything such as Web API and Realm
                     DESC
  s.homepage         = "https://github.com/naoty/AnyQuery"
  s.license          = "MIT"
  s.author           = { "Naoto Kaneko" => "naoty.k@gmail.com" }
  s.social_media_url = "https://twitter.com/naoty_k"
  s.source           = { :git => "https://github.com/naoty/AnyQuery.git", :tag => s.version.to_s }
  s.platform         = :ios, "8.0"
  s.requires_arc     = true
  s.source_files     = "AnyQuery/**/*.{h,swift}"
end
