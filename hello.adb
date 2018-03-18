with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Hello is
type Integer_Array is array(Positive range<>) of Integer;

function Get_Input_Array return Integer_Array is
N : Integer := Integer'Value(Get_Line);
Elements : Integer_Array(1..N);
begin
    for I in 1..N loop
        Elements(I) := Integer'Value(Get_Line);
    end loop;
    return Elements;
end Get_Input_Array;
Input_Elements : Integer_Array := Get_Input_Array;
begin
    for I in 1..Input_Elements'Length loop
        Put(Input_Elements(I)); New_Line;
    end loop;
end Hello;
