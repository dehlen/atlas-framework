## Atlas
A MVVM-C architecture framework for iOS.

### Features

* Separation of concerns
* Never write coordinators again
* Enforces MVVM

Based on the concepts introduced in the [MVVM-C talk by Steve Scott](https://www.youtube.com/watch?v=9VojuJpUuE8).

![Architecture used within a Todo app](Resources/architecture.png)

## Getting Started

### Installation

Add the following to your Cartfile:

```github "dm-drogeriemarkt/Atlas" ~> 1.0```

### Configuration

- Configuring it -> import, Factories, ViewModel, View
  - ViewModel of type MVVMCViewModelProtocol
  - If view wants lifecycle events, it has to be of type MVVMCContentViewDelegate
  - Factory for tab root views: MVVMCTabBarFactoryProtocol
  - Factory for navigatin targets: MVVMCFactoryProtocol
  - Navigation targets of type MVVMCNavigationTarget
  - Setup app with AppCoordinator

### TODO

- Next steps (back button)