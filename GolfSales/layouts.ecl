IMPORT Std;

EXPORT layouts :=  MODULE

    EXPORT rawFile := '~hpccsystems::realbi::demos::raw::golf-sales::sales-data.csv';

    EXPORT rawLayout := RECORD
        STRING CourseID;
        STRING CourseName;
        STRING SaleID;
        STRING SaleDate;
        STRING ReportDate;
        STRING ItemID;
        STRING ItemDescription;
        REAL ActualPrice;
        REAL Quantity;
        REAL SalesTax;
        STRING LMPField;
    END;

    EXPORT rawDS := DATASET(rawFile, rawLayout, CSV(heading(1)));

    EXPORT cleanFile := '~hpccsystems::realbi::demos::clean::golf-sales::sales-data.csv';

    EXPORT cleanLayout := RECORD
        STRING CourseID;
        STRING CourseName;
        STRING SaleID;
        Std.Date.Date_t SaleDate;
        UNSIGNED1 SaleDay;
        UNSIGNED1 SaleMonth;
        INTEGER2  SaleYear;
        UNSIGNED1 SaleHourOfDay;
        Std.Date.Time_t SaleTime;
        Std.Date.Date_t ReportDate;
        STRING ItemID;
        STRING ItemDescription;
        REAL ActualPrice;
        REAL Quantity;
        REAL SalesTax;
        STRING LMPField;
    END;

    EXPORT cleanDS := DATASET(cleanFile, cleanLayout, THOR);

    

END;

