
# MealMate

MealMate is a native iOS application developed in SwiftUI, designed to help users browse and explore recipes specifically within the dessert category. Utilizing data from TheMealDB API, it provides a clean and interactive way to view meal details including ingredients and cooking instructions.

## Features

- **Browse Desserts**: Users can scroll through an alphabetically sorted list of dessert recipes.
- **Detailed View**: On selection, the app presents detailed information about the recipe, including preparation instructions and required ingredients with their respective measurements.

## Prerequisites

- Xcode 15.2 or later
- iOS 17.2 or later
- Swift 5 or later

## Installation

To set up the project locally:

1. Clone the repository:
   ```sh
   git clone https://github.com/wnjknjwnd/MealExplorer
   ```
2. Open `MealMate.xcodeproj` in Xcode.
3. Select your target device or simulator.
4. Press `Cmd + R` to build and run the application.

## Architecture

MealMate is structured using the MVVM (Model-View-ViewModel) architecture pattern, enhancing the separation of concerns and simplifying the management of UI state and business logic.

### Why Use URLSessions?

URLSessions provide a straightforward approach to handling network requests in iOS applications. It is well-suited for this project because:

- **Simplicity**: URLSession is simple to use for basic network operations. As all we need to do is fetch data from the API and display it on the view, we don't need reactive programming.
- **Performance**: URLSession is optimized for performance and works efficiently for the requirements of this app.
- **Compatibility**: URLSession is compatible with a wide range of iOS versions and requires minimal configuration.

### Why Use Combine?

Combine offers a modern approach to handling asynchronous data streams. It is used in this project to demonstrate:

- **Reactive Programming**: Combine allows for reactive programming, which can simplify handling multiple asynchronous operations.
- **Declarative Code**: Combine's declarative syntax can make the code more readable and easier to maintain.
- **Advanced Error Handling**: Combine provides robust error handling mechanisms, which can be beneficial for more complex networking tasks.

However, for this problem, reactive programming is not needed. Combine is used here primarily to showcase the knowledge of modern frameworks.

### Components

#### Model

| URLSessions           | Combine                |
|-----------------------|------------------------|
| `MResponse`           | `MealResponse`         |
| `MDetailedResponse`   | `MealDetailedResponse` |

#### View

| URLSessions           | Combine                |
|-----------------------|------------------------|
| `MView`               | `MealView`             |
| `MDetailedView`       | `MealDetailedView`     |

#### ViewModel

| URLSessions           | Combine                |
|-----------------------|------------------------|
| `MViewModel`          | `MealViewModel`        |
| `MDetailedViewModel`  | `MealDetailedViewModel`|

#### Networking

| URLSessions           | Combine                |
|-----------------------|------------------------|
| `MNetworking`         | `MealNetworking`       |

#### Protocol

| URLSessions           | Combine                |
|-----------------------|------------------------|
| `MProtocol`           | `MealProtocol`         |

### Network Operations

#### URLSessions

- **Fetching List of Desserts**:
  - Utilizes `URLSession` to send a request to `https://themealdb.com/api/json/v1/1/filter.php?c=Dessert`.
  - Processes the JSON response to populate the list of meals.

- **Fetching Meal Details**:
  - Sends a GET request to `https://themealdb.com/api/json/v1/1/lookup.php?i=MEAL_ID` using `URLSession`.
  - Decodes the JSON response into detailed meal objects using `JSONDecoder`.

#### Combine

- **Fetching List of Desserts**:
  - Uses `URLSession` and Combine to send a request to `https://themealdb.com/api/json/v1/1/filter.php?c=Dessert`.
  - Processes the JSON response to populate the list of meals using `JSONDecoder`.

- **Fetching Meal Details**:
  - Sends a GET request to `https://themealdb.com/api/json/v1/1/lookup.php?i=MEAL_ID` using Combine.
  - Decodes the JSON response into detailed meal objects using `JSONDecoder`.

### Handling Null or Empty Values

MealMate includes sophisticated logic to handle null or empty values from the JSON responses effectively:

- **Implementation**: Using Swift's `Mirror` API, the app reflects on each `MealDetail` object to dynamically access its properties.
- **Conditional Filtering**: It checks each property (ingredient or measurement) for `nil` or empty strings.
- **Data Integrity**: By excluding null or empty values, MealMate ensures that only complete and accurate data is shown in the user interface.

## Splitting Instructions into Bullet Points

The `MDetailedView` includes functionality to split the cooking instructions into individual bullet points for better readability. This is achieved using the following approach:

- **Function**: The `splitInstructions` function splits the instructions string into individual sentences.
  ```swift
  private func splitInstructions(_ instructions: String) -> [String] {
      instructions
          .split(separator: ".")
          .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
          .filter { !$0.isEmpty }
  }
  ```
- **Display**: Each instruction is displayed as a bullet point using a custom `InstructionsCardView`.
  ```swift
  struct InstructionsCardView: View {
    var instructions: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(LinearGradient(gradient: Gradient(colors: [Color.pink.opacity(0.2), Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .shadow(radius: 5)
            
            HStack(alignment: .top, spacing: 10) {
                DessertBulletPointView()
                    .frame(width: 16, height: 16)
                    .padding(.top, 5)
                Text(instructions)
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color(.sRGB, red: 0.4, green: 0.2, blue: 0.3, opacity: 1.0))
                    .truncationMode(.tail)
                    .padding([.leading, .trailing, .bottom], 8)
                Spacer()
            }
            .padding()
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity)
    } }

## Demo Video

See MealMate in action:

https://github.com/wnjknjwnd/MealMate/assets/88301130/619dc331-1403-485a-be8a-5fe2154915b4



