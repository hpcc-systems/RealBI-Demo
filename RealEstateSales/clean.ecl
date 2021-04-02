IMPORT schema;
IMPORT std;

OUTPUT(schema.rawDS);


cleanDS := PROJECT
           (
               schema.rawDS,
               TRANSFORM
               (
                   schema.cleanLayout, 
                   dateRecorded := Std.Date.FromStringToDate(LEFT.dateRecorded[..10], '%m/%d/%Y');
                   SELF.dateRecorded:= dateRecorded,                                    
                   SELF.dayRecorded := STD.Date.Day(dateRecorded),
                   SELF.monthRecorded := STD.Date.Month(dateRecorded),
                   SELF.yearRecorded := STD.Date.Year(dateRecorded),
                   SELF := LEFT
                )
            );   

OUTPUT(cleanDS,,schema.cleanFile,thor,compressed,overwrite,expire(100),named('clean'));



