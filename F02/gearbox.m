function g = gearbox(n_shafts, ratios, name)
%  GEARBOX class constructor
%
%  g = gearbox(n_shafts, ratios, name)
%  creates a gearbox object from the set of data given.  
%
%  Written by Douglas De Boer, September 2002
if nargin == 0  %no gearbox data supplied-create an empty gearbox
   g = struct('n_shafts', 0, 'ratios', 0, 'name', '');   %an empty gearbox
   g = class(g, 'gearbox');                           %make it a gearbox class
   disp('Warning: an empty gearbox was created');
elseif nargin == 1
   if isa(n_shafts, 'gearbox')  %if a gearbox was input (in place of n_shafts)
      g = n_shafts;
   else     %insufficent data was given
       g = struct('n_shafts', 0, 'ratios', 0, 'name', '');   %an empty gearbox
       g = class(g, 'gearbox');                         %make it gearbox class
       disp('Warning: insufficient data, an empty gearbox was created.');
   end
elseif nargin == 3
   g = struct('n_shafts', n_shafts, 'ratios', ratios, 'name', name);
   g = class(g, 'gearbox');
else     %insufficent data was given
   g = struct('n_shafts', 0, 'ratios', 0, 'name', '');   %an empty gearbox
   g = class(g, 'gearbox');                         %make it gearbox class
disp('Warning: insufficient data, an empty gearbox was created.');
end
