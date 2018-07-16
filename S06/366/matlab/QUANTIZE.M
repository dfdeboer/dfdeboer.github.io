function y = quantize(x,MAXAMP,LEVELS)
%
%  y = quantize(x,MAXAMP,LEVELS)  y is a Quantized version of x
%
%     x = the input signal, a scalar, vector or matrix
%     y = the quantized output
%     MAXAMP = the maximum amplitude of the signal after quantization
%     LEVELS = the number of quantized levels
%
%     x is rounded to the nearest quantized level
%
%     example: quantize(x,4,8) quantizes x so that -4 <= y <=3, y an integer
%

%  Doug De Boer 3/8/94

   if MAXAMP <= 0 error('MAXAMP must be greater than zero'); end
   if LEVELS <= 0 error('LEVELS must be an integer greater than zero'); end

   if (LEVELS - 2*floor(LEVELS/2)) == 0       % if LEVELS is even
      QUANTA = 2*MAXAMP/LEVELS;
      MAX =  MAXAMP-QUANTA;
      MIN = -MAXAMP;
   else
      QUANTA = 2*MAXAMP/(LEVELS-1);
      MAX =  MAXAMP;
      MIN = -MAXAMP;
   end

   y = limit(x,MAX);
   y = -limit(-y,-MIN);
   y = QUANTA*round(y/QUANTA);

