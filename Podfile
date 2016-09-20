# Uncomment this line to define a global platform for your project
source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '8.0'
#Uncomment this line if you're using Swift
use_frameworks!

target 'Advance Carolina' do
    pod 'RxSwift'
    pod 'RxCocoa'
    pod 'Moya/RxSwift'
    pod 'Moya-Argo/RxSwift'
    pod 'Curry'
    pod 'FontAwesomeKit'
    pod 'ChameleonFramework/Swift'


pod 'KINWebBrowser'
pod 'MWFeedParser'
pod 'DZNEmptyDataSet'
pod 'Batch','~> 1.5'
pod 'Parse'
pod 'ParseUI'
pod 'MBProgressHUD','~>0.9.2'
pod 'LaunchKit'
pod 'Fabric'
pod 'Crashlytics'



end

target 'Advance CarolinaTests' do

end

target 'Advance CarolinaUITests' do

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.0'
      config.build_settings['MACOSX_DEPLOYMENT_TARGET'] = '10.10'
    end
  end
end

