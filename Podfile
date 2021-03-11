# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'

target 'KickerKill' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for KickerKill
  pod 'Firebase/Analytics'
  pod 'Firebase/Firestore'
  pod 'FirebaseFirestoreSwift'

  pod 'FirebaseUI/Auth'
  pod 'FirebaseUI/Google'
  pod 'FirebaseUI/Email'

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
      end
    end
  end

end
