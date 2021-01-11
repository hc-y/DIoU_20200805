function s=In(A,B)
% get the [t,b,l,r] coordinate of the intersection area of two bbox
s.t=max(A.t,B.t);
s.b=min(A.b,B.b);
s.l=max(A.l,B.l);
s.r=min(A.r,B.r);