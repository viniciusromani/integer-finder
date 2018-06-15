# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

def ui_pods
    pod 'Toast-Swift', '~> 3.0.1'
    pod 'SkyFloatingLabelTextField', '~> 3.0'
end

def net_pods
    pod 'Moya'
    pod 'Moya/RxSwift'
end

def helper_pods
    pod 'Swinject'
    pod 'SwinjectStoryboard'
    pod 'R.swift'
end

def test_pods
    pod 'Nimble', '~> 7.0.0'
end

target 'IntegerFinder' do
    # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
    use_frameworks!

    # Pods for IntegerFinder
    ui_pods
    net_pods
    helper_pods
end

target 'IntegerFinderTests' do
    # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
    use_frameworks!

    # Pods for IntegerFinder
    test_pods
end
