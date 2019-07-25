Pod::Spec.new do |s|

s.name         = "LGRightMoreView" 
s.version      = "1.00"  
s.summary      = "ICollectionView 右侧滑动可以push 到下一个控制器组件"

s.homepage     = "https://github.com/lanligang/LGRightMoreView"

s.license      = "MIT"

s.author       = { "LenSky" => "lslanligang@sina.com" }

s.platform     = :ios
s.platform     = :ios, "8.0"


s.source       = { :git => "https://github.com/lanligang/LGRightMoreView.git", :tag => s.version}


s.source_files  = "LGRightMoreView/**/*.{h,m}"


s.requires_arc = true 


end