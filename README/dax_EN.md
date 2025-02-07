
# **DAX Measures Documentation**

## **Introduction**

This documentation describes the DAX formulas used to calculate the metrics in the intern performance monitoring and analysis project. The metrics are based on responses obtained through daily questionnaires, where interns provide information about their activities, time spent on tasks, challenges faced, and feelings related to performance.

The DAX formulas presented here are divided into different categories of calculations: counting boolean responses, averages by indicator, percentage calculations, metric scores, and final performance evaluation. These formulas are designed to provide detailed insights into task efficiency, work complexity, interruptions, communication, and intern sentiment.

Each section describes a specific formula, with detailed explanations of how each metric is calculated and its importance for monitoring intern performance in the project.

## 1. Counting Boolean Responses

### **No**
Counts the number of "No" responses (boolean value 0) recorded in the `responses` table.
```DAX
No = 
CALCULATE(
    COUNTROWS(responses),
    responses[BooleanResponse] = 0
)
```

### **Yes**
Counts the number of "Yes" responses (boolean value 1) recorded in the `responses` table.
```DAX
Yes = 
CALCULATE(
    COUNTROWS(responses),
    responses[BooleanResponse] = 1
)
```

### **Difficulties**
Filters and counts the number of "Yes" responses for the question about difficulties faced (QuestionID = 15).
```DAX
Difficulties = 
CALCULATE(
    [Yes],
    responses[QuestionID] = 15
)
```

### **Interruptions**
Filters and counts the number of "Yes" responses for the question about interruptions during the day (QuestionID = 3).
```DAX
Interruptions = 
CALCULATE(
    [Yes],
    responses[QuestionID] = 3
)
```

---
## 2. Average Calculations by Indicator

### **Sentiment**
Calculates the average Likert responses for the self-performance evaluation question (QuestionID = 17).
```DAX
Sentiment = 
CALCULATE(
    AVERAGE(responses[LikertResponse]),
    responses[QuestionID] = 17
)
```

### **Required Time**
Calculates the average additional time needed to complete tasks (QuestionID = 6).
```DAX
Required Time = 
CALCULATE(
    AVERAGE(responses[TimeResponse]),
    responses[QuestionID] = 6
)
```

### **Planned Task**
Calculates the average number of tasks planned by interns (QuestionID = 1).
```DAX
Planned Task = 
CALCULATE(
    AVERAGE(responses[TaskResponse]),
    responses[QuestionID] = 1
)
```

### **Task Completed**
Calculates the average number of tasks completed by interns (QuestionID = 2).
```DAX
Task Completed = 
CALCULATE(
    AVERAGE(responses[TaskResponse]),
    responses[QuestionID] = 2
)
```

### **Time in Communication**
Calculates the average time spent on communication (QuestionID = 12).
```DAX
Time in Communication = 
CALCULATE(
    AVERAGE(responses[TimeResponse]),
    responses[QuestionID] = 12
)
```

### **Complexity**
Calculates the average perceived complexity of tasks (QuestionID = 7).
```DAX
Complexity = 
CALCULATE(
    AVERAGE(responses[LikertResponse]),
    responses[QuestionID] = 7
)
```

---
## 3. Percentage Calculations

### **Completed Task Percentage**
Calculates the percentage of completed tasks compared to planned tasks.
```DAX
Completed Task Percentage = 
VAR Planned = [Planned Task] 
VAR Completed = [Task Completed]
RETURN
    DIVIDE(Completed, Planned, 0) * 100  
```

### **Time Required Percentage**
Calculates the percentage of additional time required compared to a pre-defined maximum time (60 minutes).
```DAX
Time Required Percentage = 
VAR Time_Now = [Required Time] 
VAR Max_Time = 60
RETURN
    DIVIDE(Time_Now, Max_Time, 0) * 100  
```

---
## 4. Score Calculations

### **Tasks Score**
Converts the percentage of completed tasks into a score from 1 to 5.
```DAX
Tasks Score = 
VAR Task_Percentage = [Completed Task Percentage]
RETURN
    SWITCH(
        TRUE(),
        Task_Percentage <= 20, 5,  
        Task_Percentage <= 40, 4,
        Task_Percentage <= 60, 3, 
        Task_Percentage <= 80, 2, 
        1
    )
```

### **Required Time Score**
Converts the percentage of additional time required into a score from 1 to 5.
```DAX
Required Time Score = 
VAR Required = [Time Required Percentage]
RETURN
    SWITCH(
        TRUE(),
        Required <= 10, 5,  
        Required <= 20, 4,
        Required <= 40, 3, 
        Required <= 60, 2, 
        1
    )
```

### **Communication Score**
Converts the time spent on communication into a score from 1 to 5.
```DAX
Communication Score = 
VAR Time_Now = [Time in Communication]
RETURN
    SWITCH(
        TRUE(),
        Time_Now <= 10, 5,  
        Time_Now <= 20, 4,
        Time_Now <= 40, 3, 
        Time_Now <= 60, 2, 
        1
    )
```

### **Complexity Score**
Converts the average task complexity into a score from 1 to 5.
```DAX
Complexity Score = 
VAR Complexity = [Complexity]
RETURN
    SWITCH(
        TRUE(),
        Complexity >= 4.5, 5,
        Complexity >= 3.5, 4,
        Complexity >= 2.5, 3,
        Complexity >= 1.5, 2,
        1
    )
```

### **Sentiment Score**
Converts the average intern sentiment about their performance into a score from 1 to 5.
```DAX
Sentiment Score = 
VAR Sentiment = [Sentiment]
RETURN
    SWITCH(
        TRUE(),
        Sentiment >= 4.5, 5,
        Sentiment >= 3.5, 4,
        Sentiment >= 2.5, 3,
        Sentiment >= 1.5, 2,
        1
    )
```

---
## 5. Final Performance Calculation

### **Performance**
Calculates the overall performance of the intern based on the average of individual metric scores.
```DAX
Performance = 
VAR Tasks = [Tasks Score]
VAR Communication = [Communication Score]
VAR Required_Time = [Required Time Score]
VAR Complexity = [Complexity Score]
VAR Sentiment = [Sentiment Score]
VAR Total = 5
RETURN
    DIVIDE(
        Tasks + Communication + Required_Time + Complexity + Sentiment,
        Total,
        0
    )
```

