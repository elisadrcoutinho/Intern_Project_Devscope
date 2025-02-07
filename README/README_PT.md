# **README - Intern Performance Analysis**

## **Project Objective**

The goal of this project is to measure and track the progress and performance of interns throughout their learning journey. Through a daily questionnaire platform, we aim to identify areas of improvement, measure performance, and analyze the overall performance and progress of each intern based on the collected metrics. The platform is designed to be simple and straightforward, facilitating data collection without overwhelming interns with lengthy or complex questionnaires.

## **Problem to Be Solved**

Interns often face challenges during their learning journeys. In order for their mentors to intervene effectively, it is necessary to quickly measure the performance of interns and identify when they are facing difficulties, how much additional time they need to complete tasks, how they are managing planned and completed tasks, and the complexity level of the tasks assigned. The challenge is to find an efficient and practical way to gather this information without compromising the intern's experience or overloading the data analysis process.

## **Developed Solution**

The solution is based on the development of a web platform that collects daily data from interns through a structured questionnaire. The questions are closed-ended (with multiple-choice or single selection options), ensuring speed and objectivity in completion, while providing relevant data for analysis. The areas assessed include:
- **Technical Skills**: Evaluation of the intern's ability to perform tasks related to technical knowledge, tracking the additional time needed and the complexity of the tasks assigned.
- **Behavioral Skills**: Measurement of the intern's behavior, including task management (planned and completed), identifying difficulties faced, and the ability to handle interruptions during task execution.
- **Communication**: Analysis of the time spent on communication and the intern's overall sentiment towards their performance, providing insights on how interaction and information exchange impact their progress.

This information is analyzed in Power BI, with an interactive dashboard presenting three main data visualization pages:
1. **Individual Performance**: Displays the performance of each intern in relation to technical skills, task management, difficulties, and communication through interactive charts.
2. **Overview of Metrics**: Shows the averages of key metrics, such as additional time, overall sentiment on performance, and totals for difficulties and interruptions encountered.
3. **Intern Ranking**: Ranks the interns based on their scores across various metrics, using DAX measures to calculate overall performance and progress.

## **Data Structure**

The database is structured into four main tables, ensuring the organization and integrity of the collected data:
1. **Questions**: Contains the questions from the questionnaire asked to the interns.
2. **Responses**: Stores the responses from the interns, associating each one with the corresponding question.
3. **Users**: Contains information about the interns, such as identification, name, and other relevant characteristics.
4. **Predefined Responses**: Defines the possible answers for each question, including boolean, numeric, or scale values (such as the Likert scale from 1 to 5). Additionally, some questions may have text responses, such as a description of technical skills. The IDs are used to associate responses with their corresponding questions, ensuring that textual or descriptive answers are correctly recorded and analyzed.

## **Relational Model**

The relational model of the database is described by the following tables and their relationships:

- **Questions Table**:
  - `questionID` (PK): Unique identifier for each question.
  - `question_text`: The explanatory text of the question.
  - `options`: Type of answer (numeric, boolean, Likert).

- **Responses Table**:
  - `responseID` (PK): Unique identifier for each response.
  - `userID` (FK): Foreign key referencing the Users table.
  - `questionID` (FK): Foreign key referencing the Questions table.
  - `user_id` (FK): Foreign key referencing the Users table.
  - `response`: Answer given by the intern (could be text or number depending on the question).
  - `predefinedID`: Foreign key referencing the Predefined Responses table.

- **Users Table**:
  - `userID` (PK): Unique identifier for each intern.
  - `name`: Name of the intern.
  - `type`: Type (intern, mentor, or administrator). (For future implementation)
  - `password`: Intern's password.
  - `email`: Intern's email.
  - `birth_date`: Intern's birthdate.
  - `project`: Name of the project the intern is involved in. (For future implementation)

- **Predefined Responses Table**:
  - `predefined_responseID` (PK): Unique identifier for each predefined response option.
  - `text`: Description of the response option.
  - `type`: Related area (For future implementation)

This relational model describes the primary and foreign keys that ensure data integrity and connectivity, making it easy to understand the relationships between the tables.

## **Technologies Used**

- **Website**: HTML, CSS, Node.js, and React were used for the front-end of the questionnaire platform, ensuring a simple, dynamic, and intuitive interface.
- **API**: An API was created using Node.js to integrate the back-end with the database and connect the front-end to the back-end, ensuring efficient communication between the user interface and the database.
- **Database**: MongoDB was used to store the responses of the interns, while SQL was used to organize and structure the data related to the questions, ensuring efficient modeling, collection, and querying of data.
- **Data Analysis and Visualization**: Power BI was used for data analysis and visualization, with an interactive dashboard that allows users to explore data in an intuitive way.
- **DAX**: Used in Power BI to calculate metrics and scores for interns based on the data collected from the questionnaire, offering insights into intern performance.

## **Next Steps**
- **Platform Improvements**: Based on feedback from interns and mentors, improvements can be made to the interface and the questions in the questionnaire to ensure a more effective experience.
- **Integration with Other Systems**: There are plans to integrate data collection directly with intern management systems, allowing a continuous flow of data without the need for manual data entry.
- **Expansion of Metrics**: The set of metrics may be expanded to include other areas of performance evaluation, such as interpersonal skills and long-term development.

## **Conclusion**

This project provides an effective and efficient way to measure the performance and progress of interns, providing valuable insights for early intervention by mentors. By implementing an interactive dashboard, managers can track intern progress, identify areas of improvement, and make quick adjustments to ensure continuous development.

---

## **Appendices**

You will find the appendices that complement the analysis and implementation of the project:

1. **Appendix 1: DAX Measures**  
   This appendix contains the DAX expressions used to calculate the intern performance metrics, such as calculating global performance, intern progress over time, and the overall ranking. These measures are crucial for interactive visualization in Power BI and for generating detailed performance reports.

2. **Appendix 2: Performance Metric**  
   The performance metric presents a comprehensive formula that quantitatively and qualitatively analyzes interns' responses, providing an overview of areas for improvement for each intern. The appendix details how this metric was configured in Power BI to accurately reflect the intern's progress.

These appendices are important for understanding how the metrics are calculated and how intern performance is monitored over time, serving as a basis for adjustments in the learning process and mentor interventions.