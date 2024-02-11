# Setup
Follow these steps to use the template repository featuring properly setup Gradle files for environment configuration, repository initialization, Flutter Version Management (FVM) initialization, and Github Actions integration.

1. Use the repository as template. This will create a repository of your own and copies the template.
    ![Untitled](https://github.com/cuisonenrico/setup/assets/123451800/3ea25ab0-ff04-40d1-8097-ec23d8941247)
   
2. Have Flutter version management initialized. You can use any version you want. However, if there are any conflicts, errors, and outdated or deprecated methods, it is your responsibility to resolve them. This template initially uses flutter version `3.13.7`. Run the following
    > dart pub global activate fvm
    > 
    > fvm use <VERSION_NUMBER>
3. To rename all package names associated with android files run this:
    > futter pub run change_app_package_name:main com.package.test_fork

    Note: Replace `com.package.test_fork` with your desired package name. Take note that this will only replace package names for android files. Any values such as the `app_name` declared for each application flavor in `build.gradle` should be changed manually (see image below).

   ![asdasd](https://github.com/cuisonenrico/setup/assets/123451800/019d4626-3f1d-4f0c-b1c6-3cd13ab5d4fc)

5. Run pub get and build_runner:
    > flutter pub get
    > 
    > flutter packages pub run build_runner build --delete-conflicting-outputs --verbose
6. Setup Run Configurations. Set main.dart as entry point and use a build flavor.
    ![Untitled](https://github.com/cuisonenrico/setup/assets/123451800/238fcaff-0905-40ba-afbb-0f41ab320b8e)

