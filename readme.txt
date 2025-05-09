
We need a Mobile application for WooCommerce marketplace - apple store and android.
Agreement for Mobile Application dated 2025-03-29
Project Plan for webview based mobile application – google play and apple store

1. Project Overview

○ The goal is to develop a mobile application that access www.vogo.family backend (configurable URL) through web view control and standard REST WooCommerce - https://woocommerce.com/document/woocommerce-rest-api/ - https://www.youtube.com/watch?v=YJj2edx0ZFs
2. Technical Stack

○ Frontend
○ Backend:
○ WordPress Integration: Utilize WordPress backend REST API to facilitate communication between the mobile application and WordPress WooCommerce backend via API calls.
3. WordPress Setup

○ We will Select an appropriate plugin for integrating external APIs into WordPress, such as WP REST API or a custom plugin option.
4. Development Process

○ Backend Development:
■ We will Set up a ….
■ Will …
■ Will Integrate a …
■ Node.js with ….
○ Frontend Development:
■ Create a user-friendly ….
■ Ensure the interface can send user queries to the backend API and display responses dynamically.
■ Frontend: React or Next.js ….
5. Integration and Testing

○ Integrate the app interface with the WordPress / WooCommerce
○ Test the entire flow, from user interaction on the frontend to response generation in the backend, ensuring all components communicate effectively.
○ Conduct user acceptance testing to gather feedback and make necessary adjustments.
6. Deployment and Monitoring

○ Deploy the app and backend system to the production environment.
○ Google Store / Magazine play
○ Apple Store
○ Monitor performance and user interactions to address any issues and improve the system over time.
7. Documentation and Support

○ Provide comprehensive documentation on how the system works, including installation, configuration, and troubleshooting steps.
○ Offer ongoing support for the customer to ensure the application remains effective and up-to-date.
Other technical notes:
The core of the app will be based on WebView and REST API, will integrate authentication through the website’s WooCommerce REST standard APIs, If necessary, also implement OAuth or JWT-based authentication. Notifications will be handled using Firebase Cloud Messaging (FCM) for both Android and iOS, integrate native GPS tracking, fetching real-time location data through the device’s GPS services and syncing it with the website’s API for accurate bike tracking. The app will detect internet connectivity and inform users when offline. For chat solution implement a flexible solution, either a lightweight in-app chat system or integrating an external API like Firebase Chat or WhatsApp Business API. Integrate the ticketing feature via Woo Commerce APIs, guide beneficiary through the process of publishing the app on both Google Play and the Apple App Store


Milestones and application versions / functionalities:

1. F1 First App Version:-
Splash Screen using logo, Images and ideas from the website(www.vogo.family )
1.1. Notes/info to Woo-Commerece website developers for encourage user visibility for download.
1.2. Push Notification Demo:- Simple Push Notification demo
1.3. Tech & Stack:- Choose technology that supports coverage for both Android and iOS platforms, such as Flutter or React Native.




2. F2 User login using WooCommerce API
2.1. User Authentication
2.2. Two-Factor Authentication
2.3. User Profile Management
2.4. Store local user and encrypted password and authenticate on WooCommerce www.vogo.family using standard WooCommerce.
2.5. API-Based Login (Recommended)
2.6. WebView Login (Simpler & Faster)
2.7. SSO/Social Login (Optional Enhancement)
2.8. Biometric Login (Extra Convenience)
2.9. Google authentication.
2.10. Option to use social logins (Google, Apple, Facebook, Meta, etc.), to connect those too.





3. F3 Base Requirement:-
3.1. Scan the QR code and open it in WebView to: register a new user; and order feedback.
3.2. Push Notifications: New order information



4. F4 Send current location data from mobile to web app and display a results page
4.1. GPS Tracking: Real-time location tracking
4.2. Off-line detection



5. F5 Publish in the app store and the Play Store
5.1. Google Play Developer account
5.2. apple dev account
5.3. Firebase account



