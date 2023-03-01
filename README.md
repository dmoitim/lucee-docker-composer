# lucee-docker-compose
Sobe um container docker com o Lucee e as extensões de Administração e Driver Oracle

Para "subir" o container, execute o comando:  
`docker-compose up -d`

Feito isso, basta acessar o endereço http://localhost:8888 pelo navegador.

O administrador está acessível pelo endereço, http://localhost:8888/lucee/admin/server.cfm.

OBS: Após o container estar sendo executado, foi criado um volume, e todos os fontes da pasta webroot estarão acessíveis via navegador.

Referência: https://markdrew.io/