## Introduction
Temmu is an E-Commerce app for User Interface course project, where you can buy clothing, shoes, bags and electrical appliance.
Mobile oriented,  works for both iOS and Android.

![Example picture](assets/images/example_frame.jpg)

Figma link: https://www.figma.com/community/file/1138923829121049036/e-commerce-mobile-app


## Main Features Showacse
- Home page
	- Banner slides
	- Filter by Category
	- Product grid list
	- Likes button
	- Bottom bar
- Detail page
	- Detail image
	- Introduction
	- Choose size
	- Add to cart button
- Likes page
	- Empty List
	- Likes list
	- Remove button
- Cart page
	- Empty List
	- Cart list
	- Quantity Selector
	- Swipe to remove
- Profile page
	- User Information
	- Settings

## Tech Stack
- Flutter / Dart


### Why we choose Flutter over Flet
while Flet is well designed and easy to use, friendly to beginner app developer, there're some features really matters in flutter
- hot reload
- Devtools - inspector
- real-world usage


## Architecture
Generally we have three layers: UI layer, Logic layer, Data layer.

UI layer displays data to the user that is exposed by the logic layer, and handles user interaction. This is also commonly referred to as the 'presentation layer'.

Logic layer implements core business logic, and facilitates inteacion between the data layer and UI layer.

Manages interactions with data sources, such as databases or platform plugins.


## Challenges
The main challenges lie in state management, which is a crucial concept in software development that involves managing the state of an application effectively to ensure data consistency and improve maintainability.

The challenges are:
- Ensuring that all providers were correctly initialized and disposed.
- Avoiding unnecessary rebuilds while keeping the state consistent across deeply nested widgets.
- Maintaining clean separation between UI and business logic while keeping the code readable and maintainable.

The Provider pattern helped us create a robust, testable, and scalable state management structure that supports real-time user interactions and clean architectural practices.


## Future Steps
Here are some functions we can add to complete the software:
- Responsive Design
- API Fetching
- Multi-language
- User information management
- Payment management
- Notifications
- Order Tracking
- AI Recommendations
