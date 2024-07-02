# Study Case

A new Flutter project.

[mockAPI](https://mockapi.io/) used as an api. 

### Api Schema

![Ekran Resmi 2023-09-17 19 46 23](https://github.com/umutbariscoskun/JuneCase/assets/45595606/c48592fa-0105-4a4b-a34e-330c743bdfc0)


### ARCHITECTURE: 

- Clean Architecture

![image](https://github.com/umutbariscoskun/ApiCrudAPP/assets/45595606/9e8d7eec-8de0-416f-ad1b-eee5a4561a61)


[You can find more about this architecture in my article.](https://medium.com/@umutbariscoskun/flutter-clean-architecture-paketi-ve-mimari-kullan%C4%B1m%C4%B1-beae4d09e0c3)



### ENVIRONMENTS

#### TEST, UAT, PROD

/// run in terminal for example: `make run-debug-dev`

run-debug-dev:
	flutter run --target lib/main.dart --flavor dev --dart-define=APP_ENV=dev

run-debug-uat:
	flutter run --target lib/main.dart --flavor uat --dart-define=APP_ENV=uat

 run-debug-prod:
	flutter run --target lib/main.dart --flavor prod --dart-define=APP_ENV=prod

 #### RUNNING ENVIRONMENTS FROM TERMINAL 
 
 ##### YOU CAN RUN THEM DIRECTLY FROM VISUAL STUDIO CODE LAUNCH SETTINGS 

 ![image](https://github.com/umutbariscoskun/JuneCase/assets/45595606/1ab310f6-dd13-4b4b-9cb9-a561d334471e)

 `make run-debug-dev`
 
 `make run-debug-uat`
 
 `make run-debug-prod`

  ##### Bundle display names and bundle identifiers, version numbers updated for per environment 
  ![image](https://github.com/umutbariscoskun/JuneCase/assets/45595606/5f2f83a9-49eb-4916-bf8b-493b3bdc73cb)

 
 ### Localization: 
 
 You have to change locale& country on ios to change app locale 

 -### EN: ![Simulator Screenshot - iPhone 15 Pro - 2024-06-30 at 21 40 30](https://github.com/umutbariscoskun/JuneCase/assets/45595606/d0b04f18-6650-4ccf-8ad7-d577030806b9)
 -### TR: ![Simulator Screenshot - iPhone 15 Pro - 2024-06-30 at 21 38 23](https://github.com/umutbariscoskun/JuneCase/assets/45595606/3c0dfc9c-c462-4479-a927-f16bca9caf5e)

 ### Unit Testing: 
 
 Unit tests created for all of usecases `flutter test` 
 
 ## PACKAGES
 ##### FOR ROUTER:
 
- [auto_route](https://pub.dev/packages/auto_route)
- [auto_route_generator](https://pub.dev/packages/auto_route_generator)
  
 ##### FOR DEPENDENCY INJECTION:
 
- [Get_it](https://pub.dev/packages/get_it)
- [Injectable](https://pub.dev/packages/injectable)
- [injectable_generator](https://pub.dev/packages/injectable_generator)
  
 ##### FOR State Management & Business logic:
 
- [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- [equatable](https://pub.dev/packages/equatable)
- [dartz](https://pub.dev/packages/dartz)
  
 ##### FOR NETWORKING:
 
- [retrofit](https://pub.dev/packages/retrofit)
- [retrofit_generator](https://pub.dev/packages/retrofit_generator)
- [dio](https://pub.dev/packages/dio)
  
  ##### FOR UI:
  
- [screen_util](https://pub.dev/packages/flutter_screenutil)
- [gap](https://pub.dev/packages/gap)
- [build_runner](https://pub.dev/packages/build_runner)
  
 ##### FOR LOCALIZATION:
 
- [easy_localization](https://pub.dev/packages/easy_localization)
  
 ##### FOR UNIT TESTING:
 
- [mockito](https://pub.dev/packages/mockito)
- [mock_web_server](https://pub.dev/packages/mock_web_server)

 ### UI
![Simulator Screenshot - iPhone 15 Pro - 2024-06-30 at 21 40 30](https://github.com/umutbariscoskun/JuneCase/assets/45595606/d0b04f18-6650-4ccf-8ad7-d577030806b9)

#### Custom Animated Buttons
![Simulator Screen Recording - iPhone 15 Pro - 2024-06-30 at 21 45 50](https://github.com/umutbariscoskun/JuneCase/assets/45595606/924def2a-b2f3-4a19-9bdf-d6e3d19b5961)


# JuneCase
