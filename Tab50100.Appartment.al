table 50100 "Appartment"
{
    fields
    {
        field(1; "ID"; Guid)
        {
        }
        field(10; "Space"; Decimal)
        {

        }
        field(11; "Number of Bedrooms"; Integer)
        {

        }
        field(12; "Number of Bathrooms"; Integer)
        {

        }
        field(20; Price; Decimal)
        {

        }
    }

    keys
    {
        key(id; ID)
        {

        }
        key(price; Price)
        {

        }
    }

    procedure Create(Space: Decimal; NoOfBedrooms: Integer; NoOfBathrooms: Integer; Price: Decimal)
    begin
        Rec.Init();
        Rec.ID := CreateGuid();
        Rec.Space := Space;
        Rec."Number of Bedrooms" := NoOfBedrooms;
        Rec."Number of Bathrooms" := NoOfBathrooms;
        Rec.Price := Price;
        Rec.Insert();
    end;

    procedure Find() Appartment: Record Appartment;
    begin
        Appartment.SetCurrentKey(Price);
        Appartment.SetAscending(Price, true);
        if Rec.Space <> 0 then
            Appartment.SetRange(Space, Space);
        If Rec."Number of Bedrooms" <> 0 then
            Appartment.SetRange("Number of Bedrooms", Rec."Number of Bedrooms");
        If Rec."Number of Bathrooms" <> 0 then
            Appartment.SetRange("Number of Bathrooms", Rec."Number of Bathrooms");
        Appartment.FindFirst();
    end;

    procedure CreatePurchaseLine(PurchaseHeader: Record "Purchase Header") PurchaseLine: Record "Purchase Line";
    begin
        PurchaseLine.Init();
        PurchaseLine."Document Type" := PurchaseHeader."Document Type";
        PurchaseLine."Document No." := PurchaseHeader."No.";
        PurchaseLine."Line No." := 10000;
        PurchaseLine.Validate(Type, PurchaseLine.Type::"G/L Account");
        PurchaseLine.Validate("No.", '60100');
        PurchaseLine.Description := StrSubstNo('Appartment: Space %1, Bedrooms %2, Bathrooms %3', Rec.Space, Rec."Number of Bedrooms", Rec."Number of Bathrooms");
        PurchaseLine.Validate(Quantity, 1);
        PurchaseLine.Validate("Direct Unit Cost", Rec.Price);
        PurchaseLine.Insert(true);
    end;
}