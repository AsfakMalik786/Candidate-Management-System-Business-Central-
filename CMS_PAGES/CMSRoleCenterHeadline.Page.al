page 53107 "CMS Role Center Headline"
{
    PageType = HeadlinePart;

    layout
    {
        area(Content)
        {
            group(General)
            {
                ShowCaption = false;
                field(Welcome; Welcome)
                {
                    ApplicationArea = All;
                    Style = Strong;
                }
                field(Awesome; BusinessCentralIsAwesomeLbl)
                {
                    ApplicationArea = All;
                    Style = StrongAccent;

                    trigger OnDrillDown()
                    begin
                        Hyperlink('https://go.microsoft.com/fwlink/?linkid=867580');
                    end;
                }
            }

        }
    }

    trigger OnOpenPage()
    begin
        Welcome := StrSubstNo(Welcome_Lbl, UserId());
    end;



    var
#pragma warning disable AA0470
        Welcome_Lbl: Label 'Welcome %1';
#pragma warning restore AA0470
        BusinessCentralIsAwesomeLbl: Label '<qualifier>Microsoft Learn</qualifier><payload>Let Growth Your Career<emphasize> With Business Central</emphasize> are awesome!</payload>';
        Welcome: Text;



}