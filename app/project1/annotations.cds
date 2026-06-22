// using PurchasingService as service from '../../srv/purchasing-service';
// annotate service.PurchaseOrders with @(
//     UI.FieldGroup #GeneratedGroup : {
//         $Type : 'UI.FieldGroupType',
//         Data : [
//             {
//                 $Type : 'UI.DataField',
//                 Label : 'poNumber',
//                 Value : poNumber,
                
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Label : 'orderDate',
//                 Value : orderDate,
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Label : 'expectedDate',
//                 Value : expectedDate,
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Label : 'totalAmount',
//                 Value : totalAmount,
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Label : 'currency_code',
//                 Value : currency_code,
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Label : 'status',
//                 Value : status,
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Label : 'notes',
//                 Value : notes,
//             },
//         ],
//     },


  








    
//     UI.Facets : [
//         {
//             $Type : 'UI.ReferenceFacet',
//             ID : 'GeneratedFacet1',
//             Label : 'General Information',
//             Target : '@UI.FieldGroup#GeneratedGroup',
//         },
//     ],
//     UI.LineItem : [
//         {
//             $Type : 'UI.DataField',
//             Label : 'poNumber',
//             Value : poNumber,
//         },
//         {
//             $Type : 'UI.DataField',
//             Label : 'orderDate',
//             Value : orderDate,
//         },
//         {
//             $Type : 'UI.DataField',
//             Label : 'expectedDate',
//             Value : expectedDate,
//         },
//         {
//             $Type : 'UI.DataField',
//             Value : supplier.supplierName,
//             Label : 'supplierName',
//         },
//     ],
// );

// annotate service.PurchaseOrders with {
//     supplier @Common.ValueList : {
//         $Type : 'Common.ValueListType',
//         CollectionPath : 'Suppliers',
//         Parameters : [
//             {
//                 $Type : 'Common.ValueListParameterInOut',
//                 LocalDataProperty : supplier_ID,
//                 ValueListProperty : 'ID',
//             },
//             {
//                 $Type : 'Common.ValueListParameterDisplayOnly',
//                 ValueListProperty : 'supplierName',
//             },
//             {
//                 $Type : 'Common.ValueListParameterDisplayOnly',
//                 ValueListProperty : 'contactPerson',
//             },
//             {
//                 $Type : 'Common.ValueListParameterDisplayOnly',
//                 ValueListProperty : 'email',
//             },
//             {
//                 $Type : 'Common.ValueListParameterDisplayOnly',
//                 ValueListProperty : 'phone',
//             },
//         ],
//     }
// };


using PurchasingService as service from '../../srv/purchasing-service';

annotate service.PurchaseOrders with @UI : {

    HeaderInfo : {
        TypeName : 'Purchase Order',
        TypeNamePlural : 'Purchase Orders',
        Title : {
            Value : poNumber
        }
    },

    SelectionFields : [
        poNumber,
        status,
        supplier,
        priority,
        orderDate
    ],

    LineItem : [
        {
            $Type : 'UI.DataField',
            Value : poNumber,
            Label : 'PO Number'
        },
        {
            $Type : 'UI.DataField',
            Value : supplier.supplierName,
            Label : 'Supplier'
        },
        {
            $Type : 'UI.DataField',
            Value : priority,
            Label : 'Priority'
        },
        {
            $Type : 'UI.DataField',
            Value : orderDate,
            Label : 'Order Date'
        },
        {
            $Type : 'UI.DataField',
            Value : expectedDate,
            Label : 'Expected Date'
        },
        {
            $Type : 'UI.DataField',
            Value : totalAmount,
            Label : 'Total Amount'
        },
        {
            $Type : 'UI.DataField',
            Value : status,
            Label : 'Status'
        }
    ],

    Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'General Information',
            Target : '@UI.FieldGroup#General'
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Purchase Order Items',
            Target : 'items/@UI.LineItem'
        }
    ],

    FieldGroup #General : {
        Data : [
            {
                $Type : 'UI.DataField',
                Value : poNumber,
                Label : 'PO Number'
            },
            {
                $Type : 'UI.DataField',
                Value : supplier_ID,
                Label : 'Supplier'
            },
            {
                $Type : 'UI.DataField',
                Value : priority,
                Label : 'Priority'
            },
            {
                $Type : 'UI.DataField',
                Value : orderDate,
                Label : 'Order Date'
            },
            {
                $Type : 'UI.DataField',
                Value : expectedDate,
                Label : 'Expected Date'
            },
            {
                $Type : 'UI.DataField',
                Value : currency,
                Label : 'Currency'
            },
            {
                $Type : 'UI.DataField',
                Value : status,
                Label : 'Status'
            },
            {
                $Type : 'UI.DataField',
                Value : totalAmount,
                Label : 'Total Amount'
            },
            {
                $Type : 'UI.DataField',
                Value : taxAmount,
                Label : 'Tax Amount'
            },
            {
                $Type : 'UI.DataField',
                Value : netAmount,
                Label : 'Net Amount'
            }
        ]
    }
};

annotate service.PurchaseOrders with {

    supplier @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Suppliers',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : supplier_ID,
                ValueListProperty : 'ID'
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'supplierName'
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'contactPerson'
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'email'
            }
        ]
    };
};





annotate service.PurchaseOrderItems with @UI : {

    LineItem : [
        {
            $Type : 'UI.DataField',
            Value : product.productName,
            Label : 'Product'
        },
        {
            $Type : 'UI.DataField',
            Value : quantity,
            Label : 'Quantity'
        },
        {
            $Type : 'UI.DataField',
            Value : unitPrice,
            Label : 'Unit Price'
        },
        {
            $Type : 'UI.DataField',
            Value : totalPrice,
            Label : 'Total Price'
        }
    ],

    Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Item Details',
            Target : '@UI.FieldGroup#ItemDetails'
        }
    ],

    FieldGroup #ItemDetails : {
        Data : [
            {
                $Type : 'UI.DataField',
                Value : product_ID,
                Label : 'Product'
            },
            {
                $Type : 'UI.DataField',
                Value : quantity,
                Label : 'Quantity'
            },
            {
                $Type : 'UI.DataField',
                Value : unitPrice,
                Label : 'Unit Price'
            },
            {
                $Type : 'UI.DataField',
                Value : totalPrice,
                Label : 'Total Price'
            }
        ]
    }
};