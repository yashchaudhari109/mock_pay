BON Reward UI - Flutter

This project is a Flutter-based UI task for BON, showcasing a clean, well-structured, and engaging user interface. The application is built with a focus on a scalable architecture and a delightful user experience.

🚀 Overview

The app presents a single screen that announces a user reward, provides an option to select a brand, and displays a list of mock credit card bills. A key highlight is the interactive and visually appealing reward unlocking mechanism.

✨ Features

Reward Notification: A clear and concise message informing the user they have unlocked a "$10 reward!".
Brand Selection: A "Choose Brand" button to simulate navigation to the next step in the user flow.
Credit Card Bills Display: A list of three mock credit card bills, each showing the amount, due date, and payment status.
Modern & Clean UI: The user interface is designed with a fresh and modern aesthetic, utilizing Google Fonts for crisp typography.
Dynamic Card Colors: The credit card bill cards feature unique colors derived from the mock data, making each one visually distinct.
Interactive Reward Reveal: A standout feature where users can physically "scratch" a card to reveal their reward.
Celebratory Animation: Upon successfully revealing the reward, a confetti animation is triggered for a fun and engaging user experience.

🏗️ Architecture and Technical Details

This project was built with a strong emphasis on a robust and maintainable architecture, even for a single-screen application.
MVVM (Model-View-ViewModel): The app is structured using the MVVM pattern to ensure a clear separation of concerns, making the codebase organized and easy to manage.[1]
BLoC (Business Logic Component): The BLoC pattern is employed for state management, ensuring that the UI updates reactively and efficiently to any data changes.
Repository Pattern: Mock data is provided through a repository, which abstracts the data source. This design choice makes it incredibly simple to switch to a real backend API in the future without altering the UI or business logic.
Clean Code Practices: The codebase is organized with related files grouped together and a focus on creating reusable widgets to maintain a tidy and efficient structure.