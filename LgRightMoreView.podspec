Pod::Spec.new do |s|

  s.name     = 'LGRightMoreView'

  s.version  = '1.0.0'

  s.license  = { :type => 'MIT' }

  s.summary  = 'UICollectionView 右侧滑动可以push 到下一个控制器组件'

  s.description = <<-DESC
                    UICollectionView 右侧滑动可以push 到下一个控制器组件
                   DESC

  s.homepage = 'https://github.com/lanligang/LGRightMoreView'

  s.authors  = { 'LenSky' => 'lslanligang@sina.com' }

  s.source   = { :git => 'https://github.com/lanligang/LGRightMoreView.git', :tag => s.version }

  s.source_files = 'LgRightMoreView/**/*.{h,m}'
  s.requires_arc = true
  s.ios.deployment_target = '7.0'
  s.ios.frameworks = ['UIKit', 'CoreGraphics', 'Foundation']
end