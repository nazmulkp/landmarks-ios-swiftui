# Landmarks iOS App with SwiftUI

This repository contains an iOS application built with SwiftUI, demonstrating the use of Clean Architecture principles. The app displays landmarks fetched from a local JSON file, with a clean separation of concerns across different layers.

<img width="326" height="500" alt="Screenshot 2024-06-21 at 1 01 15 PM" src="https://github.com/nazmulkp/landmarks-ios-swiftui/assets/8841075/ce49c787-45e6-4458-b905-30833b7ed385">

<img width="326" height="500" alt="Screenshot 2024-06-21 at 1 01 15 PM" src="https://github.com/nazmulkp/landmarks-ios-swiftui/assets/8841075/8b845168-e338-461d-9372-bf1b35f9bdcc">



## Project Structure

The project is organized as follows:

- **Infrastructure**: Contains interfaces, configurations, and utilities.
  - **Interfaces**: Protocols defining the contract for various services.
  - **Configuration**: Configuration management for the app.
  - **Utilities**: Utility classes and functions.

- **Data**: Responsible for data sources and repositories.
  - **Local**: Local data sources.
  - **Repositories**: Implementation of repositories for data access.

- **Domain**: Core business logic of the application.
  - **Interfaces**: Protocols for repository interactions.
  - **UseCases**: Use cases implementing the business logic.
  - **Entities**: Data models.

- **Presentation**: The user interface layer, built with SwiftUI.
  - **Landmark**: Views related to displaying landmarks.
  - **App**: The main app entry point.
  - **Resources**: Assets and resources for the app.
  - **Preview Content**: Content for SwiftUI previews.

- **LandmarksTests**: Unit tests for the app.
  - **Infrastructure**: Tests for the infrastructure layer.
  - **Domain**: Tests for the domain layer.
  - **Presentation**: Tests for the presentation layer.

## Getting Started

### Prerequisites

- Xcode 12.0 or later
- Swift 5.3 or later

### Setup

1. **Clone the repository**:
   ```sh
   git clone https://github.com/nazmulkp/landmarks-ios-swiftui.git
   cd landmarks-ios-swiftui
