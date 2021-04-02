IMPORT schema;

yearSales := TABLE(schema.clean.ds, {yearRecorded, REAL saleAmount:= SUM(GROUP, saleAmount)}, yearRecorded);

OUTPUT(SORT(yearSales, yearRecorded),,schema.yearly.path,thor,compressed,overwrite,expire(100),named('yearly_sale'));

monthSales := TABLE(schema.clean.ds, {yearRecorded, monthRecorded, REAL saleAmount:= SUM(GROUP, saleAmount)}, yearRecorded, monthRecorded);

OUTPUT(SORT(monthSales, yearRecorded, monthRecorded),,schema.monthly.path,thor,compressed,overwrite,expire(100),named('monthly_sale'));