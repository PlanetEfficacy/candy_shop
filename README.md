# Candy Store
## Setup
### Directions

1. Clone this repository: `git clone https://github.com/PlanetEfficacy/candy_shop`
2. Install gems: `bundle`
3. Setup database: `rake db:create`
4. Migrate database: `rake db:migrate`
5. Seed database: `rake db:seed`
6. Run test suite: `rspec`
7. Run server: `rails s`
8. Navigate to `localhost:3000/api/v1/...` in your browser

### API Documentation

<table>
  <tr>
    <th>HTTP Verb</th>
    <th>Path</th>
    <th>Params</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>GET</td>
    <td>http://localhost:3000/api/v1/products</td>
    <td>na</td>
    <td>Gets all products</td>
  </tr>
  <tr>
    <td>Response</td>
    <td colspan="3">
    [
    {
    "id": 1,
    "name": "Bubble gum",
    "price": "2.00",
    "warehouse_quantity": 100000,
    "store_quantity": 1000,
    "expiration": "",
    "bogo_sale": false
  },
  {
    "id": 2,
    "name": "KitKat",
    "price": "3.00",
    "warehouse_quantity": 100000,
    "store_quantity": 1000,
    "expiration": "2022-01-24",
    "bogo_sale": false
  },
  {
    "id": 3,
    "name": "Snickers",
    "price": "3.00",
    "warehouse_quantity": 100000,
    "store_quantity": 1000,
    "expiration": "2022-01-24",
    "bogo_sale": false
  },
  {
    "id": 4,
    "name": "Marbles",
    "price": "5.00",
    "warehouse_quantity": 10000,
    "store_quantity": 100,
    "expiration": "",
    "bogo_sale": false
  },
  {
    "id": 5,
    "name": "Twizzlers",
    "price": "3.00",
    "warehouse_quantity": 100000,
    "store_quantity": 1000,
    "expiration": "2027-01-23",
    "bogo_sale": false
  }
]

    </td>
  </tr>
  <tr>
    <td>GET</td>
    <td>http://localhost:3000/api/v1/products</td>
    <td>?sort_by=price</td>
    <td>Gets all products sorted by price</td>
  </tr>
  <tr>
  <td>Response</td>
  <td colspan="3">
    [
  {
    "id": 4,
    "name": "Marbles",
    "price": "5.00",
    "warehouse_quantity": 10000,
    "store_quantity": 100,
    "expiration": "",
    "bogo_sale": false
  },
  {
    "id": 2,
    "name": "KitKat",
    "price": "3.00",
    "warehouse_quantity": 100000,
    "store_quantity": 1000,
    "expiration": "2022-01-24",
    "bogo_sale": false
  },
  {
    "id": 3,
    "name": "Snickers",
    "price": "3.00",
    "warehouse_quantity": 100000,
    "store_quantity": 1000,
    "expiration": "2022-01-24",
    "bogo_sale": false
  },
  {
    "id": 5,
    "name": "Twizzlers",
    "price": "3.00",
    "warehouse_quantity": 100000,
    "store_quantity": 1000,
    "expiration": "2027-01-23",
    "bogo_sale": false
  },
  {
    "id": 1,
    "name": "Bubble gum",
    "price": "2.00",
    "warehouse_quantity": 100000,
    "store_quantity": 1000,
    "expiration": "",
    "bogo_sale": false
  }
]`
    </td>
  </tr>
  <tr>
    <td>GET</td>
    <td>http://localhost:3000/api/v1/products</td>
    <td>?sort_by=warehouse</td>
    <td>Gets all products sorted by warehouse quantity</td>
  </tr>
  <tr>
  <td>Response</td>
  <td colspan="3">
    [
  {
    "id": 1,
    "name": "Bubble gum",
    "price": "2.00",
    "warehouse_quantity": 100000,
    "store_quantity": 1000,
    "expiration": "",
    "bogo_sale": false
  },
  {
    "id": 2,
    "name": "KitKat",
    "price": "3.00",
    "warehouse_quantity": 100000,
    "store_quantity": 1000,
    "expiration": "2022-01-24",
    "bogo_sale": false
  },
  {
    "id": 3,
    "name": "Snickers",
    "price": "3.00",
    "warehouse_quantity": 100000,
    "store_quantity": 1000,
    "expiration": "2022-01-24",
    "bogo_sale": false
  },
  {
    "id": 5,
    "name": "Twizzlers",
    "price": "3.00",
    "warehouse_quantity": 100000,
    "store_quantity": 1000,
    "expiration": "2027-01-23",
    "bogo_sale": false
  },
  {
    "id": 4,
    "name": "Marbles",
    "price": "5.00",
    "warehouse_quantity": 10000,
    "store_quantity": 100,
    "expiration": "",
    "bogo_sale": false
  }
]
    </td>
  </tr>
  <tr>
    <td>GET</td>
    <td>http://localhost:3000/api/v1/products</td>
    <td>?sort_by=store</td>
    <td>Gets all products sorted by store quantity</td>
  </tr>
  <tr>
  <td>Response</td>
  <td colspan="3">
    [
  {
    "id": 1,
    "name": "Bubble gum",
    "price": "2.00",
    "warehouse_quantity": 100000,
    "store_quantity": 1000,
    "expiration": "",
    "bogo_sale": false
  },
  {
    "id": 2,
    "name": "KitKat",
    "price": "3.00",
    "warehouse_quantity": 100000,
    "store_quantity": 1000,
    "expiration": "2022-01-24",
    "bogo_sale": false
  },
  {
    "id": 3,
    "name": "Snickers",
    "price": "3.00",
    "warehouse_quantity": 100000,
    "store_quantity": 1000,
    "expiration": "2022-01-24",
    "bogo_sale": false
  },
  {
    "id": 5,
    "name": "Twizzlers",
    "price": "3.00",
    "warehouse_quantity": 100000,
    "store_quantity": 1000,
    "expiration": "2027-01-23",
    "bogo_sale": false
  },
  {
    "id": 4,
    "name": "Marbles",
    "price": "5.00",
    "warehouse_quantity": 10000,
    "store_quantity": 100,
    "expiration": "",
    "bogo_sale": false
  }
]
    </td>
  </tr>
  <tr>
    <td>GET</td>
    <td>http://localhost:3000/api/v1/products/total</td>
    <td>na</td>
    <td>Gets total value of unexpired products in inventory in cents</td>
  </tr>
  <tr>
  <td>Response</td>
  <td colspan="3">
    {
  "total_value": 116150000
}
    </td>
  </tr>
  <tr>
    <td>GET</td>
    <td>http://localhost:3000/api/v1/products/total</td>
    <td>?id=1</td>
    <td>Gets total value of product with id 1 in inventory in cents</td>
  </tr>
  <tr>
  <td>Response</td>
  <td colspan="3">
    {
  "total_value": 20200000
}
    </td>
  </tr>
  <tr>
    <td>PATCH</td>
    <td>http://localhost:3000/api/v1/products/1</td>
    <td>{ warehouse_quantity: 200}</td>
    <td>Updates the warehouse quantity of a given product</td>
  </tr>
  <tr>
  <td>Response</td>
  <td colspan="3">
    {
  "id": 1,
  "name": "Bubble gum",
  "price": "2.00",
  "warehouse_quantity": 200,
  "store_quantity": 1000,
  "expiration": "",
  "bogo_sale": false
}
    </td>
  </tr>
  <tr>
    <td>PATCH</td>
    <td>http://localhost:3000/api/v1/products/1</td>
    <td>{ store_quantity: 200}</td>
    <td>Updates the store quantity of a given product</td>
  </tr>
  <tr>
  <td>Response</td>
  <td colspan="3">
    {
  "id": 1,
  "name": "Bubble gum",
  "price": "2.00",
  "warehouse_quantity": 200,
  "store_quantity": 200,
  "expiration": "",
  "bogo_sale": false
}
    </td>
  </tr>
  <tr>
    <td>POST</td>
    <td>http://localhost:3000/api/v1/sales</td>
    <td>{ product: 1, discount: 50 }</td>
    <td>Discounts the given products price by a given percent</td>
  </tr>
  <tr>
  <td>Response</td>
  <td colspan="3">
    {
  "id": 1,
  "name": "Bubble gum",
  "price": "1.00",
  "warehouse_quantity": 200,
  "store_quantity": 200,
  "expiration": "",
  "bogo_sale": false
}
    </td>
  </tr>
  <tr>
    <td>POST</td>
    <td>http://localhost:3000/api/v1/bogosales</td>
    <td>{ product: 1 }</td>
    <td>Discounts the given products price by a given percent</td>
  </tr>
  <tr>
  <td>Response</td>
  <td colspan="3">
    {
  "id": 1,
  "name": "Bubble gum",
  "price": "1.00",
  "warehouse_quantity": 200,
  "store_quantity": 200,
  "expiration": "",
  "bogo_sale": true
}
    </td>
  </tr>
</table>



## Original Assignment
### Description
I would like an Rails API for my candy store Al's Candies™. We're working on putting together an online storefront and taking my business to the next level. That Hersheys character has been on top for far too long. It's my time to shine.

### Directions

Create a Rails API to handle the requirements below.

Commit/comment when/how you naturally would and when you're finished submit a pull request so I can check it out. Finishing all requirements is not required. If this takes you longer than 4hrs I would say submit what you have because I'll have enough to go off of at that point.

Any questions feel free to ping me

### Reqs

1. I need an easy way to be able to view all of my products. This list of products needs to show me the price, quantity available to ship, and quantity distributed to my Al's Candies™  stores.  It would also be nice to be able to sort by those attributes as well.
2. I need to be able to update quantity of products available to ship and distributed.
3. I need to be able to apply sale prices to products that are online and/or in store. My sales are always a % off original price or BOGO.
4. My edible products also require a sell by date and an expiration date. The sell by date is always 2 weeks before the expiration date. Once the sell by date passes we remove the remaining product from our inventory.
5. I need to be able to tell the total value of my inventory as well as total value of specific products.
