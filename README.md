# Shopping App

### General Info

* App has been built using MVVM architecture.
* View Controllers are built using StoryBoards.
* Custom views are created using Xib files.
* Custom Network Layer has been implemented. Therefore, the project must be run with .xcworkspace file

### ViewControllers

* In order to create a ViewController;
    * ViewControllers should inherit from "BaseViewController"
    * it's ".swift" and ".storyboard" files must be named exactly same.
    * Storyboard ID should be same with .swift and .storybard filenames.
    * Those namings must be added to "NavigationEnum" with their respective String values.
    * If data transfer is required between ViewControllers; create the data using the viewModel of the target viewController. Then navigate using "NavigationRouter.navigate()". See -> "MainPageViewController", Line: 93
    
### ViewModels

* In order to create a ViewModel;
    * ViewModel should inherit from "BaseViewModel"
    
### NavigationRouting

* Navigation can be done using navigate() function of NavigationRouter
* You can navigate with this function as long as target ViewController is created using storyboard and the filename is added as a String to NavigationEnum.
* You can add Custom TransitionStyles inside TransitionStyle enum. But do not forget to handle the case inside NavigationRouter.navigate() function. See -> NavigationRouter, L: 22

### Custom Views

* CustomViews have been created using xib. 
* Xib file should be named same as .swift file.
* In order to use the CustomViews, they should be added to viewController as instance, then should be initialized using UIView.fromNib(). See -> DetailPageViewController, L: 15

### NetWork Layer

* Custom Network Layer framework was created and implemented to the project. Therefore, the project should be run with .xcworkspace file.
* "NetWorkLayer" must be imported to the file in order to use the network.
* "NetworkLayer" object instance must be created.
* This instance can be used to make network requests using related url and responseModel. See -> MainPageViewModel, L: 19

