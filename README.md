# University Database Class Project

This repository contains a two-part project completed for a university database class, showcasing database modeling, SQL, and NoSQL database manipulation skills. Each part addresses a different case study with unique requirements.

## Project Overview

### Part 1: Paris Arrow Transit (PAT) - Conceptual and Logical Database Model

The first part involves designing a database system for Paris Arrow Transit (PAT), a private company contracted to transport officials during the Olympic Games. This task focuses on creating a conceptual and logical model to address PAT’s requirements.

Key Tasks

	•	Conceptual Model: Created an Entity-Relationship Diagram (ERD) to define PAT’s entities, attributes, and relationships, including:
	•	Vehicles with identifiers and attributes like registration, make, and seating capacity.
	•	Officials from National Olympic Committees (NOCs) with roles, team managers, and booking capabilities.
	•	Trip booking information managed by officials, including vehicle and driver assignment.
	•	Driver details such as training records, languages spoken, and security clearance.
	•	Logical Model and Normalization: Transformed the conceptual model into a normalized 3NF logical model, documenting all assumptions and ensuring consistency in relationships and constraints.

#### Files for Part 1

	•	conceptual_model.pdf: Entity-Relationship Diagram and notes for the PAT conceptual model.
	•	logical_model.pdf: Logical model in 3NF with detailed descriptions of entities and relationships.
	•	database_schema.sql: SQL file containing the schema definition based on the logical model.
	•	normalisation_from_forms.pdf: Documentation of normalization from sample forms to achieve 3NF.

### Part 2: Pets First (PF) - Database Implementation and Manipulation

The second part focuses on implementing a database for Pets First (PF), a network of veterinary clinics, using SQL and NoSQL. This part includes creating, populating, and manipulating a database schema in Oracle and MongoDB.

#### Key Components

	•	Database Creation: Built tables, constraints, and an initial schema for PF in Oracle SQL.
	•	Data Insertion and Manipulation: Populated tables with sample data and created SQL queries to perform data retrieval, manipulation, and transaction handling.
	•	MongoDB Integration: Developed NoSQL queries for flexible data manipulation and retrieval in MongoDB.

#### Files for Part 2

	•	helper.sql: SQL helper file for setup.
	•	pf_schema.sql: SQL schema definition for the PF database.
	•	pf_insert.sql: SQL script to populate the PF database with sample data.
	•	pf_dml.sql: SQL script containing data manipulation commands.
	•	pf_mods.sql: SQL script for database modifications.
	•	pf_select.sql: SQL script with select queries to retrieve specific data.
	•	pf_json.sql: SQL script to generate JSON documents for MongoDB.
	•	pf_mongo.mongodb.js: MongoDB queries for NoSQL data manipulation.

## Running the Project

	1.	For Part 1:
	•	Review conceptual_model.pdf and logical_model.pdf to understand the PAT database design.
	•	Use database_schema.sql to set up the schema if testing in a database environment.
	•	Refer to normalisation_from_forms.pdf for normalization steps.
	2.	For Part 2:
	•	Execute pf_schema.sql in Oracle to set up the PF database schema.
	•	Run pf_insert.sql to populate the database with sample data.
	•	Use pf_dml.sql and pf_mods.sql for testing data manipulation and database modifications.
	•	Run pf_select.sql to retrieve data.
	•	Use pf_json.sql to generate JSON documents, and pf_mongo.mongodb.js to run MongoDB queries in a NoSQL environment.


