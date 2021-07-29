# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'

target 'KickerKill' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for KickerKill
  pod 'Firebase/Analytics'
  pod 'Firebase/Firestore'
  pod 'FirebaseFirestoreSwift'

  # we're working with version 9 however
  # the suggested version from https://cocoapods.org/pods/FirebaseUI is ( 8.0 ).
  # also, when updating to the latest version ( 10.0 ) we also faced some issues.

  pod 'FirebaseUI/Auth', '~> 9.0'
  pod 'FirebaseUI/Google', '~> 9.0'
  pod 'FirebaseUI/Email', '~> 9.0'

  target 'KickerKillTests' do
    inherit! :search_paths
    # Pods for testing
    pod 'iOSSnapshotTestCase'
  end

  # set IPHONEOS_DEPLOYMENT_TARGET for the pods project
  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
        config.build_settings["ONLY_ACTIVE_ARCH"] = 'YES'
      end
    end
  end

end
