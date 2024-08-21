# APODApp

This project is an iOS/Android application that displays NASA's Astronomy Picture of the Day (APOD). The app fetches the daily image, along with its title and explanation, and presents it to the user. It also handles offline scenarios by caching the last retrieved data.

Getting Started

Prerequisites
Before running the project, ensure that you have the following tools installed:

Xcode (for iOS development)
Git (for version control)
A NASA API Key: You can obtain one from NASA's API portal.
Installation and Setup
Clone the Repository:
Open your terminal, navigate to your desired directory, and clone the repository using:

bash
Copy code
git clone https://github.com/satheeshkumar89/APODApp.git
Create and Switch to a New Branch:
After cloning, navigate to the project directory:

bash
Copy code
cd APODApp
Create and switch to a new branch for your work:

bash
Copy code
git checkout -b JohnAnderson-WalE


Add Your API Key:
Open the project in Xcode, and locate the APODViewModel.swift file. Replace "YOUR_NASA_API_KEY" with your actual NASA API key.


Open the Project in Xcode:
bash
Copy code
open APODApp.xcodeproj


Run the App:

Build and run the app on an iOS simulator or a connected device. The app should display the Astronomy Picture of the Day along with its title and explanation.
Notes

Offline Handling: The app caches the last viewed APOD data, allowing it to function even when the device is offline.


Error Handling: Basic error handling is implemented to inform the user when the app is offline and no cached data is available.

Simple UI: The UI is kept minimalistic and user-friendly, focusing on displaying the image and associated information without unnecessary complexity.


Improvement Areas

Enhanced Error Handling:
Improve the user feedback mechanism for different error states, such as network failures or API errors.

UI/UX Enhancements:
Consider adding transitions, animations, or additional UI components to improve the user experience.
Implement a custom loading indicator while the image is being fetched.

Offline Caching:
Expand the offline functionality to cache multiple days' worth of APODs, allowing users to view past images when offline.
Consider using CoreData or Realm for more robust and scalable offline data storage.

Testing:
Add unit tests for the ViewModel to ensure correct data handling.
Add UI tests to validate the user interface across different scenarios, such as online and offline modes.

Localization:
Implement localization support to allow the app to be used in multiple languages.
