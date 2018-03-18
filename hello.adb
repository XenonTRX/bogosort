with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Discrete_Random;

procedure Hello is
    type Integer_Array is array(Positive range<>) of Integer;
    package Random_Integer is new Ada.Numerics.Discrete_Random(Result_Subtype=>Integer);
    use Random_Integer;
    
    function Get_Input_Array return Integer_Array is
        N : Integer := Integer'Value(Get_Line);
        Elements : Integer_Array(1..N);
    begin
        for I in 1..N loop
            Elements(I) := Integer'Value(Get_Line);
        end loop;
        return Elements;
    end Get_Input_Array;
    
    function Random_Integer_In_Range(Lower, Higher: Integer; G: Generator) return Integer is
    begin
        return (Random(G) mod (Higher-Lower + 1)) + Lower;
    end Random_Integer_In_Range;
    
    function Knuth_Shuffle(Input_Array: Integer_Array; G: Generator) return Integer_Array is
        Output_Array : Integer_Array(1..Input_Array'Length);
        J : Integer;
    begin
        for I in 1..Input_Array'Length loop
            J := Random_Integer_In_Range(1, I, G);
            if (J /= I) then
                Output_Array(I) := Output_Array(J);
            end if;
            Output_Array(J) := Input_Array(I);
        end loop;
        return Output_Array;
    end Knuth_Shuffle;
    
    function Is_Sorted(Input_Array: Integer_Array) return Boolean is
        Previous_value : Integer := Integer'First;
    begin
        for I in Input_Array'Range loop
            if Previous_Value > Input_Array(I) then
                return False;
            end if;
            Previous_Value := Input_Array(I);
        end loop;
        return True;
    end Is_Sorted;

    --function Binary_Bogosort(Input_Array: Integer_Array; G: Generator) return Integer_Array is
    
    --end Binary_Bogosort;
    Input_Elements : Integer_Array := Get_Input_Array;
    Shuffled : Integer_Array (1..Input_Elements'Length);
    G: Generator;
begin
    Reset(G);
    Shuffled := Knuth_Shuffle(Input_Elements, G);
    for I in 1..Shuffled'Length loop
        Put(Shuffled(I)); New_Line;
    end loop;
end Hello;
