using MasterDataService as service from '../../srv/master-data-service';
annotate service.Products with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'productName',
                Value : productName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'description',
                Value : description,
            },
            {
                $Type : 'UI.DataField',
                Value : category.categoryName,
            },
            {
                $Type : 'UI.DataField',
                Value : supplier.supplierName,
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
            Label : 'Stock & Pricing',
            ID : 'StockPricing',
            Target : '@UI.FieldGroup#StockPricing',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Product',
            Value : productName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Price',
            Value : price,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Stock',
            Value : stock,
             Criticality : stockCriticality,
        },
        {
            $Type  : 'UI.DataFieldForAnnotation',
            Target : '@UI.DataPoint#Rating',
            Label  : 'Rating',
        },

  
        {
            $Type : 'UI.DataField',
            Value : supplier.supplierName,
            Label : 'Supplier',
        },
        {
            $Type : 'UI.DataField',
            Value : category.categoryName,
            Label : 'Category',
        },
    ],
    UI.FieldGroup #Reviews : {
        $Type : 'UI.FieldGroupType',
        Data : [
        ],
    },
    UI.FieldGroup #Reviews1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : rating,
                Label : 'rating',
            },
        ],
    },
    UI.FieldGroup #SupplierDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : supplier_ID,
                Label : 'supplier_ID',
            },
            {
                $Type : 'UI.DataField',
                Value : supplier.city,
                Label : 'city',
            },
            {
                $Type : 'UI.DataField',
                Value : supplier.contactPerson,
                Label : 'contactPerson',
            },
            {
                $Type : 'UI.DataField',
                Value : supplier.country_code,
            },
            {
                $Type : 'UI.DataField',
                Value : supplier.email,
                Label : 'email',
            },
            {
                $Type : 'UI.DataField',
                Value : supplier.isActive,
                Label : 'isActive',
            },
            {
                $Type : 'UI.DataField',
                Value : supplier.phone,
                Label : 'phone',
            },
            {
                $Type : 'UI.DataField',
                Value : supplier.pincode,
                Label : 'pincode',
            },
            {
                $Type : 'UI.DataField',
                Value : supplier.supplierName,
                Label : 'supplierName',
            },
        ],
    },
    UI.SelectionFields : [
        productName,
        category.categoryName,
        supplier.supplierName,
    ],
    UI.DataPoint #price : {
        $Type : 'UI.DataPointType',
        Value : price,
        Title : 'Price',
    },
    UI.DataPoint #stock : {
        $Type : 'UI.DataPointType',
        Value : stock,
        Title : 'Stock',
    },
    UI.DataPoint #rating : {
        $Type : 'UI.DataPointType',
        Value : rating,
        Title : 'Rating',
    },
    UI.HeaderFacets : [

        {
      $Type  : 'UI.ReferenceFacet',
      Target : '@UI.DataPoint#price'
    },

    {
      $Type  : 'UI.ReferenceFacet',
      Target : '@UI.DataPoint#stock'
    },

    {
      $Type  : 'UI.ReferenceFacet',
      Target : '@UI.DataPoint#Rating'
    }
        
    ],

      DataPoint #Price : {
    Value : price,
    Title : 'Price'
  },

  DataPoint #Stock : {
    Value       : stock,
    Title       : 'Stock',
    Criticality : stockCriticality
  },

  DataPoint #Rating : {
    Value         : rating,
    Title         : 'Rating',
    TargetValue   : 5,
    Visualization : #Rating
  },
    UI.FieldGroup #StockPricing : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : price,
                Label : 'Price',
            },
            {
                $Type : 'UI.DataField',
                Value : stock,
                Label : 'Stock',
            },
            {
                $Type : 'UI.DataField',
                Value : minStock,
                Label : 'MinStock',
            },
            {
                $Type : 'UI.DataField',
                Value : rating,
                Label : 'Rating',
            },
        ],
    },


);

annotate service.Products with {
    supplier @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Suppliers',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : supplier_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'supplierName',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'contactPerson',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'email',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'phone',
            },
        ],
    }
};



annotate service.Products with {
    category @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Categories',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : category_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'categoryName',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'description',
            },
        ],
    }
};

annotate service.Products with {
    productName @Common.Label : 'productName'
};

annotate service.Categories with {
    categoryName @(
        Common.Label : 'Category',
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Categories',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : categoryName,
                    ValueListProperty : 'categoryName',
                },
            ],
            Label : 'Category',
        },
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.Suppliers with {
    supplierName @(
        Common.Label : 'Supplier',
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Suppliers',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : supplierName,
                    ValueListProperty : 'supplierName',
                },
            ],
            Label : 'Supplier',
        },
        Common.ValueListWithFixedValues : true,
    )
};


//---------------
annotate service.Products with @UI: {

  DataPoint #Rating : {
    Value         : rating,
    Title         : 'Rating',
    TargetValue   : 5,
    Visualization : #Rating
  }

};


//===================

annotate service.Products with @UI.HeaderInfo : {
  TypeName       : 'Product',
  TypeNamePlural : 'Products',
  Title : {
    Value : productName
  },
  Description : {
    Value : description
  }
};