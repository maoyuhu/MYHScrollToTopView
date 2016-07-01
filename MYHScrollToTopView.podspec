 Pod::Spec.new do |s|
  s.name         = "MYHScrollToTopView"
  s.version      = "0.0.1"
  s.ios.deployment_target = '6.0'
  s.license  = 'MIT'
  s.summary      = "滚动视图点击状态栏可以滑动到最上方."
  s.authors = { ‘maoyuhu’ => ’13162766101@163.com’ }
  s.homepage     = "https://github.com/maoyuhu/MYHScrollToTopView"
  s.source = { :git => 'https://github.com/maoyuhu/MYHScrollToTopView.git', :tag => s.version }
  s.description  = "simple and easy A short description of MYHScrollToTopView"
  s.source_files = 'MYHScrollToTopView/*.{h,m}'
  s.requires_arc = true
 
 end