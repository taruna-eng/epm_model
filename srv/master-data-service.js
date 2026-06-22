module.exports = srv => {

  srv.after('READ', 'Products', products => {

    if (!Array.isArray(products)) {
      products = [products];
    }

    for (const p of products) {

      if (p.stock > 40) {
        p.stockCriticality = 3; // Green
      }
      else if (p.stock > 20) {
        p.stockCriticality = 2; // Yellow
      }
      else {
        p.stockCriticality = 1; // Red
      }

    }

  });

};


// steps on how to navigate page map

//