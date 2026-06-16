// using com.epm from '../db/schema';

// // ─── Sales Service (Customer-facing) ─────────────
// service SalesService @(path: '/sales') {
//   entity Products     as projection on epm.Products;
//   entity Customers    as projection on epm.Customers;
//   entity SalesOrders  as projection on epm.SalesOrders;
//   entity Categories   as projection on epm.Categories;
// }

// // ─── Procurement Service (Internal) ──────────────
// service ProcurementService @(path: '/procurement') {
//   entity Suppliers       as projection on epm.Suppliers;
//   entity PurchaseOrders  as projection on epm.PurchaseOrders;
//   entity Products        as projection on epm.Products;
//   entity Stock           as projection on epm.Stock;
// }


//========
// service ReportsService @(path: '/reports') {
//   @readonly entity ProductCatalog    as projection on epm.ProductCatalog;
//   @readonly entity OrderSummary      as projection on epm.OrderSummary;
//   @readonly entity LowStockProducts  as projection on epm.LowStockProducts;
// }