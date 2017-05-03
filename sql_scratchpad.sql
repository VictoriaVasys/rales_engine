SELECT sum(ii.revenue)
FROM invoice_items ii
INNER JOIN invoices i ON i.id = ii.invoice_id
INNER JOIN transactions t ON t.invoice_id = i.id
WHERE t.result = 'success';
