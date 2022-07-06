- [Chapter 2: Database System Concepts and Architecture](#chapter-2-database-system-concepts-and-architecture)
  - [2.1 Data Models, Schemas, and Instances](#21-data-models-schemas-and-instances)
    - [2.1.1 Categories of Data Models](#211-categories-of-data-models)
    - [2.1.2 Schemas, Instances, and Database State](#212-schemas-instances-and-database-state)
  - [2.2 Three-Schema Architecture and Data Independence](#22-three-schema-architecture-and-data-independence)
  - [2.3 Database Languages and Interfaces](#23-database-languages-and-interfaces)
  - [2.4 The Database System Environment](#24-the-database-system-environment)
  - [2.5 Centralized and Client/Server Architectures for DBMSs](#25-centralized-and-clientserver-architectures-for-dbmss)


---
# Chapter 2: Database System Concepts and Architecture

> The architecture of DBMS packages has evolved from the early monolithic systems, where the whole DBMS software package was one tightly integrated system, to the modern DBMS packages that are modular in design with a client/server system architecture.

> The current **cloud computing** environments consist of thousands of large servers managing so-called **big data** for users on the Web.

## 2.1 Data Models, Schemas, and Instances

> **Data abstraction** generally refers to the suppression of details of data organization and storage, and the highlighting of the essential features for an improved understanding of data.
>
> A **data model**—a collection of concepts that can be used to describe the structure of a database—provides the necessary means to achieve this abstraction. 

Most **data models** also include a set of basic operations for specifying retrievals and updates on the data base.

It is also becoming common to include concepts in the data model to specify the **dynamic aspect** or **behavior** of a database application.

### 2.1.1 Categories of Data Models

> **High-level** or **conceptual data models** provide concepts that are close to the way many users perceive data, whereas **low-level** or **physical data models** provide concepts that describe the details of how data is stored on the computer storage media.

> [...] Between these two extremes is a class of **representational** (or **implementation**) data models, which provide concepts that may be easily understood by end users but that are not too far removed from the way data is organized in computer storage.

An **entity** represents a real-world object or concept. An **attribute** represents some property of interest that further describes an entity. A **relationship** among two or more entities represents an association among the entities.

> The **entity–relationship model** is a popular high-level conceptual data model.

> Representational or implementation data models are the models used most frequently in traditional commercial DBMSs. These include the widely used **relational data model**, as well as the so-called legacy data models—the **network** and **hierarchical models**—that have been widely used in the past.

> We can regard the **object data model** as an example of a new family of higher-level implementation data models that are closer to conceptual data models.

> Physical data models describe how data is stored as files in the computer by representing information such as record formats, record orderings, and access paths. An **access path** is a search structure that makes the search for particular database records efficient, such as *indexing* or *hashing*.

An **index** is an *access path* that allows direct access to data using an index term or keyword.

Another class of data model is known as **self-describing data models**, which combines the description of the data with the data values themselves.

### 2.1.2 Schemas, Instances, and Database State

> The description of a database is called the **database schema**, which is specified during database design and is not expected to change frequently. A displayed schema is called a **schema diagram**, which consists of *schema constructs*.

>  The data in the database at a particular moment in time is called a **database state** or **snapshot**. It is also called the current set of **occurrences** or **instances** in the database.

> The DBMS is partly responsible for ensuring that every state of the database is a valid state—that is, a state that satisfies the structure and constraints specified in the schema. 

>  The schema is sometimes called the **intension**, and a database state is called an **extension** of the schema.

## 2.2 Three-Schema Architecture and Data Independence

## 2.3 Database Languages and Interfaces

## 2.4 The Database System Environment

## 2.5 Centralized and Client/Server Architectures for DBMSs