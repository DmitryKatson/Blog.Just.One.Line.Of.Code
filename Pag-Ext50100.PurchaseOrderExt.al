pageextension 50100 "PurchaseOrderExt" extends "Purchase Order"
{
    actions
    {
        addafter(Comment)
        {
            action(PurchaseAppartment)
            {
                Image = NewBranch;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = all;
                Caption = 'Get Appartment';
                trigger OnAction()
                var
                    AppartmentPurch: Codeunit "Appartment-Purchase";
                begin
                    AppartmentPurch.PurchaseAppartment(Rec);
                end;
            }

        }
    }
}