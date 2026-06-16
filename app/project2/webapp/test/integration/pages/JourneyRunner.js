sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"project2/test/integration/pages/SalesOrdersList",
	"project2/test/integration/pages/SalesOrdersObjectPage",
	"project2/test/integration/pages/SalesOrderItemsObjectPage"
], function (JourneyRunner, SalesOrdersList, SalesOrdersObjectPage, SalesOrderItemsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('project2') + '/test/flp.html#app-preview',
        pages: {
			onTheSalesOrdersList: SalesOrdersList,
			onTheSalesOrdersObjectPage: SalesOrdersObjectPage,
			onTheSalesOrderItemsObjectPage: SalesOrderItemsObjectPage
        },
        async: true
    });

    return runner;
});

