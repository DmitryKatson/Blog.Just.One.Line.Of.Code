codeunit 50100 "Appartment-Purchase"
{
    SingleInstance = true;

    procedure PurchaseAppartment(PurchaseHeader: Record "Purchase Header")
    begin
        SetSize(100).SetNoOfBedrooms(2).FindAppartment().CreatePurchaseLine(PurchaseHeader).ApplyDiscountPercent(10).PrepareForPosting().SendToPosting(CODEUNIT::"Purch.-Post");
    end;

    var
        Appartment: Record Appartment;


    procedure SetSize(Space: Decimal): Codeunit "Appartment-Purchase";
    begin
        Appartment.Space := Space;
    end;

    procedure SetNoOfBedrooms(NoOfBedrooms: Integer): Codeunit "Appartment-Purchase"
    begin
        Appartment."Number of Bedrooms" := NoOfBedrooms;
    end;

    procedure FindAppartment(): Record Appartment
    begin
        exit(Appartment.Find());
    end;






}