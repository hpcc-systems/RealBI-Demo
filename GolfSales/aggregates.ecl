IMPORT layouts;

SalesByYear := 
  TABLE(layouts.cleanDS, 
       {SaleYear, REAL TotalSales := SUM(GROUP, ActualPrice)}, 
       SaleYear): PERSIST('~hpccsystems::realbi::demos::clean::golf-sales::sales-by-year');

OUTPUT(SalesByYear);

SalesByMonthYear := 
    TABLE(layouts.cleanDS, 
        {SaleYear, SaleMonth, REAL TotalSales := SUM(GROUP, ActualPrice)}, 
        SaleYear, SaleMonth) : PERSIST('~hpccsystems::realbi::demos::clean::golf-sales::sales-by-month');

OUTPUT(SalesByMonthYear);