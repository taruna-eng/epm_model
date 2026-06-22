// using { com.epm as db } from '../db/schema';

// service PurchasingService @(path: '/purchasing') {
//    @odata.draft.enabled
//   entity PurchaseOrders as projection on db.PurchaseOrders 
 
// actions {

//   action submit() returns String;

//   action approve(
//     comment : String(500)
//   ) returns String;

//   action reject(
//     reason : String(500)
//   ) returns String;

//   action receive(
//     receivedQty : Integer,
//     notes : String(500)
//   ) returns String;

//   function getSummary() returns String;

// };

//   entity PurchaseOrderItems as projection on db.PurchaseOrderItems;
//   @readonly entity Suppliers as projection on db.Suppliers;
//   @readonly entity Products as projection on db.Products;

//   // Unbound function: Dashboard stats
//   function getPurchasingDashboard() returns {
//     totalPOs: Integer;
//     draftCount: Integer;
//     pendingApproval: Integer;
//     approvedCount: Integer;
//     totalSpend: Decimal;
//   };

//   // Events
//   event POSubmitted {
//     poId: UUID;
//     poNumber: String;
//     supplierName: String;
//     totalAmount: Decimal;
//     submittedBy: String;
//   }

//   event POApproved {
//     poId: UUID;
//     poNumber: String;
//     approvedBy: String;
//     comment: String;
//   }

//   event POrejected {
//     poId: UUID;
//     poNumber: String;
//     rejectedBy: String;
//     reason: String;
//   }
// }


// using { com.epm as db } from '../db/schema';

// service PurchasingService @(path: '/purchasing') {

// @odata.draft.enabled
// entity PurchaseOrders as projection on db.PurchaseOrders {
// *,


// supplier,
// currency,

// virtual statusCriticality : Integer,
// virtual progressValue     : Integer,

// virtual submitHidden      : Boolean,
// virtual approveHidden     : Boolean,
// virtual rejectHidden      : Boolean,

// virtual poFieldControl    : Integer,

// items


// }
// actions {


// action submit() returns {
//   status  : String;
//   message : String;
// };

// action approve(
//   comment : String(500)
// ) returns {
//   status     : String;
//   message    : String;
//   approvedAt : DateTime;
// };

// action reject(
//   reason : String(500)
// ) returns {
//   status  : String;
//   message : String;
// };

// action receive(
//   receivedQty : Integer,
//   notes       : String(500)
// ) returns {
//   status  : String;
//   message : String;
// };

// function getSummary() returns {
//   poNumber    : String;
//   supplier    : String;
//   itemCount   : Integer;
//   totalAmount : Decimal;
//   status      : String;
//   daysOpen    : Integer;
// };


// };

// entity PurchaseOrderItems as projection on db.PurchaseOrderItems {
// *,
// product
// };

// @readonly
// entity Suppliers as projection on db.Suppliers;

// @readonly
// entity Products as projection on db.Products;

// function getPurchasingDashboard() returns {
// totalPOs        : Integer;
// draftCount      : Integer;
// pendingApproval : Integer;
// approvedCount   : Integer;
// totalSpend      : Decimal;
// };

// event POSubmitted {
// poId         : UUID;
// poNumber     : String;
// supplierName : String;
// totalAmount  : Decimal;
// submittedBy  : String;
// }

// event POApproved {
// poId       : UUID;
// poNumber   : String;
// approvedBy : String;
// comment    : String;
// }

// event POrejected {
// poId       : UUID;
// poNumber   : String;
// rejectedBy : String;
// reason     : String;
// }
// }

// using from '../app/project1/annotations';


using { com.epm as db } from '../db/schema';

service PurchasingService @(path: '/purchasing', requires: 'authenticated-user')  {

@odata.draft.enabled
@(requires: ['PurchaseManager', 'Administrator'])
entity PurchaseOrders 
@(restrict: [
    { grant: 'READ', to: 'Viewer' },
    { grant: ['READ', 'CREATE', 'UPDATE'], to: 'PurchaseManager'  },
    { grant: '*', to: 'Administrator' }
  ])





as projection on db.PurchaseOrders 








 {
*,


supplier,
currency,

virtual statusCriticality : Integer,
virtual progressValue     : Integer,

virtual submitHidden      : Boolean,
virtual approveHidden     : Boolean,
virtual rejectHidden      : Boolean,

virtual poFieldControl    : Integer,

items


}
actions {

 @(requires: 'PurchaseManager')
action submit() returns {
  status  : String;
  message : String;
};
 @(requires: 'PurchaseManager')
action approve(
  comment : String(500)
) returns {
  status     : String;
  message    : String;
  approvedAt : DateTime;
};

@(requires: 'PurchaseManager')
action reject(
  reason : String(500)
) returns {
  status  : String;
  message : String;
};



//=================


















action receive(
  receivedQty : Integer,
  notes       : String(500)
) returns {
  status  : String;
  message : String;
};

function getSummary() returns {
  poNumber    : String;
  supplier    : String;
  itemCount   : Integer;
  totalAmount : Decimal;
  status      : String;
  daysOpen    : Integer;
};


};

entity PurchaseOrderItems @(restrict: [
    { grant: 'READ', to: 'Viewer' },
    { grant: '*', to: ['PurchaseManager', 'Administrator'] }  
])



as projection on db.PurchaseOrderItems {
*,
product
};

@readonly
 @(requires: 'Administrator')
entity Suppliers as projection on db.Suppliers;

@readonly
entity Products as projection on db.Products;

function getPurchasingDashboard() returns {
totalPOs        : Integer;
draftCount      : Integer;
pendingApproval : Integer;
approvedCount   : Integer;
totalSpend      : Decimal;
};

event POSubmitted {
poId         : UUID;
poNumber     : String;
supplierName : String;
totalAmount  : Decimal;
submittedBy  : String;
}

event POApproved {
poId       : UUID;
poNumber   : String;
approvedBy : String;
comment    : String;
}

event POrejected {
poId       : UUID;
poNumber   : String;
rejectedBy : String;
reason     : String;
}
}



// service AdminService @(requires: 'Admin') {
//   entity Products as projection on db.Products;
// }


// service ManagerService @(requires: ['PurchaseManager', 'Administrator']) {
//   entity PurchaseOrders as projection on db.PurchaseOrders;
// }






using from '../app/project1/annotations';
