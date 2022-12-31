
# ****Desenhando Sua Organização de Pastas e Projetos e Grupos de Acessos na Google Cloud Platform****

---

Para a construção da estrutura de organização, optou-se por utilizar um modelo hierárquico a fim de granularidade dos acessos, onde a organização foi segmentada em uma infraestrutura Top-Down, baseando-se principalmente de forma a contemplar a função mais ampla da organização e limitando a fim de permitir segmentar e limitar a complexidade da organização baseando-se nos projetos.


<img src="https://raw.githubusercontent.com/esiopaiva/trilha-gcp-fundations-terraform-projetosfolders/master/imagens/Arquitetura-02.jpg" data-canonical-src="https://gyazo.com/eb5c5741b6a9a16c692170a41a49c858.png" width="600" height="500" />

- **Organização:** O domínio completo da organização, todos  as subpastas devem ser contidas dentro da organização;
    - **Unidade do negócio:** são os setores funcionais da nossa organização (Financeiro, Comercial, Dev Ops). Dentro deste contexto, teremos uma pasta **“compartilhada (Shared)”** que será responsável por gerar recursos por meio de nossa conta de Serviço.  Esta pasta deve conter apenas a atribuição de permissões para os gerentes da organização;
        - **Team:** Deverá conter os interessados a trabalharem nos respectivos projetos, cada time poderá ter diversos projetos, permitindo segregar o que cada time pode gerenciar;
            - **Produto/Função:** será o que deverá ser projeto, a unidade  que irá encapsular o projeto;
                - **Ambiente Operacional:** Em qual será o ambiente que teremos em nossa organização, se é um ambiente de Desenvolvimento, Teste ou efetivamente Produção; e
                    - **Projetos:** A unidade mínima de um produto, nesta parte será encapsuladas todos os recursos que iremos utilizar.
                    
    
    ⠀⠀⠀Nossa arquitetura completa será a seguinte: 
    
    
    <img src="https://raw.githubusercontent.com/esiopaiva/trilha-gcp-fundations-terraform-projetosfolders/master/imagens/Arquitetura-01.jpg" data-canonical-src="https://gyazo.com/eb5c5741b6a9a16c692170a41a49c858.png" />

    
    [Board Iterativo dos Diagramas](https://miro.com/app/board/uXjVP2E5_a4=/?share_link_id=653415671962)
    
    ---
    
    ### Arquitetura do Github:
    
    - main.tf
        - Conterá nosso processo principal do Terraform, permitindo a criação de nossos serviços de forma automatizada.
    - serviceaccount.yml
        - Conterá as informações do nosso **service account** do GCP, contudo esse arquivo foi ocultado utilizando o .gitgnore. Apenas tenha em mente que este arquivo deverá ser criado por você e deve conter a chave de sua service account.
    
    Para testar faça o seguinte:
    
    ```docker
    terraform plan
    terraform apply
    terraform destroy
    ```
    
    Alem disso, lembre-se de ativar:
    
    - Politica de IAM : **Criador de Pastas e Criador de Projetos**
    - **Cloud Resource Manager API**
    - **Cloud Billing API**
        - Liberar a permissão da conta de faturamento para nossa service account
            - **Faturamento > Gerenciamento da Conta > Menu do Lado Direito > Adicione o Email da Service Account**
                - Libere a permissão: **Faturamento →** “Usuário da Conta de Faturamento”
