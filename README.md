# CJ Memo Application

CJ Memo is a simple memo application built using the Cjoy framework and Cangjie language. This application allows users to create, view, and delete memos easily.

## Features

- Create new memos with a title and content.
- View all existing memos.
- Delete memos by their ID.

## Project Structure

```
cj-memo
├── src
│   ├── main.cj                # Entry point of the application
│   ├── controllers
│   │   └── memo_controller.cj  # Handles memo-related requests
│   ├── models
│   │   └── memo.cj             # Defines the Memo model
│   ├── routes
│   │   └── routes.cj           # Sets up application routes
│   ├── services
│   │   └── storage.cj          # Provides storage services for memos
│   ├── templates
│   │   └── index.tpl           # Main template for the application
│   └── static
│       ├── css
│       │   └── style.css       # Styles for the application
│       └── js
│           └── app.js          # Frontend JavaScript code
├── tests
│   └── memo_test.cj            # Unit tests for memo functionality
├── .gitignore                  # Files and directories to ignore in version control
├── cj.toml                     # Cjoy framework configuration file
└── README.md                   # Project documentation
```

## Installation

1. Clone the repository:
   ```
   git clone <repository-url>
   ```
2. Navigate to the project directory:
   ```
   cd cj-memo
   ```
3. Install dependencies (if any).

## Usage

To run the application, execute the following command:
```
cjoy run src/main.cj
```

The application will start on `http://127.0.0.1:18881`. You can access the memo functionalities through the defined routes.

## Contributing

Contributions are welcome! Please feel free to submit a pull request or open an issue for any enhancements or bug fixes.

## License

This project is licensed under the MIT License.