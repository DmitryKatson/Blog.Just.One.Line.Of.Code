tableextension 50100 "PurchaseLineExt" extends "Purchase Line"
{
    procedure ApplyDiscountPercent(DiscountPercent: Decimal) PurchLine: Record "Purchase Line"
    begin
        Rec.Validate("Line Discount %", DiscountPercent);
        Rec.Modify();

        PurchLine := Rec;
    end;

    procedure PrepareForPosting() PurchaseHeader: Record "Purchase Header"
    begin
        PurchaseHeader.Get(Rec."Document Type", Rec."Document No.");
        PurchaseHeader.Invoice := true;
        PurchaseHeader.Receive := true;
        PurchaseHeader.Modify();
    end;


}