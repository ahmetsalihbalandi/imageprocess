f = ones(64,1); 
f = f./sum(f);                 % Define rectangle signal f and normalize

g = conv(f,f); 
g = g./sum(g);                 % Convolve f with itself to give g and normalize

h = conv(g,g); 
h = h./sum(h);                 % Convolve g with itself to give h and normalize

j = conv(h,h); 
j = j./sum(j);                 % Convolve h with itself to give j and normalize

subplot(2,2,1), plot(f,'k-'); axis square; 
subplot(2,2,2), plot(g,'k-'); axis off;
subplot(2,2,3), plot(h,'k-'); axis square; axis off;
subplot(2,2,4), plot(j,'k-'); axis square; axis off;
