# RushMore_Enterprise_Database
A cloud-based PostgreSQL database system for RushMore Pizzeria, featuring data modeling, Azure deployment, and Python-generated test data.



##  PROJECT OVERVIEW
This project was built as a capstone case study for RushMore Pizzeria, a growing pizza delivery business that needed to move from a basic JSON file system to a full-scale, cloud-hosted relational database. The goal was to design and implement a reliable, scalable PostgreSQL database that could handle thousands of customer orders, support analytics, and replace the old, fragile data storage method.

##  Project Features

- Fully normalized OLTP schema (3NF)
- Automatic synthetic data generation
- Data masking for privacy (email & phone)
- Realistic sales, menu, ingredient consumption patterns
- Logging for transparency & debugging
- Scalable dataset generation for analytics and reporting

## Database Design and Schema

The database schema consists of the following tables:
- Stores: Holds information for each physical pizzeria location
- Customers: Stores PII (Personally Identifiable Information) for all registered customers
- Ingredients: A master list of all raw ingredients used to make menu items
- Menu_Items: Master product catalog for all items sold (pizzas, drinks, sides)
- Item_Ingredients: Junction table linking Menu_Items to Ingredients required to make them
- Orders: Master transaction table (each row = one order)
- Order_Items: Junction table listing the specific items that make up an order

## Troubleshooting & common errors

- FileNotFoundError for config.yaml: I ensure config.yaml exists and the path passed to --config is correct.
- ValueError: Missing required keys: I Open config.yaml and ensure host, port, user, password, dbname are present and non-empty.
- psycopg2 connection failed: I Verify DB server is reachable, credentials are correct, and firewall allows connection.
- Unique Constraint Failures for Phone/Email: I ensured faker.unique.clear() was called before generating data and adjusted the uniqueness logic to reduce collisions.
- No Data Visible in pgAdmin After Successful Run: I encountered issues with data not showing in pgAdmin after a successful run. To resolve it, I confirmed the script committed changes with conn.commit(), ensured connection to the same database, and refreshed the pgAdmin explorer UI.
- Logging Errors / Encoding Issues: I experienced logging errors with encoding issues on Windows. To resolve it, I set the Python file encoding to UTF-8 and updated the PowerShell/system console encoding to UTF-8 using chcp 65001. 

## Project Files

- 'ERD for rushmore': ERD file showing the fully normalised PostgreSQL schema in (3NF)
- 'create_table':	SQL script showing the create tables query
- 'config.yaml':	Database connection configuration file
- 'populate.py': Python script for data population
- 'Analysis_queries':	Contains SQL scripts for business analysis
- 'Requirements.txt':	Contains all foreign dependencies installed to run the python script

## Designing and Populating the RushMore Pizzeria Database
To design an efficient database system for RushMore Pizzeria, I began by conducting a thorough analysis of their business operations, including multiple customers, menu items, ingredients, and the way orders are placed. From that, I designed a normalized relational schema using draw.io to create an Entity-Relationship Diagram (ERD). The database structure included several key tables: Stores, Customers, Ingredients, Menu_Items, Item_Ingredients, Orders, and Order_Items. Each table was carefully modeled with primary and foreign keys to ensure data integrity and efficiency.

Once the design was complete, I wrote an SQL script containing all the CREATE TABLE statements and deployed it to a PostgreSQL database hosted in the Azure Cloud Platform. This set up the empty schema, ready to be filled with data.

To populate the database, I developed a Python script using the psycopg2 library to connect to the database and the Faker library to generate realistic but fake data. The script produced over 10,000 synthetic records, simulating real business activity including customers, stores, ingredients, and thousands of orders with multiple order items each. The fake data ensured privacy while allowing for realistic testing of database performance and data relationships.

With the data loaded, I verified the schema and relationships using pgAdmin, checking table row counts and sample queries to confirm everything had been inserted correctly. I then created several SQL queries for analysis, answering key business questions such as total sales per store, top-spending customers, most popular menu items, average order value, and the busiest order times. These queries demonstrated how the database could power data-driven decision-making for RushMore’s management team.

Finally, I compiled the results, screenshots and documented the entire process from schema design to data generation and analytics. This project tested and showcased my skills in data modeling, database programming, cloud deployment, and data analysis, providing a complete end-to-end example of building a production-ready enterprise data system from the ground up.

## How to run this project
- clone your repository
- create and activate a python virtual environment & install requirements
- create postgreSQL Database (Azure or GCP)
- run the database schema (create_table.sql)
- create your configuration file (config.yaml)
- run the data population script (populate.py)
- check your data in pgAdmin
- run your analysis queries
- visualize in power Bi or Tableau
