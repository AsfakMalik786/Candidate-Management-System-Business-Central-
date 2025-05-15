namespace TSE_PermissionSet;

permissionset 53101 CMS_PermissionSet
{
    Assignable = true;
    Permissions = tabledata "CMS Candidate Application" = RIMD,
        tabledata "CMS Candidate Mgt Setup" = RIMD,
        tabledata "CMS Designation" = RIMD,
        tabledata "CMS Interview Committee" = RIMD,
        tabledata "CMS Interview Location" = RIMD,
        tabledata "CMS Qualification" = RIMD,
        tabledata "CMS Training Application" = RIMD,
        tabledata "CMS Vacancy" = RIMD,
        tabledata "CMS Cue Table" = RMID,
        tabledata "CMS Department Table" = RMID,
        table "CMS Candidate Application" = X,
        table "CMS Candidate Mgt Setup" = X,
        table "CMS Designation" = X,
        table "CMS Interview Committee" = X,
        table "CMS Interview Location" = X,
        table "CMS Qualification" = X,
        table "CMS Training Application" = X;

}