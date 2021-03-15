codeunit 50101 "AppartmentInstallApp"
{
    Subtype = Install;
    trigger OnInstallAppPerCompany()
    var
        Appartment: Record Appartment;
    begin
        Appartment.Create(100, 2, 2, 100000);
        Appartment.Create(120, 3, 2, 120000);
        Appartment.Create(150, 4, 3, 150000);
        Appartment.Create(200, 5, 4, 200000);
    end;
}