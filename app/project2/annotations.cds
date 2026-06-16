using SalesService as service from '../../srv/sales-service';
annotate service.SalesOrders with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'orderNumber',
                Value : orderNumber,
            },
            {
                $Type : 'UI.DataField',
                Label : 'orderDate',
                Value : orderDate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'grossAmount',
                Value : grossAmount,
            },
            {
                $Type : 'UI.DataField',
                Label : 'netAmount',
                Value : netAmount,
            },
            {
                $Type : 'UI.DataField',
                Label : 'taxAmount',
                Value : taxAmount,
            },
            {
                $Type : 'UI.DataField',
                Label : 'currency_code',
                Value : currency_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'status',
                Value : status,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'order',
            ID : 'order',
            Target : '@UI.FieldGroup#order',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'orderNumber',
            Value : orderNumber,
        },
        {
            $Type : 'UI.DataField',
            Label : 'orderDate',
            Value : orderDate,
        },
        {
            $Type : 'UI.DataField',
            Label : 'grossAmount',
            Value : grossAmount,
        },
        {
            $Type : 'UI.DataField',
            Label : 'netAmount',
            Value : netAmount,
        },
        {
            $Type : 'UI.DataField',
            Label : 'taxAmount',
            Value : taxAmount,
        },
    ],
    UI.FieldGroup #order : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : items.order_ID,
                Label : 'order_ID',
            },
            {
                $Type : 'UI.DataField',
                Value : items.product_ID,
                Label : 'product_ID',
            },
        ],
    },
);

annotate service.SalesOrders with {
    customer @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Customers',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : customer_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'customerName',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'email',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'phone',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'city',
            },
        ],
    }
};

annotate service.SalesOrderItems with @(
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'all orders',
            ID : 'allorders',
            Target : '@UI.FieldGroup#allorders',
        },
    ],
    UI.FieldGroup #allorders : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : ID,
                Label : 'ID',
            },
            {
                $Type : 'UI.DataField',
                Value : order_ID,
                Label : 'order_ID',
            },
            {
                $Type : 'UI.DataField',
                Value : order.ID,
                Label : 'ID',
            },
            {
                $Type : 'UI.DataField',
                Value : order.items.netAmount,
                Label : 'netAmount',
            },
        ],
    },
);

