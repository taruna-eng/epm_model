using { cuid, managed, Currency, Country } from '@sap/cds/common';

namespace com.epm;

// ─── SUPPLIERS ───────────────────────────────────
entity Suppliers : cuid {
//   supplierName  : String(100);
//   contactPerson : String(100);
//   email         : String(255);
//   phone         : String(20);
//   street        : String(200);
//   city          : String(100);
//   state         : String(50);
//   pincode       : String(10);
//   country       : Country;
//   isActive      : Boolean default true;
//   products      : Association to many Products on products.supplier = $self;
supplierName  : String(100);
  contactPerson : String(100);
  email         : String(255);
  phone         : String(20);
  street        : String(200);
  city          : String(100);
  state         : String(50);
   pincode       : String(10);
  country       : Country;
 
  isActive      : Boolean default true;
  products      : Association to many Products on products.supplier = $self;
}

// ─── PRODUCT CATEGORIES ──────────────────────────
entity Categories : cuid, managed {
//   categoryName  : String(100);
//   description   : String(500);
//   parentCategory: Association to Categories;  // Self-reference for sub-categories!
//   products      : Association to many Products on products.category = $self;
categoryName  : String(100);
  description   : String(500);
  products      : Association to many Products on products.category = $self;
}

// ─── PRODUCTS ────────────────────────────────────
entity Products :  managed {
//   productName   : String(100);
//   description   : String(500);
//   price         : Decimal(10,2);
//   currency      : Currency;
//   weight        : Decimal(8,3);
//   weightUnit    : String(5) default 'KG';
//   stock         : Integer default 0;
//   minStock      : Integer default 10;
//   supplier      : Association to Suppliers;
//   category      : Association to Categories;
//   isAvailable   : Boolean default true;
//   reviews : Composition of many ProductReviews on reviews.product = $self;
  key ID : String(50);
 productName   : String(100);
  description   : String(500);
  price         : Decimal(10,2);
  currency      : Currency;
  stock         : Integer default 0;
  minStock      : Integer default 10;
  stockCriticality : Integer;

  rating        : Decimal(2,1);
  supplier      : Association to Suppliers;
  category      : Association to Categories;
  isAvailable   : Boolean default true;
  

}

// ─── CUSTOMERS ───────────────────────────────────
entity Customers : cuid, managed {
//   customerName  : String(100);
//   email         : String(255);
//   phone         : String(20);
//   street        : String(200);
//   city          : String(100);
//   state         : String(50);
//   pincode       : String(10);
//   country       : Country;
//   creditLimit   : Decimal(12,2) default 100000;
//   orders        : Association to many SalesOrders on orders.customer = $self;
//   addresses : Composition of many Addresses on addresses.customer = $self;

customerName  : String(100);
  email         : String(255);
  phone         : String(20);
  city          : String(100);
  country       : Country;
  creditLimit   : Decimal(12,2) default 100000;
  orders        : Association to many SalesOrders on orders.customer = $self;
}

// ─── SALES ORDERS ────────────────────────────────
entity SalesOrders :  managed {
//   orderNumber    : String(20);
//   customer       : Association to Customers;
//   orderDate      : Date;
//   deliveryDate   : Date;
//   grossAmount    : Decimal(12,2);
//   netAmount      : Decimal(12,2);
//   taxAmount      : Decimal(10,2);
//   currency       : Currency;
//   status         : String(20) default 'New';
//   priority       : String(10) default 'Medium';
//   // Composition — order items BELONG to this order:
//   items          : Composition of many SalesOrderItems on items.order = $self;
key ID : String(50);
 orderNumber    : String(20);
  customer       : Association to Customers;
  orderDate      : Date;
  grossAmount    : Decimal(12,2);
  netAmount      : Decimal(12,2);
  taxAmount      : Decimal(10,2);
  currency       : Currency;
  status         : String(20) default 'New';
  items          : Composition of many SalesOrderItems on items.order = $self;
}

// ─── SALES ORDER ITEMS ───────────────────────────
entity SalesOrderItems : cuid {
//   order          : Association to SalesOrders;
//   product        : Association to Products;
//   quantity       : Integer;
//   unitPrice      : Decimal(10,2);
//   grossAmount    : Decimal(12,2);
//   netAmount      : Decimal(12,2);
//   taxAmount      : Decimal(10,2);
//   currency       : Currency;
//   deliveryDate   : Date;

order          : Association to SalesOrders;
  product        : Association to Products;
  quantity       : Integer;
  unitPrice      : Decimal(10,2);
  netAmount      : Decimal(12,2);
  currency       : Currency;
}

// ─── PURCHASE ORDERS (from Suppliers) ────────────
// entity PurchaseOrders : cuid, managed {
//   poNumber       : String(20);
//   supplier       : Association to Suppliers;
//   orderDate      : Date;
//   grossAmount    : Decimal(12,2);
//   netAmount      : Decimal(12,2);
//   currency       : Currency;
//   status         : String(20) default 'Draft';
//   items          : Composition of many PurchaseOrderItems on items.order = $self;
// }

