using { com.epm as db } from '../db/schema';

service PurchasingService @(path: '/purchasing') {
   @odata.draft.enabled
  entity PurchaseOrders as projection on db.PurchaseOrders 
 
actions {

  action submit() returns String;

  action approve(
    comment : String(500)
  ) returns String;

  action reject(
    reason : String(500)
  ) returns String;

  action receive(
    receivedQty : Integer,
    notes : String(500)
  ) returns String;

  function getSummary() returns String;

};

  entity PurchaseOrderItems as projection on db.PurchaseOrderItems;
  @readonly entity Suppliers as projection on db.Suppliers;
  @readonly entity Products as projection on db.Products;

  // Unbound function: Dashboard stats
  function getPurchasingDashboard() returns {
    totalPOs: Integer;
    draftCount: Integer;
    pendingApproval: Integer;
    approvedCount: Integer;
    totalSpend: Decimal;
  };

  // Events
  event POSubmitted {
    poId: UUID;
    poNumber: String;
    supplierName: String;
    totalAmount: Decimal;
    submittedBy: String;
  }

  event POApproved {
    poId: UUID;
    poNumber: String;
    approvedBy: String;
    comment: String;
  }

  event POrejected {
    poId: UUID;
    poNumber: String;
    rejectedBy: String;
    reason: String;
  }
}
