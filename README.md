# Armazenamento AWS S3 (Site estático)

O objetivo desta atividade é explorar na prática os conceitos de armazenamento utilizando o serviço AWS Simple Storage Service (S3). 

O Amazon S3 pode ser utilizado para hospedar sites estáticos.

Hospedar um site estático no Amazon S3 proporciona um site altamente escalável e de alto desempenho por uma fração do custo de um servidor Web tradicional.

Para hospedar um site estático no Amazon S3, configure um bucket do Amazon S3 para hospedagem e faça upload do conteúdo do seu site.

> Referência: [https://docs.aws.amazon.com/pt_br/AmazonS3/latest/userguide/WebsiteHosting.html](https://docs.aws.amazon.com/pt_br/AmazonS3/latest/userguide/WebsiteHosting.html)

<br>

## Arquitetura alvo

![Notifier](/images/target_architecture.png)

<br>

## Passo a passo

1. Faça login no AWS Console.

2. Em **Serviços** selecione **S3**.

3. Selecione **Criar bucket**.

4. Na tela de criação de bucket preencha com as informações abaixo e no final da tela clique em  **Criar bucket**.

   > **ATENÇÃO !!!** Substitua o texto **Bucket-Name** por um nome de Bucket qualquer. Mantenha as demais opções padrões. 

   - **nome**: `Bucket-Name`
   - **região**: Norte da Virgínia (us-east-1)
   - **ACLs habilitadas**: selecionado
   - **Bloquear todo o acesso público**: desabilitado
   - **Reconheço que as configurações atuais podem fazer com que este bucket e os objetos dentro dele se tornem públicos:** selecionado
   - **Versionamento de Bucket**: Ativar<br><br>

5. Clique sobre o nome do bucket criado.

6. No menu **Permissões** navegue até **Lista de controle de acesso (ACL)**, clique em **Editar**, selecione as opções **Listar** e **Leitura** para o beneficiário **Todos (acesso público)**, marque a opção **Compreendo os efeitos dessas alterações em meus objetos e buckets** e clique em **Salvar alterações**. 

7. Faça download dos arquivos [index.html](https://github.com/kledsonhugo/app-static-site-s3/blob/main/app/index.html) e [error.html](https://github.com/kledsonhugo/app-static-site-s3/blob/main/app/error.html).

   > **ATENÇÃO !!!** Caso você não esteja logado no GitHub, não aparecerá a opção para download. Nesse caso copie o conteúdo do arquivo no GitHub, crie um arquivo na sua máquina (escolha qualquer local de sua preferência) e cole o conteúdo copiado dentro do novo arquivo. Faça isso tanto para o arquivo index.html, quanto para o arquivo error.html.
 
8. No menu **Objetos** clique em **Carregar**.

   - Selecione **Adicionar arquivos**
   - Busque pelos arquivos `index.html` e `error.html` baixados anteriormente e os selecione
   - Em **Permissões**, selecione **Conceder acesso público de leitura**
   - Marque a opção **Compreendo o risco de conceder acesso público de leitura aos objetos especificados**
   - Clique em **Carregar**
   - Clique em **Fechar**<br><br>

9. No menu **Propriedades** navegue até **Hospedagem de Site estático**, clique em **Editar**, preencha com as informações abaixo e clique em **Salvar alterações**.

   - Hospedagem de site estático: `Ativar`
   - Documento de índice: `index.html`
   - Documento de erro opcional: `error.html`<br><br>

10. No menu **Propriedades** navegue até **Hospedagem de Site estático** e clique na url **Endpoint de site de bucket**.

<br>

**SUCESSO !!!** O sucesso dessa atividade será a abertura de uma página web pública na Internet mostrando o conteúdo do arquivo `index.html` hospedado no serviço AWS S3. Parabéns !!!