# Learning Log

A Java-based web application designed to help users track their learning progress by creating and managing topics, as well as uploading related images.

## Features

* **User Authentication:** 
  * Register new accounts
  * Secure login and logout functionality
  * User-specific dashboard
* **Topic Management:**
  * Create, view, edit, and delete learning topics
* **Image Management:**
  * Upload and associate images with learning content
* **Authentication Filter:**
  * Protects restricted routes from unauthorized access

## Technologies Used

* **Backend:** Java Servlets, JSP (JavaServer Pages)
* **Build Tool:** Maven
* **Frontend:** HTML, CSS, JSP
* **Database:** JDBC (via `DbConnection.java`)

## Project Structure

```text
src/main/
├── java/com/learninglog/learninglogproject/
│   ├── filter/      # Authentication filters
│   ├── image/       # Image upload controllers and models
│   ├── topic/       # Topic management controllers and models
│   ├── user/        # User authentication controllers and models
│   └── utils/       # Database connection and utility classes
└── webapp/
    ├── components/  # Reusable UI components (header, footer)
    ├── pages/       # JSP views (dashboard, login, topic list, etc.)
    ├── WEB-INF/     # Web application configuration (web.xml)
    └── index.jsp    # Application entry point
```

## Prerequisites

* **Java Development Kit (JDK):** Version 8 or higher recommended.
* **Maven:** Included via Maven Wrapper (`mvnw`).
* **Web Server:** Apache Tomcat or any compatible Servlet container.
* **Database:** (Ensure you configure `utils/DbConnection.java` with your local database credentials).

## Getting Started

1. **Clone the repository or navigate to the project directory:**
   ```bash
   cd learninglog
   ```

2. **Build the project using Maven:**
   ```bash
   ./mvnw clean install
   ```

3. **Deploy to your Server:**
   * Copy the generated `.war` file from the `target/` directory to your Tomcat `webapps/` directory, or deploy directly via your IDE.
   * Start your application server.

4. **Access the application:**
   * Open your browser and navigate to `http://localhost:8080/learninglog-1.0-SNAPSHOT` (or whichever context path you deployed it to).
