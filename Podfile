# Uncomment the next line to define a global platform for your project
 platform :ios, '10.0'

target 'EduwebParents (iOS)' do
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings["ONLY_ACTIVE_ARCH"] = "YES"
    end
  end
end # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
pod 'OneSignal', '>= 3.0.0', '< 4.0'
  # Pods for EduwebParents (iOS)

end

target 'EduwebParents (macOS)' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for EduwebParents (macOS)

end

target 'OneSignalNotificationServiceExtension' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
pod 'OneSignal', '>= 3.0.0', '< 4.0' 
  # Pods for OneSignalNotificationServiceExtension
end
