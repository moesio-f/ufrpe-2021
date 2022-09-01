# Structured Query Language (SQL)

- SQL ainda é extremamente utilizado em diversos SGBDs comerciais;
- Na cadeira, aprendemos um geral mas devemos utilizar a documentação do SGBD para entender as peculiaridades;

## SQL como uma DDL

- **Data Definition Language**: define a estrutura (esquema) do banco de dados;
- Alguns comandos:
  - `CREATE DATABASE {name};` para a criação de um banco de dados;
  - `CREATE TABLE {name}( ... );` para criação de uma tabela com seus atributos, domínios, chave primária, etc.
    - Exemplos:
    ```sql 
    CREATE TABLE Dept (
      DepNume integer(4) not null primary key);
    ```

    ```sql
    CREATE TABLE Emp (
      EmpNume integer(5) not null,
      EmpNome char(30) not null,
      DepNume integer(4) not null,
      EmpComi decimal(10, 2),
      EmpSala integer(5),
      primary KEY (EmpNume), /* Chave primária composta */
      FOREIGN KEY (DepNume) REFERENCES Dept(DepNume)
        on delete restrict
        on update cascade); 
    ```

    ```sql
    CREATE TABLE estado(
      ESTADO_CODIGO char(2) primary key,
      ESTADO_NOME varchar(25)
    );
    ```

    ```sql
    CREATE TABLE ue_produto(
      UE_PRODUTO char(3) primary key,
      UE_PRODUTO_DESCR varchar(50)
    );
    ```
  - `INSERT INTO {table} [(...{attrs})] VALUES (...);` para inserção de dados na tabela.
    - Exemplos:
      ```sql
      INSERT INTO DEPT (DepNome, DepORva, DepLoc, DepNume)
      VALUES ('Informática', 100.000, 'Prédio A', 100);
      ```

      ```sql
      INSERT INTO estado (ESTADO_CODIGO, ESTADO_NOME, ESTADO_REGIAO, ESTADO_SIGLA)
        VALUES ('AA', 'Pernambuco', 'NORDESTE', 'PE');
      ```

      ```sql
      INSERT INTO ue_produto
        VALUES ('1', 'Produto'),
        VALUES ('2', 'Produto 2');
      ```

  - `ALTER TABLE {table} {operation} {arguments}` permite alteração de uma tabela.
    - Exemplos:
      ```sql
      ALTER TABLE dept ADD (depsala integer(4));
      ALTER TABLE dept DROP depsala;
      ```

      ```sql
      ALTER TABLE estado ADD (ESTADO_REGIAO char(10));
      ALTER TABLE estado ADD (ESTADO_SIGLA char(2));
      ```

  - `DROP TABLE {table}` permite a exclusão de uma tabela;
    - Exemplos:
      ```sql
      DROP TABLE EMP;
      ```

  - `DROP DATABASE {database}` permite a exclusão por completo do banco de dados (só é possível recuperar por backup).
  - `DELETE FROM {table} WHERE {filter}` permite a exclusão de dados (linhas);
  - `UPDATE {table} {operation} {attribute} = {value}` permite a atualização de dados;
    - Exemplos:
      ```sql
      UPDATE EMP SET EMPSALA = 'novo valor'
        WHERE EMPSALA < 1000; /* Cláusula WHERE determina filtros das linhas que devem ser alteradas */
      ```

  - `CREATE {args} INDEX {attribute} on {table}({attribute} asc|desc)` permite a criação de índice em uma tabela;
  - `TRUNCATE TABLE {table}` permite esvaziar uma tabela de forma mais eficiente (não precisamos realizar a checagem da condição).
    - Exemplos:
      ```sql
      ALTER TABLE ORDER_LINE DISABLE CONSTRAINT FK_ORDLINE_PRODUCT;
      TRUNCATE TABLE PRODUCT;
      ```
  - `SELECT {columns}|* FROM {table} [WHERE {conditions}];`
- Operadores da cláusula `WHERE`:
  - `{attribute} BETWEEN {v0} AND {v1}` o atributo deve estar em `[v0, v1]`;
  - `{attribute} IN (...{values})`
  - `LIKE`
  - `IS NULL`
  - `<>`
  - `NOT BETWEEN`
  - `NOT IN`
  - `NOT LIKE`
  - `IS NOT NULL`

## Tipos de dados (SQL)

- Existem alguns terminadores de sentenças: `;`, `\g` e `\G` (traz os resultados na vertical).