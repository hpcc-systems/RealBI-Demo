IMPORT layouts;
IMPORT Std;

OUTPUT(layouts.rawDS,,NAMED('raw_sales_data')); 

cleanDS := PROJECT(layouts.rawDS,
                   TRANSFORM
                      (
                          layouts.cleanLayout,
                          SaleDate := Std.Date.FromStringToDate(LEFT.SaleDate[..8], '%m/%d/%y');
                          SELF.SaleDate := SaleDate;
                          SELF.SaleDay := STD.Date.Day(SaleDate);
                          SELF.SaleMonth := STD.Date.Month(SaleDate);
                          SELF.SaleYear := STD.Date.Year(SaleDate);
                          SaleTime := Std.Date.FromStringToTime(LEFT.SaleDate[10..], '%H:%M');
                          SELF.SaleTime := SaleTime;
                          SELF.SaleHourOfDay := STD.Date.Hour(SaleTime);
                          SELF.ReportDate := Std.Date.FromStringToDate(LEFT.ReportDate[..8], '%m/%d/%y');
                          self := LEFT;
                      )
                  );
 
OUTPUT(cleanDS,,layouts.cleanFile,thor,compressed,overwrite,expire(100),named('clean_sales_data'));
         