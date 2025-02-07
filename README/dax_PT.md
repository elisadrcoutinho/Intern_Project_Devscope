# **Documentação das Medidas DAX**

## **Introdução**

Esta documentação descreve as fórmulas DAX utilizadas para calcular as métricas no projeto de monitoramento de performance e análise do desempenho dos estagiários. As métricas são baseadas em respostas obtidas através de questionários diários, onde os estagiários fornecem informações sobre suas atividades, tempo gasto em tarefas, dificuldades enfrentadas e sentimentos relacionados ao desempenho.

As fórmulas DAX aqui apresentadas são divididas em diferentes categorias de cálculos: contagem de respostas booleanas, médias por indicador, cálculos percentuais, pontuação de métricas e a avaliação final da performance. Estas fórmulas foram projetadas para fornecer insights detalhados sobre a eficiência das tarefas, a complexidade do trabalho, as interrupções, a comunicação e o sentimento dos estagiários.

Cada seção descreve uma fórmula específica, com explicações detalhadas de como cada métrica é calculada e sua importância para o acompanhamento do desempenho dos estagiários no projeto.
## 1. Contagem de Respostas Booleanas

### **No**
Conta o número de respostas "Não" (valor booleano 0) registradas na tabela `responses`.
```DAX
No = 
CALCULATE(
    COUNTROWS(responses),
    responses[BooleanResponse] = 0
)
```

### **Yes**
Conta o número de respostas "Sim" (valor booleano 1) registradas na tabela `responses`.
```DAX
Yes = 
CALCULATE(
    COUNTROWS(responses),
    responses[BooleanResponse] = 1
)
```

### **Difficulties**
Filtra e conta o número de respostas "Sim" para a pergunta sobre dificuldades enfrentadas (QuestionID = 15).
```DAX
Difficulties = 
CALCULATE(
    [Yes],
    responses[QuestionID] = 15
)
```

### **Interruptions**
Filtra e conta o número de respostas "Sim" para a pergunta sobre interrupções no dia (QuestionID = 3).
```DAX
Interruptions = 
CALCULATE(
    [Yes],
    responses[QuestionID] = 3
)
```

---
## 2. Cálculo de Médias por Indicador

### **Sentiment**
Calcula a média das respostas Likert para a pergunta de avaliação do próprio desempenho (QuestionID = 17).
```DAX
Sentiment = 
CALCULATE(
    AVERAGE(responses[LikertResponse]),
    responses[QuestionID] = 17
)
```

### **Required Time**
Calcula a média do tempo adicional necessário para concluir as tarefas (QuestionID = 6).
```DAX
Required Time = 
CALCULATE(
    AVERAGE(responses[TimeResponse]),
    responses[QuestionID] = 6
)
```

### **Planned Task**
Calcula a média do número de tarefas planeadas pelos estagiários (QuestionID = 1).
```DAX
Planned Task = 
CALCULATE(
    AVERAGE(responses[TaskResponse]),
    responses[QuestionID] = 1
)
```

### **Task Completed**
Calcula a média do número de tarefas concluídas pelos estagiários (QuestionID = 2).
```DAX
Task Completed = 
CALCULATE(
    AVERAGE(responses[TaskResponse]),
    responses[QuestionID] = 2
)
```

### **Time in Communication**
Calcula a média do tempo gasto em comunicação (QuestionID = 12).
```DAX
Time in Communication = 
CALCULATE(
    AVERAGE(responses[TimeResponse]),
    responses[QuestionID] = 12
)
```

### **Complexity**
Calcula a média da complexidade percebida das tarefas (QuestionID = 7).
```DAX
Complexity = 
CALCULATE(
    AVERAGE(responses[LikertResponse]),
    responses[QuestionID] = 7
)
```

---
## 3. Cálculo de Percentuais

### **Completed Task Percentage**
Calcula o percentual de tarefas concluídas em relação às tarefas planeadas.
```DAX
Completed Task Percentage = 
VAR Planned = [Planned Task] 
VAR Completed = [Task Completed]
RETURN
    DIVIDE(Completed, Planned, 0) * 100  
```

### **Time Required Percentage**
Calcula o percentual de tempo adicional necessário em relação a um tempo máximo pré-definido (60 minutos).
```DAX
Time Required Percentage = 
VAR Time_Now = [Required Time] 
VAR Max_Time = 60
RETURN
    DIVIDE(Time_Now, Max_Time, 0) * 100  
```

---
## 4. Cálculo de Scores

### **Tasks Score**
Converte o percentual de tarefas concluídas em um score de 1 a 5.
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
Converte o percentual de tempo adicional necessário em um score de 1 a 5.
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
Converte o tempo gasto em comunicação em um score de 1 a 5.
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
Converte a média de complexidade das tarefas em um score de 1 a 5.
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
Converte a média do sentimento do estagiário sobre seu desempenho em um score de 1 a 5.
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
## 5. Cálculo da Performance Final

### **Performance**
Calcula a performance geral do estagiário com base na média dos scores individuais das métricas analisadas.
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


