# SQL Test dbt Project

Welcome to the sql test repository! This project is based on the [dbt](https://www.getdbt.com/) and uses an embedded [DuckDB](https://duckdb.org/) database with sample Salesforce data.

The goal of this project is to setup a docker environment for docker with dbt and perform transformatoins and testing using dbt and dimensional modelling concepts.

## Instructions to Run the project

- Down this Repo or Clone it
- Start your docker
- Open the terminal in the root of the project
- Run the command to build the docker image of **docker build -t dbt_image .**
   - The **.** in the above command means the current directory. 
- Run the docker up command **docker-compose up**
- Goto your Docker cluster by command or by entering the cluster from docker UI.
- Run command **docker run**, to build the database model and verify if there is no error in models.
- To Test the models run the command **dbt test**, This will test the schema testing form .YML files and custom test cases in **tests**   folder


## Dimensions and Facts:  
   This project is based on salesforce sample data to be converted into dimensions and facts as an example which makes up the mart layer. There are 3 Facts in the Dimensional model diagram.
   - **FactCampaignEvents**: This tables represents each state of lifecycle of a campaign to be as 1 row. So if there is a campaign which is completed. So this fact table will have 2 rows for this campaign represents 2 events in lifecycle, first state in cycle would be **Planned** and the second would be **Completed**

   - **FactLeadEvents**: This tables represents each state of lifecycle of a lead to be as 1 row. So if there is a lead which is **Closed - Converted**. So this fact table will have 3 rows for this campaign represents 3 events in lifecycle, first state in cycle would be **Lead Created**, the second would be **In Progress** and third would be **LeadWon**

   - **FactOpportunities**: This facts table is main table which connects almost all the other dimensions. This table is not based on events instead it is 1 row for each Opputunity which is converted from lead. This table has mostly analytical columns and it has Many to 1 relationships with most of the dimensions. See attached diagram.

   There are 11 dimensions in the model most of the have same business related tables and columns which can give details about the Opportunity, Lead or Campaign.

   The **DimDate** dimensions is the helper dimension which doesn't get new values or rows but it helps to get connected with all the date columns which provides a more flexible way of reporting based on different precalcualted values for each date.

   The **DimLeadEventsStatuses** and **DimCampaignEventStatuses** are also the helper dimensions which doesn't get new values but they help to calcualte the lifecycle events of lead and campaingn. See the models implementation for more details 

## Facts and Dimensions ER Diagram:
https://github.com/nialish/dbt_project/blob/main/transformation/SalesforceDimensionalModel.png
