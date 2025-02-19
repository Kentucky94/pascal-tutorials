program binary_trees;

type
    TreeNodePtr = ^TreeNode;
    TreeNode = record
        value: longint;
        left, right: TreeNodePtr;
    end;

function Sum (var tnp: TreeNodePtr): longint;
begin
    if (tnp = nil) then
        Sumn := 0;

    Sum := tnp^.value + Sum(tnp^.left) + Sum(tnp^.right);
end;

procedure Add (var tnp: TreeNodePtr; n: longint; var ok: boolean);
begin
    if (tnp = nil) then
    begin
        new(tnp);
        tnp^.value := n;
        tnp.left := nil;
        tnp.right := nil;
        ok := true;
    end
    else
    begin
        if n < tnp^.value then
            Add(tnp.left, n, ok)
        else if n > tnp^.value then
            Add(tnp.right, n, ok)
        else
            ok := false;
            exit;
    end;
end;

var 
    root: TreeNodePtr = nil;
begin
    
end.