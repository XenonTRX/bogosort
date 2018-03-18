with Ada.Text_IO; 
use Ada.Text_IO;

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


N : Integer;
begin
    N := Integer'Value(Get_Line);
    declare
    Elements : Integer_array(1..N);
    begin
        for I in 1..N loop
            Elements(I) := Integer'Value(Get_Line);
            --Put_Line("hi");
        end loop;
    end;
end Hello;
