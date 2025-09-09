# Java Swing

* Java Swing é uma biblioteca gráfica utilizada para criar interfaces gráficas de usuário (GUIs) em Java.

* Ela permite o desenvolvimento de aplicativos com aparência visual atrativa, interatividade e comportamento dinâmico.

* O Swing faz parte do Java Foundation Classes (JFC) e disponibiliza uma ampla gama de componentes, como botões, caixas de texto, painéis e janelas, que podem ser combinados para construir interfaces ricas e modernas.

* Além disso, o Swing pode ser integrado a bancos de dados para criar sistemas completos, utilizando componentes que facilitam a interação com o usuário.

* É possível desenvolver em NetBeans (que já possui o Swing integrado) ou no Eclipse, onde é necessário instalar a extensão WindowBuilder, ferramenta que facilita a construção visual de telas usando APIs do Swing.

## Vantagens do Java Swing
* **Plataforma independente:** aplicações funcionam em diferentes sistemas operacionais sem reescrever o código.

* **Componentes personalizáveis:** aparência e comportamento podem ser adaptados conforme necessidade.

* **Variedade de componentes:** vasta coleção de elementos GUI para criar interfaces simples ou complexas.

* **Interface responsiva:** aplicações geralmente são rápidas e interativas.

* **Look and Feel consistente:** permite aplicar estilos visuais diferentes para adequar-se ao sistema operacional.

## Desvantagens do Java Swing
* **Aparência e experiência do usuário:** não possui aparência nativa em todos os sistemas operacionais, podendo gerar inconsistência visual.

* **Desempenho:** pode consumir mais recursos e ser menos responsivo em interfaces muito complexas.

* **Falta de recursos modernos:** não possui os mesmos elementos visuais e interativos de frameworks mais recentes, o que pode limitar a experiência do usuário.

# Principais Componentes do Swing
|Componente|Função do Componente|
|---|---|
|JPanel | Contêiner flexível para agrupar e organizar outros componentes|
|JButton | Botão que executa uma ação ao ser clicado|
|JLabel | Exibe texto ou imagem|
|JTextField | Campo de texto de linha única para entrada do usuário|
|JCheckBox | Caixa de seleção (ativar/desativar)|
|JRadioButton | Botão de opção que permite escolher apenas uma alternativa em um grupo|
|JTextArea | Área de texto multilinha para edição e visualização|
|JTable | Exibição e edição de dados em formato de tabela|

# Padrão de Nomenclatura
Para facilitar a leitura e manutenção do código, utiliza-se prefixos nos nomes dos componentes:
| Prefixo | Função | Componente |
| --- | --- | --- |
| btn	| Botão	| JButton |
| lbl	| Rótulo	| JLabel |
| txt	| Campo de texto	| JTextField |
| cmb	| Caixa de seleção	| JComboBox |
| chk	| Caixa de seleção	| JCheckBox |
| rad	| Botão de opção	| JRadioButton |
| tbl	| Tabela	| JTable |
| pnl	| Painel	| JPanel |

# Gerenciadores de Layout
O Swing utiliza Layouts para organizar os componentes na interface.
| Componente|Função do Componente|
| --- | --- |
| FlowLayout | Organiza componentes em linha, quebrando para a próxima se necessário|
| BorderLayout | Divide em 5 regiões (Norte, Sul, Leste, Oeste e Centro)|
| GridLayout | Organiza em uma grade regular de células|
| BoxLayout | Organiza em linha horizontal ou vertical, com opções de alinhamento|
| GridBagLayout | Maior flexibilidade no posicionamento de componentes, porém mais complexo|
| CardLayout | Permite alternar entre diferentes painéis (útil para sistemas com várias telas)|

# Estrutura dos Componentes
Cada componente Swing possui três elementos principais:
* **Properties:** propriedades como cor, fonte, tamanho, visibilidade etc.
* **Events:** eventos que podem ser programados (cliques, teclas pressionadas, mudanças de estado etc.).
* **Code:** identificação do componente, nomeação seguindo convenções e inserção de lógica do programa.

# NetBeans
Passo a passo para utilizar Java Swing no NetBeans
* Clique em “File” → “New Project”
* Selecione “Java with Ant” e “Java Application”
* Defina o nome para o projeto
* Desmarque a opção “Create Main Class”
* Clique com botão direito no nome do pacote
* “New” → “JFrame Form

<div align="center">
  
<img width="723" height="498" alt="Captura de tela 2025-09-09 002843" src="https://github.com/user-attachments/assets/21094bae-4a3c-4c42-bd12-c4a433ad99bf" />
<img width="740" height="501" alt="Captura de tela 2025-09-09 002907" src="https://github.com/user-attachments/assets/a5811069-0635-4168-9e81-6d922ea490a3" />
<img width="573" height="668" alt="Captura de tela 2025-09-09 003005" src="https://github.com/user-attachments/assets/42f20981-653d-4aa9-9cf1-af159b4121b8" />
<img width="746" height="504" alt="Captura de tela 2025-09-09 003030" src="https://github.com/user-attachments/assets/1331a49a-4212-46a0-ae08-e84cb2925176" />

</div>