// ─── PURCHASE ORDER ITEMS ────────────────────────
// entity PurchaseOrderItems : cuid {
//   order          : Association to PurchaseOrders;
//   product        : Association to Products;
//   quantity       : Integer;
//   unitPrice      : Decimal(10,2);
//   grossAmount    : Decimal(12,2);
//   currency       : Currency;
//   deliveryDate   : Date;
// }



// ─── STOCK (Inventory tracking) ──────────────────
entity Stock : managed {
  key product    : Association to Products;
  key warehouse  : String(20);
  quantity       : Integer;
  minQuantity    : Integer default 10;
  lastUpdated    : DateTime;
}

//-------------------------------------------------

entity ProductReviews : cuid, managed {
  product   : Association to Products;
  rating    : Integer;      // 1-5
  reviewer  : String(100);
  comment   : String(500);
  helpful   : Integer default 0;
}


entity Addresses : cuid {
  customer    : Association to Customers;
  addressType : String(20);   // "Billing", "Shipping"
  street      : String(200);
  city        : String(100);
  state       : String(50);
  pincode     : String(10);
  country     : Country;
  isDefault   : Boolean default false;
}


//views 

entity ProductCatalog as select from Products {
  ID,
  productName,
  description,
  price,
  currency,
  rating,
  stock,
  (price * 0.82) as priceExTax : Decimal(10,2),
  (price * 0.18) as taxAmount  : Decimal(10,2),
  supplier.supplierName as supplierName,
  category.categoryName as categoryName,
  case
    when stock > 20 then 'In Stock'
    when stock > 0  then 'Low Stock'
    else 'Out of Stock'
  end as availability : String(20)
} where isAvailable = true;

// View: Order Summary (flattened for reports)
entity OrderSummary as select from SalesOrders {
  ID,
  orderNumber,
  orderDate,
  grossAmount,
  netAmount,
  taxAmount,
  status,
  customer.customerName as customerName,
  customer.email        as customerEmail,
  customer.city         as customerCity
};

// View: Low Stock Alert
// entity LowStockProducts as select from Products {
//   ID,
//   productName,
//   stock,
//   minStock,
//   supplier.supplierName as supplierName,
//   supplier.email        as supplierEmail,
//   supplier.phone        as supplierPhone
// } where stock <= minStock and isAvailable = true;



//purchase order excecution:::::

// Add to your existing schema.cds:

// ─── PURCHASE ORDER STATUS ──────────────────────
type PurchaseOrderStatus : String(20) enum {
  Draft     = 'Draft';
  Submitted = 'Submitted';
  Approved  = 'Approved';
  Received  = 'Received';
  Cancelled = 'Cancelled';
}

// ─── PURCHASE ORDERS ────────────────────────────
// entity PurchaseOrders : cuid, managed {
//   poNumber       : String(20);
//   supplier       : Association to Suppliers;
//   orderDate      : Date;
//   expectedDate   : Date;
//   totalAmount    : Decimal(12,2);
//   currency       : Currency;
//   status         : PurchaseOrderStatus default 'Draft';
//   notes          : String(500);
//   items          : Composition of many PurchaseOrderItems on items.purchaseOrder = $self;
// }

// // ─── PURCHASE ORDER ITEMS ───────────────────────
// entity PurchaseOrderItems : cuid {
//   purchaseOrder   : Association to PurchaseOrders;
//   product         : Association to Products;
//   quantity        : Integer;
//   unitPrice       : Decimal(10,2);
//   currency        : Currency;
//   expectedDate    : Date;
//   receivedQty     : Integer default 0;
// }

// ─── VIEW: LOW STOCK PRODUCTS ───────────────────
entity LowStockProducts as select from Products {
  ID,
  productName,
  stock,
  minStock,
  (minStock - stock) as reorderQuantity : Integer,
  supplier.supplierName as supplierName,
  supplier.email        as supplierEmail,
  supplier.phone        as supplierPhone,
  category.categoryName as categoryName
} where stock < minStock and isAvailable = true;


entity PurchaseOrders : cuid, managed {
  poNumber     : String(30);
  supplier     : Association to Suppliers;
  orderDate    : Date;
  expectedDate : Date;
  priority     : String(20);
  totalAmount  : Decimal(12,2);
  taxAmount    : Decimal(12,2);
  netAmount    : Decimal(12,2);
  currency     : Currency;
  status       : String(20);

  items : Composition of many PurchaseOrderItems
            on items.order = $self;
}

entity PurchaseOrderItems : cuid {
  order      : Association to PurchaseOrders;
  product    : Association to Products;
  quantity   : Integer;
  unitPrice  : Decimal(10,2);
  totalPrice : Decimal(12,2);
}