6. F6 Fine-tuning and fixing. Security. Performance.
6.1. App Optimised
6.2. Analytics Integration
6.3. Accessibility Features
6.4. Feedback Mechanism
6.5. Security Measures
6.6. Scalability




Main Test scenario:

1. Access mobile application on android phone
2. Splash screen displayed
3. Message that no internet is available on the wifi and 5G network are closed – like in requirements; detect internet connection and info user.
4. Ask user to allow access to device location
5. Take the street address
6. Press continue
7. Register new user www.vogo.family
a. Enter phone number
b. Captcha
c. Enter code sent via SMS –
d. Option to take automatically code from SMS / enter manually code number – 4 digits
e. What is your Name: ..; Continue
f. Create account automatically
8. Options into application
a. My Account
i. Account data – like in https://vogo.family/my-account/
ii. Application language
iii. Backend URL

b. My orders
i. View orders
ii. Provide feedback for orders and view feedback history. Option to scan and open order ID barcode
c. Delivery addresses
i. View addresses
ii. Add/edit/delete address using map
d. Buy items using webview or other option – from https://vogo.family/
e. Use AI Chatbot – inclusive voice options – from vogo.family

Alternative Test scenario 1:

a. Same as Main Test Scenario but configure backend URL using Test environment
b. Include app version F1

Alternative Test scenario 2:

a. Access application
b. All steps like in Main test scenario but in language: French
c. Check F2 too


Alternative Test scenario 3:

a. Access www.vogo.family
b. All steps like in Alternative test scenario 1 but in language: Romanian
c. Check F3,F4 too


Alternative Test scenario 4:

a. Access application with registered user
b. Search for 2 products
c. Add to chart
d. Choose delivery address
e. Pay for products
f. Receive push notification for order confirmation
g. Contact support via WhatsApp and inform some details about address
h. Check in WooCommerce backend the order
i. Deliver the order
j. Receive the order
k. Enter feedback
l. Close the order
m. View order history including feedback and order timeline

Milestones plan:

1. Milestone 1
Title: Backend setup and first demo version
Estimated Duration: 10%
Value: 10%
Dependencies: Project startup

2. Milestone 2

Title: Second app version, including source code in Beneficiary GitHub with code comments standards and naming conventions
Estimated Duration: 10%
Value: 10%
Dependencies: Milestone 1 completed and accepted + released


3. Milestone 3

Title: Third app version – half of main scenario
Estimated Duration: 10%
Value: 10%
Dependencies: Milestone 2 completed and accepted + released

4. Milestone 4

Title: 4th app version – main scenario
Estimated Duration: 10%
Value: 10%
Dependencies: Milestone 3 completed and accepted + released



5. Milestone 5

Title: 5th app version - Alternative Test scenario 1 and assistance to publish in google store
Estimated Duration: 10%
Value: 10%
Dependencies: Milestone 4 completed and accepted + released

6. Milestone 6

Title: 6th app version - Alternative Test scenario 2 and assistance to publish in apple store
Estimated Duration: 10%
Value: 10%
Dependencies: Milestone 5 completed and accepted + released

7. Milestone 7

Title: 7th app version - Alternative Test scenario 3
Estimated Duration: 10%
Value: 10%
Dependencies: Milestone 6 completed and accepted + released

8. Milestone 8

Title: 8th app version - Alternative Test scenario 4
Estimated Duration: 10%
Value: 10%
Dependencies: Milestone 7 completed and accepted + released

9. Milestone 9

Title: Full requirements conformity matrix delivery; F6
Estimated Duration: 10%
Value: 10%
Dependencies: Milestone 8 completed and accepted + released

10. Milestone 10

Title: Documentation – technical and user guide
Estimated Duration: 10%
Value: 10%
Dependencies: Milestone 9 completed and accepted + released

Each milestone will be created when their dependencies are fulfilled.
