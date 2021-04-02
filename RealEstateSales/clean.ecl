IMPORT schema;
IMPORT std;

OUTPUT(schema.raw.ds,,NAMED('raw'));


cleanDS := PROJECT
           (
               schema.raw.ds,
               TRANSFORM
               (
                   schema.clean.layout, 
                   dateRecorded := Std.Date.FromStringToDate(LEFT.dateRecorded[..10], '%m/%d/%Y');
                   SELF.dateRecorded:= dateRecorded,                                    
                   SELF.dayRecorded := STD.Date.Day(dateRecorded),
                   SELF.monthRecorded := STD.Date.Month(dateRecorded),
                   SELF.yearRecorded := STD.Date.Year(dateRecorded),
                   SELF.city := STD.Str.ToUpperCase(LEFT.city),
                   SELF := LEFT
                )
            );   

OUTPUT(cleanDS (yearRecorded <> 0),,schema.clean.path,thor,compressed,overwrite,expire(100),named('clean'));



