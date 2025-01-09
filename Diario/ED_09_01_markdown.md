# Plataforma de Coleta e Análise de Dados para Estagiários


## Introdução
O projeto tem como objetivo desenvolver uma plataforma que coleta e organiza informações sobre a evolução e desenvolvimento de estagiários 
dentro da empresa. A plataforma será utilizada tanto pelos estagiários quanto pelos tutores, oferecendo uma experiência simples e 
objetiva de preenchimento de formulários diários, seja em desktop ou mobile. Os dados coletados serão analisados para gerar insights 
relevantes sobre o progresso dos estagiários.

## Objetivos do Projeto

### Objetivo Geral
- Criar uma plataforma intuitiva e eficiente para coletar e analisar informações sobre o desenvolvimento de estagiários.

### Objetivos Específicos
1. Desenvolver um sistema de questionários simples e objetivo para coleta diária de dados.
2. Implementar diferenciais que tornem a plataforma mais atrativa e útil, como:
3. Garantir compatibilidade com dispositivos desktop e mobile.
4. Pesquisar plataformas similares no mercado e propor inovações que se destaquem.
5. Implementar integração com Power BI para gerar relatórios automatizados

## Metodologia

### Etapas do Desenvolvimento
1. **Estruturar a ideia inicial**:
   - ~~Definir o público-alvo: estagiários e tutores.~~
   - ~~Listar perguntas relevantes para o formulário.~~
2. **Pesquisa de Mercado**:
   - ~~Identificar plataformas já existentes.~~
   - ~~Levantar pontos fortes e fracos das soluções atuais.~~
3. **Propor Inovações**:
   - Sistema de gamificação com pontuações e recompensas visuais (medalhas).
   - Introduzir análises de sentimento para identificar o estado emocional dos estagiários e tutores.
4. **Desenvolvimento da Plataforma** (fases futuras).

## Avanços

### 2025-01-08
- **Atividades Realizadas**:
  - Início da pesquisa de mercado sobre plataformas similares.
  - Identificação de possíveis diferenciais para a plataforma:
    - Gamificação para engajamento.
    - Implementação futura de análise de sentimento.
- **Desafios Encontrados**:
  - Dificuldade inicial em definir o que diferencia a plataforma de concorrentes.
- **Soluções Implementadas**:
  - Listagem de diferenciais que podem ser desenvolvidos em fases futuras.

## Próximos Passos
1. ~~Finalizar a pesquisa de plataformas concorrentes.~~
2. ~~Elaborar um esboço do questionário (estagiário e tutor).~~
3. Iniciar o planejamento técnico para a implementação da gamificação.
4. Estudar métodos para análise de sentimento com ferramentas acessíveis.
5. Modelagem de dados:
   - Definir a estrutura de dados que será usada para armazenar as informações dos estagiários, tutores, feedbacks, pontos da gamificação, interações, etc.
   - Planejar a exportação de dados para o Power BI, garantindo que as informações estejam em formatos compatíveis com a ferramenta de análise.

## Avanços

### 2025-01-09
- **Atividades Realizadas**:
  - Identificar elementos comuns e boas práticas em grelhas de avaliação;
  - Esboço inicial das perguntas para o formulário, já vinculando cada uma às variáveis correspondentes. (Em anexo)
- **Desafios Encontrados**:
  - Definição clara de quais perguntas são mais relevantes para garantir uma avaliação consistente e eficiente.
- **Soluções Implementadas**:
  - Organização das perguntas por tópicos e categorização das variáveis associadas para facilitar futuras revisões.

## Próximos Passos

1. **Definir as Métricas com a Área de Negócios**:
   - Identificar as métricas de desempenho que serão mais relevantes para avaliar o progresso do estagiário, tutor e do programa de estágio como um todo.
   - Exemplos de métricas a considerar:
     - Desempenho do estagiário (ex.: número de tarefas concluídas, evolução das habilidades).
     - Qualidade do feedback (ex.: feedback positivo vs. negativo, tempo de resposta).
     - Engajamento na comunicação e autonomia.
   - Garantir que as métricas definidas sejam mensuráveis, alcançáveis e alinhadas aos objetivos do negócio.
   
3. **Modelagem de Dados**:
   - **Definir a estrutura do banco de dados**:
     - Escolher o tipo de banco de dados mais adequado, levando em consideração os requisitos para integração com Power BI.
     - Criar um modelo de dados que inclua tabelas relacionadas aos estagiários, tutores, feedbacks, habilidades técnicas e comportamentais, interações, gamificação e pontos.
   - **Planejar o esquema de dados**:
     - Definir os tipos de dados e os relacionamentos entre as tabelas.
     - Planejar as chaves primárias e estrangeiras para garantir a integridade dos dados.
     - Considerar a estrutura necessária para garantir que os dados sejam facilmente exportáveis e compatíveis com o Power BI.

4. **Criação de Dados Fictícios**:
   - Criar um dataset fictício que simule os dados reais necessários para as análises.
   - Garantir que o dataset cubra todas as variáveis que serão utilizadas nas análises 
   - Criar dados com uma variedade de cenários para garantir que a análise seja robusta, incluindo diferentes tipos de feedback, tarefas realizadas, níveis de autonomia e comunicação.
   - Garantir que os dados estejam em um formato adequado para a integração com o Power BI.

5. **Exploração do Dataset**:
   - Analisar o dataset fictício criado, realizar a limpeza e pré-processamento dos dados.
   - Explorar as variáveis e características dos dados para entender as relações entre elas.
   - Verificar a qualidade dos dados e tratar possíveis valores ausentes, outliers e inconsistências.

6. **Análise Exploratória de Dados (EDA)**:
   - Realizar a análise exploratória de dados para descobrir padrões, tendências e insights importantes.
   - Gerar estatísticas descritivas para cada variável, como médias, medianas e desvios padrões.
   - Investigar a correlação entre variáveis para identificar possíveis relações significativas.

7. **Seleção dos Melhores Gráficos e Visualizações**:
   - Identificar os tipos de gráficos mais adequados para as variáveis e os insights a serem comunicados.
   - Criar visualizações interativas que ajudem a contar a história dos dados, facilitando a compreensão das métricas.
   - Explorar o uso de dashboards para consolidar as visualizações e facilitar a análise contínua.

8. **Criação de Dashboards**:
   - Desenvolver dashboards no Power BI ou outras ferramentas que permitam uma visualização clara e intuitiva dos dados.
   - Integrar gráficos e indicadores de performance (KPIs) que ajudem na análise do desempenho dos estagiários, feedbacks, e progresso da gamificação.

9. **Automatização de Relatórios**:
   - Estudar técnicas para automatizar a geração de relatórios baseados nos dados analisados, garantindo que as atualizações de dados sejam refletidas automaticamente nos relatórios.
   - Implementar a geração periódica de relatórios, incluindo insights sobre o desempenho dos estagiários, feedbacks recebidos, evolução das metas, etc.




```python

```
