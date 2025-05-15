table 53503 "CMS Candidate Application"
{
    Caption = 'CMS Candidate Applicatio';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = "No. Series";
        }
        field(73; "No. series"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(2; "First Name"; Text[30])
        {
            Caption = 'First Name';
        }
        field(3; "Middle Name"; Text[30])
        {
            Caption = 'Middle Name';
        }
        field(4; "Last Name"; Text[30])
        {
            Caption = 'Last Name';
        }
        field(5; "Vacancy No."; Code[20])
        {
            Caption = 'Vacancy No.';
            TableRelation = "CMS Vacancy";
        }
        field(6; Gender; enum "CMS Application Gender")
        {
            Caption = 'Gender';
        }
        field(7; "Date of Birth"; Date)
        {
            Caption = 'Date of Birth';
        }
        field(8; "Marital Status "; enum "CMS Maital Status")
        {
            Caption = 'Marital Status ';
        }
        field(9; Status; enum "CMS Application Status")
        {
            Caption = 'Status';
        }
        field(10; "Contact No."; Text[30])
        {
            Caption = 'Contact No.';
        }
        field(11; Address; Text[50])
        {
            Caption = 'Address';
        }
        field(12; "Address 2"; Text[100])
        {
            Caption = 'Address 2';
        }
        field(13; City; Text[30])
        {
            Caption = 'City';
        }
        field(14; State; Code[20])
        {
            Caption = 'State';
        }
        field(15; "Country/Region Code "; Code[20])
        {
            Caption = 'Country/Region Code ';
        }
        field(16; "E-mail "; Text[80])
        {
            Caption = 'E-mail ';
        }
        field(17; "Experienced "; Boolean)
        {
            Caption = 'Experienced ';
            trigger OnValidate()
            begin
                if not "Experienced " then begin
                    "Current Designation" := '';
                    "Company Name" := '';
                    "Company Experience" := 0;
                    "Company Address" := '';
                    "Applied Designation" := '';
                    "Total Experience in years" := 0;
                    "Current CTC" := 0;
                    "Expected CTC " := 0;
                end;
            end;
        }
        field(18; "Company Name"; Text[50])
        {
            Caption = 'Company Name';
            trigger OnValidate()
            begin
                CheckExperienceBeforeInsert();
            end;
        }
        field(19; "Company Experience"; Decimal)
        {
            Caption = 'Company Experience';
            trigger OnValidate()
            begin
                CheckExperienceBeforeInsert();
            end;
        }
        field(20; "Current Designation"; Code[20])
        {
            Caption = 'Current Designation';
            trigger OnValidate()
            begin
                CheckExperienceBeforeInsert();
            end;
        }
        field(21; "Company Address"; Text[150])
        {
            Caption = 'Company Address';
            trigger OnValidate()
            begin
                CheckExperienceBeforeInsert();
            end;
        }
        field(22; "Applied Designation"; Code[20])
        {
            Caption = 'Applied Designation';

        }
        field(23; "Total Experience in years"; Decimal)
        {
            Caption = 'Total Experience in years';
            trigger OnValidate()
            begin
                CheckExperienceBeforeInsert();
            end;
        }
        field(24; "Current CTC"; Decimal)
        {
            Caption = 'Current CTC';
            trigger OnValidate()
            begin
                CheckExperienceBeforeInsert();
            end;
        }
        field(25; "Expected CTC "; Decimal)
        {
            Caption = 'Expected CTC ';
        }
        field(26; "Notice Period in Days"; Integer)
        {
            Caption = 'Notice Period in Days';
        }
        field(27; "Manager No. "; Code[20])
        {
            Caption = 'Manager No. ';
        }
        field(28; "First Responsible Interviewer"; Code[20])
        {
            Caption = 'First Responsible Interviewer';
            TableRelation = Employee;
            trigger OnValidate()
            var
                Employee: Record Employee;
            begin
                if Employee.Get(Rec."First Responsible Interviewer") then
                    Rec."First Res. Interviewer Name" := Employee.FullName();

            end;
        }
        field(29; "First Res. Interviewer Name"; Text[100])
        {
            Caption = 'First Responsible Interviewer Name';

        }
        field(30; "First Interview Committee"; Code[20])
        {
            Caption = 'First Interview Committee';
            TableRelation = "CMS Interview Committee";

            trigger OnValidate()
            var
                Committee: Record "CMS Interview Committee";
            begin
                if Committee.Get("First Interview Committee") then
                    "First Interview Committee Desc" := Committee."Committee Name"
                // "First Responsible Interviewer" := Committee."Interviewer 1 Code";
                // "First Res. Interviewer Name" := Committee."Interviewer 1 Name";
                //     else begin
                //         "First Interview Committee Desc" := '';
                //         // "First Responsible Interviewer" := '';
                //     end;
            end;

        }
        field(31; "First Interview Committee Desc"; Code[30])
        {
            Caption = 'First Interview Committee Description';
            Editable = false;

        }
        field(32; "First Interview Location"; Text[20])
        {
            Caption = 'First Interview Location';
            TableRelation = "CMS Interview Location";
            trigger OnValidate()
            var
                location: Record "CMS Interview Location";
            begin
                if location.Get("First Interview Location") then
                    "First Interview Location" := location."Location Name";
            end;
        }
        field(33; "First Remarks"; Text[200])
        {
            Caption = 'First Remarks';
        }
        field(34; "First Priority"; enum "CMS First Priority")
        {
            Caption = 'First Priority';
        }
        field(35; "First Best Day to Reach"; Date)
        {
            Caption = 'First Best Day to Reach';
        }
        field(36; "First Best Time to Reach"; Time)
        {
            Caption = 'First Best Time to Reach';
        }
        field(37; "Second Responsible Interviewer"; Code[20])
        {
            Caption = 'Second Responsible Interviewer';
            // TableRelation = "CMS Interview Committee"."Interviewer 2 Code";
            // trigger OnValidate()
            // var
            //     comitee: Record "CMS Interview Committee";
            // begin
            //     if comitee.Get("Second Responsible Interviewer") then
            //         "Second Respo. Interviewer Name" := comitee."Interviewer 2 Name"
            //     else
            //         "Second Respo. Interviewer Name" := '';
            // end;
            TableRelation = Employee;
            trigger OnValidate()
            var
                Employee: Record Employee;
            begin
                if Employee.Get("Second Responsible Interviewer") then
                    "Second Respo. Interviewer Name" := Employee.FullName()
                else
                    "Second Respo. Interviewer Name" := '';
            end;

        }
        field(38; "Second Respo. Interviewer Name"; Text[100])
        {
            Caption = 'Second Responsible Interviewer Name';

        }
        field(39; "Second Interview Committee"; Code[50])
        {
            Caption = 'Second Interview Committee';
            TableRelation = "CMS Interview Committee";
            trigger OnValidate()
            var
                Committee: Record "CMS Interview Committee";
            begin
                if Committee.Get("Second Interview Committee") then
                    "Second Interview Committee Des" := Committee."Committee Name";
                // "Second Responsible Interviewer" := Committee."Interviewer 2 Code";
                // "Second Respo. Interviewer Name" := Committee."Interviewer 2 Name";
                //     end else begin
                //         "First Interview Committee Desc" := '';
                //         "First Responsible Interviewer" := '';
                //     end;
            end;
        }
        field(40; "Second Interview Committee Des"; Text[30])
        {
            Caption = 'Second Interview Committee Description';
            Editable = false;
        }
        field(41; "Second Interview Location"; Code[20])
        {
            Caption = 'Second Interview Location';
            TableRelation = "CMS Interview Location";
            trigger OnValidate()
            var
                location: Record "CMS Interview Location";
            begin
                if location.Get("Second Interview Location") then
                    "Second Interview Location" := location."Location Name";
            end;
        }
        field(42; "Second Remarks "; Text[200])
        {
            Caption = 'Second Remarks ';
        }
        field(43; "Second Priority"; enum "CMS First Priority")
        {
            Caption = 'Second Priority';

        }
        field(44; "Second Best Day to Reach"; Date)
        {
            Caption = 'Second Best Day to Reach';
        }
        field(45; "Second Best Time to Reach"; Time)
        {
            Caption = 'Second Best Time to Reach';
        }
        field(46; "Third Responsible Interviewer"; Code[20])
        {
            Caption = 'Third Responsible Interviewer';
            // TableRelation = "CMS Interview Committee";
            // trigger OnValidate()
            // var
            //     comitee: Record "CMS Interview Committee";
            // begin
            //     if comitee.Get("Third Responsible Interviewer") then
            //         "Third Respo Interviewer Name" := comitee."Interviewer 3 Name"
            //     else
            //         "Third Respo Interviewer Name" := '';
            // end;
            TableRelation = Employee;

        }
        field(47; "Third Respo Interviewer Name"; Text[100])
        {
            Caption = 'Third Responsible Interviewer Name';
            trigger OnValidate()
            var
                Employee: Record Employee;
            begin
                if Employee.Get("Third Responsible Interviewer") then
                    "Third Respo Interviewer Name" := Employee.FullName()
                else
                    "Third Respo Interviewer Name" := '';
            end;
        }
        field(48; "Third Interview Committee"; Code[20])
        {
            Caption = 'Third Interview Committee';
            TableRelation = "CMS Interview Committee";
            trigger OnValidate()
            var
                Committee: Record "CMS Interview Committee";
            begin
                if Committee.Get("Third Interview Committee") then
                    "Third Interview Committee Desc" := Committee."Committee Name";
                // "Third Responsible Interviewer" := Committee."Interviewer 3 Code";
                // "Third Respo Interviewer Name" := Committee."Interviewer 3 Name";
                // end else begin
                //     "Third Interview Committee Desc" := '';
                //     "Third Responsible Interviewer" := '';
                // end;
            end;
        }
        field(49; "Third Interview Committee Desc"; Text[30])
        {
            Caption = 'Third Interview Committee Description';
            Editable = false;

        }
        field(50; "Third Interview Location"; Code[20])
        {
            Caption = 'Third Interview Location';
            TableRelation = "CMS Interview Location";
            trigger OnValidate()
            var
                location: Record "CMS Interview Location";
            begin
                if location.Get("Third Interview Location") then
                    "Third Interview Location" := location."Location Name";
            end;
        }
        field(51; "Third Remarks "; Text[200])
        {
            Caption = 'Third Remarks ';
        }
        field(52; "Third Priority"; enum "CMS First Priority")
        {
            Caption = 'Third Priority';

        }
        field(53; "Third Best Day to Reach"; Date)
        {
            Caption = 'Third Best Day to Reach';
        }
        field(54; "Third Best Time to Reach"; Time)
        {
            Caption = 'Third Best Time to Reach';
        }
        field(74; "First Interview Round"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(75; "Second Interview Round"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(76; "Third Interview Round"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(95; "Fourth Interview Round"; Boolean)
        {
            DataClassification = ToBeClassified;

        }
        field(96; "Fifth Interview Round"; Boolean)
        {
            DataClassification = ToBeClassified;
        }

        field(77; "Fourth Responsible Interviewer"; Code[20])
        {
            Caption = 'Fourth Responsible Interviewer';
            TableRelation = Employee;
        }
        field(78; "Fourth Res. Interviewer Name"; Text[100])
        {
            Caption = 'Fourth Responsible Interviewer Name';
            trigger OnValidate()
            var
                Employee: Record Employee;
            begin
                if Employee.Get("Fourth Responsible Interviewer") then
                    "Fourth Res. Interviewer Name" := Employee.FullName()
                else
                    "Fourth Res. Interviewer Name" := '';
            end;
        }
        field(79; "Fourth Interview Committee"; Code[20])
        {
            Caption = 'Fourth Interview Committee';
            TableRelation = "CMS Interview Committee";

            trigger OnValidate()
            var
                Committee: Record "CMS Interview Committee";
            begin
                if Committee.Get("Fourth Interview Committee") then
                    "Fourth Interview Committe Desc" := Committee."Committee Name";
                // "Fourth Responsible Interviewer" := Committee."Interviewer 1 Code";
                // "Fourth Res. Interviewer Name" := Committee."Interviewer 1 Name";
                //     end else begin
                //         "Fourth Interview Committe Desc" := '';
                //         "Fourth Responsible Interviewer" := '';
                //     end;
            end;

        }
        field(80; "Fourth Interview Committe Desc"; Code[30])
        {
            Caption = 'Fourth Interview Committee Description';
            Editable = false;

        }
        field(81; "Fourth Interview Location"; Text[20])
        {
            Caption = 'Fourth Interview Location';
            TableRelation = "CMS Interview Location";
            trigger OnValidate()
            var
                location: Record "CMS Interview Location";
            begin
                if location.Get("Fourth Interview Location") then
                    "Fourth Interview Location" := location."Location Name";
            end;
        }
        field(82; "Fourth Remarks"; Text[200])
        {
            Caption = 'Fourth Remarks';
        }
        field(83; "Fourth Priority"; enum "CMS First Priority")
        {
            Caption = 'Fourth Priority';
        }
        field(84; "Fourth Best Day to Reach"; Date)
        {
            Caption = 'Fourth Best Day to Reach';
        }
        field(85; "Fourth Best Time to Reach"; Time)
        {
            Caption = 'Fourth Best Time to Reach';
        }
        field(86; "Fifth Responsible Interviewer"; Code[20])
        {
            Caption = 'Fifth Responsible Interviewer';
            TableRelation = Employee;
        }
        field(87; "Fifth Res. Interviewer Name"; Text[100])
        {
            Caption = 'Fifth Responsible Interviewer Name';
            trigger OnValidate()
            var
                Employee: Record Employee;
            begin
                if Employee.Get("Fifth Responsible Interviewer") then
                    "Fifth Res. Interviewer Name" := Employee.FullName()
                else
                    "Fifth Res. Interviewer Name" := '';
            end;
        }
        field(88; "Fifth Interview Committee"; Code[20])
        {
            Caption = 'Fifth Interview Committee';
            TableRelation = "CMS Interview Committee";

            trigger OnValidate()
            var
                Committee: Record "CMS Interview Committee";
            begin
                if Committee.Get("Fifth Interview Committee") then begin
                    "Fifth Interview Committe Desc" := Committee."Committee Name";
                    "Fifth Responsible Interviewer" := Committee."Interviewer 1 Code";
                    "Fifth Res. Interviewer Name" := Committee."Interviewer 1 Name";
                end else begin
                    "Fifth Interview Committe Desc" := '';
                    "Fifth Responsible Interviewer" := '';
                end;
            end;

        }
        field(89; "Fifth Interview Committe Desc"; Code[30])
        {
            Caption = 'Fifth Interview Committee Description';
            Editable = false;

        }
        field(90; "Fifth Interview Location"; Text[20])
        {
            Caption = 'Fifth Interview Location';
            TableRelation = "CMS Interview Location";
            trigger OnValidate()
            var
                location: Record "CMS Interview Location";
            begin
                if location.Get("Fifth Interview Location") then
                    "Fifth Interview Location" := location."Location Name";
            end;
        }
        field(91; "Fifth Remarks"; Text[200])
        {
            Caption = 'Fifth Remarks';
        }
        field(92; "Fifth Priority"; enum "CMS First Priority")
        {
            Caption = 'Fifth Priority';
        }
        field(93; "Fifth Best Day to Reach"; Date)
        {
            Caption = 'Fourth Best Day to Reach';
        }
        field(94; "Fifth Best Time to Reach"; Time)
        {
            Caption = 'Fourth Best Time to Reach';
        }


    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }


    procedure AssistEditCanApp(OldVac: Record "CMS Candidate Application"): Boolean
    var
        CAnApp: Record "CMS Candidate Application";
        CanMgtSet: Record "CMS Candidate Mgt Setup";
        Noseriesmgt: Codeunit "No. Series";
    begin
        CAnApp := Rec;
        CanMgtSet.Get();
        CanMgtSet.TestField("Candidate Application Nos.");
        if Noseriesmgt.LookupRelatedNoSeries(CanMgtSet."Candidate Application Nos.", OldVac."No. Series", CAnApp."No. Series") then begin
            CAnApp."No." := Noseriesmgt.GetNextNo(CAnApp."No. Series");
            Rec := CAnApp;
            exit(true);
        end;
    end;

    // procedure AssistEditComitee(Comitee: Record "CMS Interview Committee")
    // CanApp: Record "CMS Candidate Application";
    // begin
    //     CanApp.Get();
    //     CanApp.TestField("First Interview Committee");
    //     CanApp.TestField("First Res. Interviewer Name");
    //     if CanApp."First Interview Committee" = '' then
    //         CanApp."First Interview Committee" := Comitee."Committee Name";
    //     CanApp."Second Interview Committee" := Comitee."Committee Name";
    //     CanApp."First Res. Interviewer Name" := Comitee."Interviewer 1 Name";
    //     CanApp."Second Respo. Interviewer Name" := Comitee."Interviewer 2 Name";


    // end;

    local procedure CheckExperienceBeforeInsert()
    begin
        if not "Experienced " then
            Error('Experience must be selected before entering experience-related details.');
    end;


}
