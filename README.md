# Loader
```lua
loadstring(game:HttpGetAsync('https://raw.githubusercontent.com/strsplspace/utils/main/cenv.lua'))();
```
# Usage

## getprotoclosures

```lua
<table> getprotoclosures(<LocalScript>);
```
Returns the protos of LocalScript

## searchclosureconst
```lua
<function> searchclosureconst(<any> Constants)
```
Returns the function that contains ``` Constants ```

Example of usage 

LocalScript contains this code:
```lua
spawn(function()
	spawn(function() --We need to get this function
		print('a');
		warn('b');
	end);
end);
```
Our code:
```lua
local Fn = searchclosureconst('print','a','warn','b');

print(Fn);
```

## searchclosureups
```lua
<function> searchclosureups(<any> Upvalues)
```
Works same as ```searchclosureconst``` but with ```Upvalues```

## getscriptlocals
### SYNAPSE DONT SUPPORT THIS FUNCTION RIGHT NOW
```lua
<table> getscriptlocals(<LocalScript>)
```
Returns the NON Upvalue variables of script