local SG = {};

--// https://github.com/strawbberrys/LuaScripts/blob/main/TableDumper.lua
local type = type local pairs = pairs local tostring = tostring local string_rep = string.rep local table_concat = table.concat local function DumpTable(Table, IndentAmount) local IndentAmount, TableAmount, Amount = IndentAmount or 1, 0, 0 local Indent = string_rep("    ", IndentAmount) for Index in pairs(Table) do TableAmount = TableAmount + 1 end local TableDump, Ending = {((TableAmount > 0 and "{\n") or "{")}, (((IndentAmount > 1 and TableAmount > 0) and "},\n") or "}") for Index, Value in pairs(Table) do local ValueType = type(Value) Amount = Amount + 1 local FixedValue = ((ValueType == "string" or ValueType == "function") and "\"" .. tostring(Value) .. "\"" or tostring(Value)) local Data = ((ValueType ~= "table" and "[\"" .. tostring(Index) .. "\"] = " .. FixedValue or "[\"" .. tostring(Index) .. "\"] = " .. DumpTable(Value, IndentAmount + 1))) local Key = Indent .. ((ValueType ~= "table" and Data .. ((Amount ~= TableAmount and ",\n") or "")) or Data) TableDump[#TableDump + 1] = Key end TableDump[#TableDump + 1] = ((TableAmount > 0 and "\n") or "") .. (((IndentAmount > 1 and TableAmount > 0) and string_rep("    ", IndentAmount - 1) .. Ending or Ending .. ((TableAmount == 0 and ",\n") or ""))) return table_concat(TableDump) end

SG.Generate = function(consts)
    local Code = ([=[
--Code generated by cenv
local Function;
for i,v in next,getgc(true) do
    if (type(v) == 'function' and islclosure(v) and not is_synapse_function(v)) then
        local Consts = %s;
        for i2,v2 in next,Consts do
            if table.find(debug.getconstants(v),v2) then
                Function = v;
            end;
        end;
    end;
end;]=]):format(DumpTable(consts));
    return Code;
end;

return SG;