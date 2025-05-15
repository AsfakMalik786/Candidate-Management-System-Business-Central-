page 53125 "CMS Role Center Page"
{
    PageType = RoleCenter;
    Caption = 'Candidate Management Role Center';
    RefreshOnActivate = true;
    layout
    {
        area(RoleCenter)
        {
            group(Group1)
            {
                part(Part1; "CMS Role Center Headline")
                {
                    ApplicationArea = All;
                }

                part(part3; "CMS Candidate Cues")
                {
                    ApplicationArea = All;

                }
                part(part4; "CMS Vacancy Cues")
                {
                    ApplicationArea = All;
                }

            }


        }

    }

    actions
    {

        area(Sections)
        {
            group(Vacancies)
            {
                Caption = 'Vacancies';
                action("Vacancy List")
                {
                    Caption = 'Open Vacancies';
                    ApplicationArea = All;
                    RunObject = page "CMS Vacancy List";
                    Image = List;

                }
                action("Closed Vacancy List")
                {
                    Caption = 'Closed Vacancies';
                    ApplicationArea = All;
                    RunObject = page "CMS Closed Vacancy List";
                    Image = List;
                }

            }
            group(Candidates)
            {
                Caption = 'Candidates';
                action("Candidate Application List")
                {
                    Caption = 'Candidate Applications';
                    ApplicationArea = All;
                    RunObject = page "CMS Candidate Application List";
                    Image = List;

                }
            }
            group(Employees)
            {
                Caption = 'Employees';
                action("Employee List")
                {
                    Caption = 'Employees';
                    ApplicationArea = All;
                    RunObject = page "CMS Employee List";
                    Image = List;

                }

            }
            group(Training)
            {
                Caption = 'Training';
                action("Training Application List")
                {
                    Caption = 'Training Applications';
                    ApplicationArea = All;
                    RunObject = page "CMS Training Application List";
                    Image = List;

                }

            }
            group(Setup)
            {
                Caption = 'Setup';
                action("Candidate Management Setup")
                {
                    Caption = 'Candidate Management Setup';
                    ApplicationArea = All;
                    RunObject = page "CMS Candidate Management Setup";
                    Image = Setup;

                }
                action("Designation List")
                {
                    Caption = 'Designations';
                    ApplicationArea = All;
                    RunObject = page "CMS Desination List";
                    Image = List;
                }
                action("Department List")
                {
                    Caption = 'Departments';
                    ApplicationArea = All;
                    RunObject = page "CMS Department List";
                    Image = List;
                }
                action("Interview Committee List")
                {
                    Caption = 'Interview Committees';
                    ApplicationArea = All;
                    RunObject = page "CMS Interview Comitee List";
                    Image = List;
                }
                action("Interview Location List")
                {
                    Caption = 'Interview Locations';
                    ApplicationArea = All;
                    RunObject = page "CMS Interview Location List";
                    Image = List;
                }
                action("Qualification List")
                {
                    Caption = 'Qualifications';
                    ApplicationArea = All;
                    RunObject = page "CMS Qualification List";
                    Image = List;
                }
            }


        }
        area(Creation)
        {

            action("Vacancy Card")
            {
                ApplicationArea = All;
                ToolTip = 'Create a new Vacancy Card';
                Caption = 'Vacancy Card';
                Image = Card;
                RunObject = page "CMS Vacancy Card";
                RunPageMode = Create;
            }
            action("Candidate Application Card")
            {
                ApplicationArea = All;
                ToolTip = 'Create a new Candidate Application Card';
                Caption = 'Candidate Application Card';
                Image = Card;
                RunObject = page "CMS Candidate Application Card";
                RunPageMode = Create;
            }

            action("Interview Location")
            {
                ApplicationArea = All;
                Caption = 'Interview Locations';
                RunObject = page "CMS Interview Location List";
                Image = List;
                RunPageMode = Edit;
            }
            action("Inteview Comitees List")
            {
                Caption = 'Interview Committees';
                ApplicationArea = All;
                RunObject = page "CMS Interview Comitee List";
                Image = List;
                RunPageMode = Edit;

            }
            action("Department_Lists")
            {
                Caption = 'Departments';
                ApplicationArea = All;
                RunObject = page "CMS Department List";
                Image = List;
                RunPageMode = Edit;

            }
            action("Designations Lists")
            {
                Caption = 'Designations';
                ToolTip = 'Designation List';
                ApplicationArea = All;
                RunObject = page "CMS Desination List";
                Image = List;
                RunPageMode = Edit;

            }

        }
        area(Embedding)
        {

            action("Departments List")
            {
                ApplicationArea = All;
                Caption = 'Department List';
                Image = Card;
                RunObject = page "CMS Department List";
                RunPageMode = Create;

            }
            action("Interview Locations List")
            {
                ApplicationArea = All;
                Caption = 'Interview Location List';
                Image = List;
                RunObject = page "CMS Interview Location List";
                RunPageMode = Create;
            }
            action("Designations List")
            {
                ApplicationArea = All;
                Caption = 'Designation List';
                Image = List;
                RunObject = page "CMS Desination List";
                RunPageMode = Create;
            }
            action("Interview Commitees List")
            {
                ApplicationArea = All;
                Caption = 'Interview Committee List';
                Image = List;
                RunObject = page "CMS Interview Comitee List";
                RunPageMode = Create;
            }
            action("Qualifications List")
            {
                ApplicationArea = All;
                Caption = 'Qualification List';
                Image = List;
                RunObject = page "CMS Qualification List";
                RunPageMode = Create;
            }
        }



    }
}

#pragma warning disable AA0215
profile "Candidate Management Profile"
#pragma warning restore AA0215

{
    ProfileDescription = 'Candidate Management Profile';
    RoleCenter = "CMS Role Center Page";
    Caption = 'Candidate Managemet Profile';
}