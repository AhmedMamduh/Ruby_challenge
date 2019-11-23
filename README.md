The Challenge was to create a database populated with data using a schema similar to below:

| Table | Field |
| ------ | ------ |
| Departments | name |

| Table | Field |
| ------ | ------ |
| Products | name |
|  | price |
|  | department_id |

| Table | Field |
| ------ | ------ |
| ProductsPromotions | product_id |
|  | promotion_id |

| Table | Field |
| ------ | ------ |
| Promotions | code |
|  | active |
|  | discount |

The requirements for this Application are:

- A paginated list of all products in the database showing their name and price, and showing a products current promotion and discounted price if one is active.

- Department filter: Selecting a department will display all of the products within that department.

- Simple partial text search based on product name.

To get the application up and running:

- First after clone create database and run db:seed to create some fake data.
- Start the server then go to your localhost.
- Now you can test and use all filters, search or create new data from Sidebar.
- To use filters or search as api POST -> http://localhost:3000/products?&search=clothes&product_name=pants&promo_code=true

NOTE: The frontend implemented using bootstrap.