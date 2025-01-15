# Lucee Docker Compose
Este projeto permite que você execute um contêiner Docker com o Lucee e as extensões de Administração e Driver Oracle.

## Como usar
1. Execute o seguinte comando para iniciar o contêiner:  
`docker compose up -d`

2. Acesse o endereço http://localhost:8888 no seu navegador.

3. O painel de administração está disponível em http://localhost:8888/lucee/admin/index.cfm.

4. Após o contêiner estar em execução, todos os arquivos da pasta webroot estarão acessíveis via navegador.

## Referência
Este projeto foi inspirado por:
- https://markdrew.io/
- https://github.com/lucee/lucee-docs/tree/master/examples/docker