## Atlas
Atlas is a framework that helps you structure your iOS app using the MVVM-C architecture pattern.

### Features

* Separation of concerns
* Avoid boilerplate code and never write coordinators again
* Enforce the MVVM architecture pattern

The Atlas framework is based on the concepts introduced in the [MVVM-C talk by Steve Scott](https://www.youtube.com/watch?v=9VojuJpUuE8).

![Architecture used within a Todo app](Resources/architecture.png)

## Getting Started

### Installation

Add the following to your Cartfile:

```github "dm-drogeriemarkt/Atlas" ~> 1.0```

or use the framework via CocoaPods:
``` pod 'AtlasFramework', '1.0.0' ```

### Configuration

- For every root view (tab in the tab bar) of your app, create a factory that implements MVVMCTabBarFactoryProtocol
- In that factory, provide the tab bar icons, specify a transition type, specify the targets that this module can navigate to and implement the creation of the corresponding UIViewController.
- Create the view model class.
- Subclass UIViewController and add the view model as property.



- Configuring it -> import, Factories, ViewModel, View
  - ViewModel of type MVVMCViewModelProtocol
  - If view wants lifecycle events, it has to be of type MVVMCContentViewDelegate
  - Factory for tab root views: MVVMCTabBarFactoryProtocol
  - Factory for navigatin targets: MVVMCFactoryProtocol
  - Navigation targets of type MVVMCNavigationTarget
  - Setup app with AppCoordinator

### TODO

- Next steps (back button)
