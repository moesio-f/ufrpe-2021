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

> A relation schema $R$ of degree $n$ is denoted by $R(A_1, A_2, \dots, A_n)$.
> 
> $Q$, $R$, and $S$ denote relation names.
> 
> $q$, $r$, and $s$ denote relation states.
> 
> $t$, $v$, and $u$ denote tuples.
> 
> An attribute $A$ can be qualified with the relation name $R$ to which it belong by using a dot (i.e., $R.A$).
> 
> An n-tuple $t$ in a relation $r(R)$ is denoted by $t = \langle v_1, v_2, \dots, v_n\rangle$, where $v_i \in A_i$.
> 
> Both $t[A_i]$ and $t.A_i$ refer to the value $v_i$ in $t$ for the attribute $A_i$.
> 
> Both $t[A_u, A_w, \dots, A_z]$ and $t.(A_u, A_w, \dots, A_z)$ refer to the sub-tuple of values $\langle v_u, v_w, \dots, v_z \rangle$ from $t$.

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

### 5.2.3 Relational Databases and Relational Database Schemas

### 5.2.4 Entity Integrity, Referential Integrity, and Foreign Keys

### 5.2.5 Other Types of Constraints


## 5.3 Update Operations, Transactions and Dealing with Constraint Violations