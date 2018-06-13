# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

def helper_pods
    pod 'R.swift'
end

def net_pods
  pod 'Moya'
  pod 'Moya/RxSwift'
end

def test_pods
    pod 'Nimble', '~> 7.0.0'
end

target 'IntegerFinder' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for IntegerFinder
  helper_pods
  net_pods
end

target 'IntegerFinderTests' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for IntegerFinder
  test_pods
end
