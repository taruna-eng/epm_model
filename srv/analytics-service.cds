using { com.epm as db } from '../db/schema';

service AnalyticsService @(path: '/analytics') {
  @readonly entity ProductCatalog  as projection on db.ProductCatalog;
  @readonly entity OrderSummary    as projection on db.OrderSummary;
}