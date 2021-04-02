IMPORT Std;

EXPORT schema := MODULE
    
    EXPORT rawFile := '~hpccsystems::realbi::demos::raw::real-estate::sales-connecticut-2001-2018.csv';
    
    EXPORT rawLayout := RECORD
        STRING serialNumber;
        UNSIGNED4 listYear;
        STRING dateRecorded;
        STRING town;
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

    EXPORT rawDS := DATASET(rawFile,rawLayout,CSV(heading(1)));

    EXPORT cleanFile := '~hpccsystems::realbi::demos::clean::real-estate::sales-connecticut-2001-2018.csv';

    EXPORT cleanLayout := RECORD
        STRING serialNumber;
        UNSIGNED4 listYear;
        Std.Date.Date_t dateRecorded;
        UNSIGNED1 dayRecorded;
        UNSIGNED1 monthRecorded;
        INTEGER2  yearRecorded;
        STRING town;
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

    EXPORT cleanDS := DATASET(cleanFile, cleanLayout,THOR); 

END;