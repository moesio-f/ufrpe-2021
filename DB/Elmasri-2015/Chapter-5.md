- [Chapter 5: The Relational Data Model and Relational Database Constraints](#chapter-5-the-relational-data-model-and-relational-database-constraints)
  - [5.1 Relational Model Concepts](#51-relational-model-concepts)
    - [5.1.1 Domains, Attributes, Tuples and Relations](#511-domains-attributes-tuples-and-relations)
    - [5.1.2 Characteristics of Relations](#512-characteristics-of-relations)
    - [5.1.3 Relational Model Notation](#513-relational-model-notation)
  - [5.2 Relational Model Constraints and Relational Database Schemas](#52-relational-model-constraints-and-relational-database-schemas)
    - [5.2.1 Domain Constraint](#521-domain-constraint)
    - [5.2.2 Key Constraints and Constraints on NULL Values](#522-key-constraints-and-constraints-on-null-values)
    - [5.2.3 Relational Databases and Relational Database Schemas](#523-relational-databases-and-relational-database-schemas)
    - [5.2.4 Entity Integrity, Referential Integrity, and Foreign Keys](#524-entity-integrity-referential-integrity-and-foreign-keys)
    - [5.2.5 Other Types of Constraints](#525-other-types-of-constraints)
  - [5.3 Update Operations, Transactions and Dealing with Constraint Violations](#53-update-operations-transactions-and-dealing-with-constraint-violations)
    - [5.3.4 The Transaction Concept](#534-the-transaction-concept)


---
# Chapter 5: The Relational Data Model and Relational Database Constraints

## 5.1 Relational Model Concepts

> The relational model represents the database as a collection of *relations*.  Informally, each relation resembles a **table** of values, where each row represents a collection of related data values.

### 5.1.1 Domains, Attributes, Tuples and Relations

> A **domain** is a set of atomic (indivisible) values.
> 
> A **data type** or **format** is a specification for a domain.
> 
> A **relation schema** $R$, denoted by $R(A_1, A_2, \dots, A_n)$, is made up of a relation name $R$ and a list of attributes, $A_1, \dots, A_n$. Each **attribute** $A_i$ is the name of a role played by some domain $D = \operatorname{dom}(A_i)$ in the schema $R$. A relation schema is used to describe a relation, where $R$ is the name of this relation. The **degree** of the relation is $n$.
> 
> A **relation** (or **relation state**) $r$ of the relation schema $R(A_1, \dots, A_n)$, denoted $r(R)$, is a set of n-tuples $r = \{t_1, t_2, \dots, t_m\}$. Each n-tuple $t_i$ is an ordered list of $n$ values $t = \langle v_1, v_2, \dots, v_n \rangle$, where each $v_i$ is an element of $\operatorname{dom}(A_i)$, or NULL.

### 5.1.2 Characteristics of Relations

> In a relation, the tuples don't have an ordering. However, since file records are stored in the disk, there its possible to refer to the first, second and ith records.

> In the relational model, there are no composite or multi-valued attributes.

> In this data model, relations represent fact about both entities and relationships. This might be tricky, since on must infer whether the relation represents an entity or relationship.

### 5.1.3 Relational Model Notation

> - A relation schema $R$ of degree $n$ is denoted by $R(A_1, A_2, \dots, A_n)$.
> - $Q$, $R$, and $S$ denote relation names.
> - $q$, $r$, and $s$ denote relation states.
> - $t$, $v$, and $u$ denote tuples.
> - An attribute $A$ can be qualified with the relation name $R$ to which it belong by using a dot (i.e., $R.A$).
> - An n-tuple $t$ in a relation $r(R)$ is denoted by $t = \langle v_1, v_2, \dots, v_n\rangle$, where $v_i \in A_i$.
> - Both $t[A_i]$ and $t.A_i$ refer to the value $v_i$ in $t$ for the attribute $A_i$.
> - Both $t[A_u, A_w, \dots, A_z]$ and $t.(A_u, A_w, \dots, A_z)$ refer to the sub-tuple of values $\langle v_u, v_w, \dots, v_z \rangle$ from $t$.

## 5.2 Relational Model Constraints and Relational Database Schemas

>  Constraints on databases can generally be divided into three main categories:
> 
> 1. Constraints that are inherent in the data model (**model-based constraints** or **implicit constraints**).
> 2. Constraints that can be directly expressed in the schemas of the data model, typically by specifying them in the DDL (**schema-based constraints** or **explicit-constraints**).
> 3. Constraints that cannot be directly expressed in the schemas of the data
model, and hence must be expressed and enforced by the application programs or in some other way(**application-based** or **semantic**
**constraints** or **business rules**).

### 5.2.1 Domain Constraint

> Domain constraints specify that within each tuple, the value of each attribute $A$ must be an atomic value from the domain $\operatorname{dom}(A)$.

### 5.2.2 Key Constraints and Constraints on NULL Values

In general, all tuples in a relation are distinct. However, there are **subsets if attributes** whose tuples must have different values. That is, $t_1[SK] \neq t_2[SK]$ if $SK$ (**superkey**) is such subset.

>  A key $k$ of a relation schema $R$ is a superkey of $R$ with the additional property that removing any attribute $A$ from $K$ leaves a set of attributes $K'$ that is not a superkey of $R$ any more.
> 
> A relation might have more than one key, which are called **candidate keys**. The **primary key** is a candidate useful to identifying tuples in the relation. The rest of the candidates are called **unique keys**. 

### 5.2.3 Relational Databases and Relational Database Schemas

> A **relational database schema** $S$ is a set of relation schemas $S = \{R_1, \dots, R_m\}$ and a set of **integrity constraints** $\mathrm{IC}$.
> 
> A **relational database state** $\mathrm{DB}$ of $S$ is a set of relation states $\mathrm{DB} = \{r_1, \dotsm r_m\}$ such that $r_i$ is a state of $R_i$ and it satisfies the integrity constraints in $\mathrm{IC}$.
> 
> A database state that satisfies $\mathrm{IC}$ is **valid**, while one that doesn't is **not valid**.

### 5.2.4 Entity Integrity, Referential Integrity, and Foreign Keys

> The **entity integrity constraint** states that no primary key value can be NULL.
> 
> The **referential integrity constraint** is specified between two relations and is used to maintain the consistency among tuples in the two relations.

> A set of attributes $\mathrm{FK}$ in relation schema $R_1$ is a **foreign key** of $R_1$ (**referencing relation**) that references relation $R_2$ (**referenced relation**) if it satisfies:
> 
> 1. The attributes in $\mathrm{FK}$ have the same domain(s) as the primary key attributes $\mathrm{PK}$ of $R_2$; the attributes $\mathrm{FK}$ are said to reference or refer to the relation $R_2$.
> 2. A value of $\mathrm{FK}$ in a tuple t1 of the current state $r_1(R_1)$ either occurs as a value of PK for some tuple t2 in the current state $r_2(R_2)$ or is NULL. In the former case, we have $t_1[\mathrm{FK}] = t_2[\mathrm{FK}]$, and we say that the tuple $t_1$ references or refers to the tuple $t_2$.

### 5.2.5 Other Types of Constraints

> The preceding integrity constraints are included in the data definition language because they occur in most database applications. 
> 
> Another class of general constraints, sometimes called **semantic integrity constraints**, are not part of the DDL and have to be specified and enforced in a different way [...] such as the salary of an employee should not exceed the salary of the employee’s supervisor and the maximum number of hours an employee can work on all projects per week is 56. 
> 
> Such constraints can be specified and enforced within the application programs that update the database, or by using a general-purpose **constraint specification language**.
> 
> **State constraints** define the constraints that a valid state of the database must satisfy. **Transition constraints** define how to deal with state changes in the database


## 5.3 Update Operations, Transactions and Dealing with Constraint Violations

> The operations of the relational model can be categorized into *retrievals* and *updates*.

- Modification or update operations:
  - **Insert**
    - Provides a list of attribute values for a new tuple $t$ inserted in a relation $R$.
    - Can violate domain constraints, key constraints, entity integrity, and referential integrity.
    - The default option is to reject an insert if it violates one or more constraints.
  - **Delete**
    - Can violate only referential integrity.
    - An option is to reject the deletion (**restrict**).
    - Another one is to propagate the deletion by deleting referencing tuples (**cascade**).
    - Yet another option is **set null/default**, which modify the referencing attribute value.
  - **Update** (**Modify**)
    - Updating an attribute that is neither part of a primary key nor part of a foreign key usually causes no problems.
    - Otherwise, the problems are similar to delete or insert.

### 5.3.4 The Transaction Concept

> A database application program running against a relational database typically executes one or more transactions. A **transaction** is an executing program that includes some database operations, such as reading from the database, or applying insertions, deletions, or updates to the database. At the end of the transaction, it must leave the database in a valid or consistent state that satisfies all the constraints specified on the database schema.