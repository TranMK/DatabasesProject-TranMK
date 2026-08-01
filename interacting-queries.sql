SELECT * FROM customers WHERE id < 3;
SELECT * FROM credit_cards WHERE expdate > '2024-01-01';
SELECT * FROM purchase CROSS JOIN purchaseproducts ON purchase.purchasenum = purchaseproducts.purchasenum WHERE purchaseproducts.purchasecount > 2;