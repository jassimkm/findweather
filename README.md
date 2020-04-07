# findweather

# Running

 Run pod install on terminal at root folder of project and open FInd Weather.xcworkspace in Xcode and Run


# Testing
Move to test navigator and run Find WeatherTests


# Code Coverage

Enter following in terminal at root folder of project (change simulator if not available)

xcodebuild -project 'Find Weather.xcodeproj'
/ -scheme 'Find WeatherTests' -derivedDataPath Build/ -destination 'platform=iOS Simulator,OS=13.4,name=iPhone 11 Pro Max' -enableCodeCoverage YES clean build test CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO

Code Coverage will be available in build folder
