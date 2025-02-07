# **README - Análise de Performance de Estagiários**

## **Objetivo do Projeto**

Este projeto tem como objetivo medir e acompanhar a evolução e o desempenho dos estagiários durante sua jornada de aprendizado. Através de uma plataforma de questionário diária, buscamos identificar as áreas de melhoria, medir o desempenho e analisar a performance e o desempenho geral de cada estagiário, com base nas métricas coletadas. A plataforma foi projetada para ser simples e objetiva, facilitando a coleta de dados sem sobrecarregar os estagiários com questionários longos ou complexos.

## **Problema a Ser Resolvido**

Estagiários frequentemente enfrentam desafios durante suas jornadas de aprendizado. Para que seus tutores possam intervir de forma eficaz, é necessário medir rapidamente o desempenho dos estagiários e identificar quando eles estão enfrentando dificuldades, qual o tempo adicional que precisam para realizar tarefas, como estão gerenciando as tarefas planejadas e completadas, e o nível de complexidade das tarefas que estão sendo atribuídas. O desafio é encontrar um meio eficiente e prático de coletar essas informações, de forma a não comprometer a experiência do estagiário nem sobrecarregar o processo de análise de dados.

## **Solução Desenvolvida**

A solução foi baseada no desenvolvimento de uma plataforma web que coleta dados diários dos estagiários por meio de um questionário estruturado. As perguntas são fechadas (com opções de múltipla escolha ou seleção única), garantindo agilidade e objetividade no preenchimento, ao mesmo tempo que fornecem dados relevantes para análise. As áreas avaliadas incluem:
- **Habilidades Técnicas**: Avaliação da capacidade do estagiário em executar tarefas relacionadas a conhecimentos técnicos, monitorando o tempo adicional necessário e a complexidade das tarefas atribuídas.
- **Habilidades Comportamentais**: Medição do comportamento do estagiário, incluindo a gestão de tarefas planejadas e concluídas, identificação de dificuldades enfrentadas, e a habilidade de lidar com interrupções durante a execução das tarefas.
- **Comunicação**: Análise do tempo gasto em comunicação e do sentimento geral do estagiário em relação ao seu desempenho, proporcionando uma visão sobre como a interação e a troca de informações impactam sua evolução.

Essas informações são analisadas em Power BI, com um dashboard interativo que apresenta três páginas principais de visualização de dados:
1. **Performance Individual**: Apresenta o desempenho de cada estagiário em relação às habilidades técnicas, gestão de tarefas, dificuldades e comunicação, por meio de gráficos interativos.
2. **Visão Geral das Métricas**: Exibe as médias das principais métricas, como tempo adicional, sentimento geral sobre o desempenho, e os totais de dificuldades e interrupções enfrentadas.
3. **Ranking dos Estagiários**: Classifica os estagiários conforme suas pontuações em diversas métricas, utilizando medidas DAX para calcular a performance global e a evolução.

## **Estrutura de Dados**

A base de dados foi estruturada em quatro tabelas principais, garantindo a organização e a integridade dos dados coletados:
1. **Perguntas**: Contém as perguntas do questionário que são feitas aos estagiários.
2. **Respostas**: Armazena as respostas dos estagiários, associando cada uma às perguntas correspondentes.
3. **Usuários**: Contém informações sobre os estagiários, como identificação, nome e outras características relevantes.
4. **Respostas Pré-definidas**: Define as respostas possíveis para cada pergunta, incluindo valores booleanos, numéricos ou escalas (como a escala Likert de 1 a 5). Além disso, algumas perguntas podem ter respostas em texto, como a descrição das habilidades técnicas. Os IDS são usadas para associar as respostas às perguntas correspondentes, garantindo que as respostas textuais ou descritivas sejam corretamente registradas e analisadas.

## **Modelo Relacional**

O modelo relacional da base de dados é descrito pelas seguintes tabelas e suas relações:

- **Tabela Perguntas**:
  - perguntaID (PK): Identificador único para cada pergunta.
  - texto_pergunta: Texto explicativo da pergunta.
  - opcoes: Tipo de resposta (númerica,boleana, Likert).

