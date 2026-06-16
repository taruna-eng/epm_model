using { com.epm as db } from '../db/schema';

service MasterDataService @(path: '/master-data') {
  entity Suppliers  as projection on db.Suppliers;
  entity Categories as projection on db.Categories;
  entity Products   as projection on db.Products;







}