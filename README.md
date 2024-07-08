# HNG Mobile Dev: Stage Two Task  - Spicey Store

---
![alt text](/gitfiles/screenshot1.png)

## Table of contents

- [Overview](#overview)
- [Task Requirement](#task-requirement)
- [Solution](#solution)
- [Screenshot](#screenshot)
- [Features](#features)
- [The process](#the-process)
  - [Built with](#built-with)
  - [Installation](#installation)
  - [Useful resources](#useful-resources)
- [API Integration](#api-integration)
- [UI/UX](#uiux)
- [Mobile Architecture](#mobile-architecture)
- [Future Improvements](#future-improvements)
- [APK Download](#apk-download)
- [Appitize Link](#appitize-link)
- [Author](#author)
- [Contributing](#contributing)
- [License](#license)

## Overview

This is a solution to the mobile dev stage two task of Implementating Timbu API. The objective of the task requires we create a Timbu account.

Timbu is a business management, finance and marketing tool that helps your business be more organized and grow! You can check by clicking [timbu.cloud](timbu.cloud).

Task required we get our API key. Add some products information on our timbu account under Retail Business. Retrieve all products information using the api,  Display the products on a screen in a list.

## Task Requirement

- Implementation of Timbu API .
- Have a proper mobile architecture.
- The display of at least 10 products with images from the timbu api on a screen in a list.
- show relevant information of the products you have added on timbu in the list item.
- Proper UI state management and handle errors properly.

## Solution

Spicey is an eCommerce mobile app that specializes in selling various types of cakes. Customers can browse the available products and place orders directly from the app, the product item from my Timbu account was displayed in a gridview, which is a special kind of list that allows users to view items two-by-two or more rather thann a single straight list.

### Screenshot

![alt text](/gitfiles/screenshot2.png)
![alt text](/gitfiles/screenshot5.png)
![alt text](/gitfiles/screenshot3.png)
![alt text](/gitfiles/screenshot4.png)

## Features

- Pull to Refresh: Allows users to refresh the product list by pulling down the screen.
- Shimmer Loading Effect: Displays a shimmering placeholder while the content is loading.
- Splash Screen: An initial loading screen with the app logo that navigates to the home screen after a delay.
- Product Listing: Displays a list of available cakes.
- Product Details: Provides detailed information about each product, including an image, description, and price.
- Responsive and adaptive UI

## The process

### Built with

- Flutter and Dart

### What I learnt

Developing the Spicey app provided several valuable insights and lessons, both technical and non-technical, these lessons are summarized in the following bullet point:

- Understanding API Integration
Integrating the Timbu API required a deep understanding of API documentation and handling secure data. Using environment variables for sensitive information like API keys and organization IDs is crucial to maintaining security.
- State Management
Implementing state management with the Provider package in Flutter was essential for maintaining and updating the app's state efficiently. This pattern helped in separating the business logic from the UI, making the code more maintainable and scalable.
- Effective UI/UX Design
Creating a user-friendly interface involved using various Flutter widgets to provide a smooth and responsive experience. The pull-to-refresh feature and shimmer loading effect were particularly effective in improving the user experience by providing visual feedback during data loading.
- MVVM Architecture
Adopting the MVVM architecture pattern was a significant step in organizing the codebase. This architecture facilitated a clear separation of concerns, making the app easier to manage and extend.
- Async Programming
Handling asynchronous operations, such as fetching data from the API, was critical. Understanding Dart's async and await keywords and effectively managing loading states and error handling improved the app's robustness.

## Installation

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Android Studio or Visual Studio Code: Recommended for development and testing
- A device or emulator to run the app

### Setup Instructions

1.**Clone the repository**

   ```bash
   git clone https://github.com/yourusername/timo_stores.git
   ```
  
2.**Navigate to the project directory**

 ```bash
   cd store_app
   ```

3.**Get the required dependencies**

   ```bash
   flutter pub get
   ```

4.**Run the app**

  ```bash
   flutter run
   ```

### Useful resources

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Also check out these links to start your first flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

## API Integration

Spicey integrates with Timbu, a business management software that helps automate and simplify business operations. It allows managing invoices, debts, customer outreach, and more.

- API Documentation: [Timbu API Docs](https://docs.timbu.cloud/api/intro)
- Website: [Timbu](timbu.cloud)

To use the Timbu API, you need to obtain the following parameters:

- organization_id: Your organization ID
- myAppId: Your application ID
- myApiKey: Your API key

These parameters should be stored securely for security reasons.

## UI/UX

Spicey provides an intuitive and user-friendly interface:

- Splash Screen: Displays an icon and app name while initializing.
- Home Screen: Lists products with a pull-to-refresh feature and shimmer loading effect.
- Detail Screen: Shows detailed information about each product, including images, descriptions, and prices, with options to add/remove from cart and place an order.

## Mobile Architecture

Spicey follows the MVVM (Model-View-ViewModel) architecture pattern, which separates the business logic from the UI. This architecture enhances code maintainability and testability.

Code Structure:

- Models: Defines the data structures used in the app.
- ViewModels (Providers): Manages the app's data and business logic.
- Views: Contains the UI components and screens.

## Future Improvements

- Enhanced Error Handling: Improving error handling mechanisms to provide more informative feedback to the users and developers.
- Testing: Incorporating unit and integration tests to ensure the app's reliability and catch potential issues early.
- Performance Optimization: Optimizing the app's performance, particularly in handling large datasets and images, to ensure a smooth user experience.
- User Feedback: Gathering user feedback and iterating on the app's features and design based on real-world usage.
- Scalability: Preparing the app for scalability to handle more products, users, and potential new features in the future.

## APK Download

Download the latest version of the app from the link below:

[Download APK](https://drive.google.com/file/d/1aQ1_cS15nVeg-XjGPtP3sb56Ph5sf5KS/view?usp=sharing)
or
Download [here](/gitfiles/spicey.apk)

## Appitize Link

Try Spicey Demo: [Appitize.io](https://appetize.io/app/android/com.example.store_app?device=pixel7&osVersion=13.0&record=true)

## Author

- Uma Godwin Eke

- Linkedin - [@godwinekeuma](https://www.linkedin.com/in/godwinekeuma)
- Email - [godwinekeuma@gmail.com](https://www.frontendmentor.io/profile/yourusername)
- Twitter - [@godwinekeuma](https://www.twitter.com/godwinekeuma)

## Contributing

Contributions are welcome! If you'd like to contribute, please follow these steps:

1. Fork the repository
2. Create a new branch: `git checkout -b feature/your-feature-name`
3. Make your changes
4. Commit your changes: `git commit -m 'Add some feature'`
5. Push to the branch: `git push origin feature/your-feature-name`
6. Submit a pull request

Please ensure your code adheres to the existing code style and includes appropriate tests.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