- **Tabela Respostas**:
  - respostaID (PK): Identificador único para cada resposta.
  - usuarioID (FK): Chave estrangeira referenciando a tabela Usuários.
  - perguntaID (FK): Chave estrangeira referenciando a tabela Perguntas.
  - id_usuario (FK): Chave estrangeira referenciando a tabela Usuários.
  - resposta: Resposta dada pelo estagiário (pode ser texto ou número, dependendo da pergunta).
  - predefinidaID: Chave estrangeira referenciando a tabela Respostas Pré-definidas.

- **Tabela Usuários**:
  - usuarioID (PK): Identificador único para cada estagiário.
  - nome: Nome do estagiário.
  - tipo: Tipo: estagiário, tutor ou administardor. (Para implementação futura)
  - password: Palavra-passe do estagiário.
  - email: E-mail do estagiário.
  - data_nascimento: Data de nascimento do estagiário.
  - projeto: Nome do projeto em que o estagiário está envolvido. (Para implementação futura)

- **Tabela Respostas Pré-definidas**:
  - resposta_predefinidaID (PK): Identificador único para cada opção de resposta.
  - texto: Descrição da opção de resposta.
  - tipo: Área relacionada (Para implementação futura)

Esse modelo relacional descreve as chaves primárias e estrangeiras que garantem a integridade e interconectividade dos dados, permitindo um fácil entendimento das relações entre as tabelas.

## **Tecnologias Utilizadas**

- **Website**: HTML, CSS, Node.js e React foram utilizados para o front-end do questionário, garantindo uma interface simples, dinâmica e intuitiva.
- **API**: Uma API foi criada utilizando Node.js para integrar o back-end ao banco de dados, além de conectar o front-end ao back-end, garantindo a comunicação eficiente entre a interface do usuário e a base de dados.
- **Banco de Dados**: MongoDB foi utilizado para armazenar as respostas dos estagiários, enquanto SQL foi empregado para a organização e estruturação dos dados relacionados às perguntas, garantindo modelagem, coleta e consulta eficientes.
- **Análise de Dados e Visualização**: Power BI foi utilizado para análise e visualização dos dados, com um dashboard interativo que permite ao usuário explorar os dados de forma intuitiva.
- **DAX**: Utilizado no Power BI para o cálculo das métricas e pontuações dos estagiários, baseando-se nos dados coletados pelo questionário e oferecendo insights sobre o desempenho dos estagiários.

## **Próximos Passos**
- **Melhorias na Plataforma**: Com base no feedback de estagiários e tutores, será possível fazer melhorias na interface e nas perguntas do questionário, visando uma experiência ainda mais eficaz.
- **Integração com Outros Sistemas**: Planeja-se integrar a coleta de dados diretamente com sistemas de gestão de estagiários, permitindo um fluxo contínuo de dados sem a necessidade de inserções manuais.
- **Expansão das Métricas**: O conjunto de métricas pode ser expandido para incluir outras áreas de avaliação de desempenho, como habilidades interpessoais e evolução ao longo do tempo.

## **Conclusão**

Este projeto proporciona uma maneira eficaz e eficiente de medir o desempenho e a evolução dos estagiários, fornecendo informações valiosas para a intervenção precoce dos tutores. Com a implementação de um dashboard interativo, os gestores podem monitorar o progresso dos estagiários, identificar áreas de melhoria e realizar ajustes rápidos para garantir a evolução contínua dos mesmos.

---

## **Anexos**

Você encontrará os anexos que complementam a análise e a implementação do projeto:

1. **Anexo 1: Medidas DAX**  
   Este anexo contém as expressões DAX utilizadas para calcular as métricas de desempenho dos estagiários, como o cálculo da performance global, a evolução de cada estagiário ao longo do tempo e o ranking geral. Essas medidas são cruciais para a visualização interativa no Power BI e para a geração de relatórios detalhados sobre o desempenho.

2. **Anexo 2: Medidor de Desempenho**  
   O medidor de desempenho apresenta uma fórmula abrangente que analisa as respostas dos estagiários de forma quantitativa e qualitativa, proporcionando uma visão geral das áreas de melhoria para cada estagiário. O anexo detalha como esse medidor foi configurado no Power BI para refletir com precisão o progresso dos estagiários.

Esses anexos são importantes para compreender a forma como as métricas são calculadas e como o desempenho dos estagiários é monitorado ao longo do tempo, servindo como base para ajustes no processo de aprendizado e intervenção dos tutores.