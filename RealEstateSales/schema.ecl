IMPORT Std;

EXPORT schema := MODULE

    EXPORT raw := MODULE
        EXPORT path := '~hpccsystems::realbi::demos::raw::real-estate::sales-connecticut-2001-2018.csv';
        EXPORT layout := RECORD
            STRING serialNumber;
            UNSIGNED4 listYear;
            STRING dateRecorded;
            STRING city;
            STRING address;
            REAL assessedValue;
            REAL saleAmount;
            REAL saleRatio;
            STRING propertyType;
            STRING residentialType;
            STRING nonUseCode;
            STRING assessorRemarks;
            STRING opmRemarks;
            STRING location; 
        END;
        EXPORT ds := DATASET(path,layout,CSV(heading(1)));
    END;

    EXPORT clean := MODULE
        EXPORT path := '~hpccsystems::realbi::demos::clean::real-estate::sales-connecticut-2001-2018.flat';
        EXPORT layout := RECORD
            STRING serialNumber;
            UNSIGNED4 listYear;
            Std.Date.Date_t dateRecorded;
            UNSIGNED1 dayRecorded;
            UNSIGNED1 monthRecorded;
            INTEGER2  yearRecorded;
            STRING city;
            STRING address;
            REAL assessedValue;
            REAL saleAmount;
            REAL saleRatio;
            STRING propertyType;
            STRING residentialType;
            STRING nonUseCode;
            STRING assessorRemarks;
            STRING opmRemarks;
            STRING location; 
        END;
        EXPORT ds := DATASET(path, layout,THOR); 
    END;
    
    EXPORT yearly := MODULE
        EXPORT path := '~hpccsystems::realbi::demos::clean::real-estate::sales-yearly.flat';
        EXPORT layout := RECORD
            INTEGER2  yearRecorded;
            REAL saleAmount;        
        END;
        EXPORT ds := DATASET(path, layout,THOR); 
    END;
    
    EXPORT monthly := MODULE
        EXPORT path := '~hpccsystems::realbi::demos::clean::real-estate::sales-monthly.flat';
        EXPORT layout := RECORD
            INTEGER2  yearRecorded;
            UNSIGNED1 monthRecorded;
            REAL saleAmount;        
        END;
        EXPORT ds := DATASET(path, layout,THOR); 
    END;
END;