platform :osx, '10.9'
use_frameworks!

def common_pods
  pod 'Stencil', :inhibit_warnings => true
  pod 'StencilSwiftKit', :git => 'https://github.com/SwiftGen/StencilSwiftKit', :branch => 'feature/basename-filter'
end

target 'Tests' do
  common_pods()
end
