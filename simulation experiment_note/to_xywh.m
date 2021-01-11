function s=to_xywh(A)
% convert [t,b,l,r] to [2ctr_x,2ctr_y,w,h]
s.dx=A.dl+A.dr;
s.dy=A.dt+A.db;
s.dw=(A.dr-A.dl);
s.dh=(A.db-A.dt);