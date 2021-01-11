function s=dUbox(pred,gt)
% compute the derivative of union area w.r.t. [t,b,l,r] of `pred`
dX=dXbox(pred);
dI=dIbox(pred,gt);
s.dt=dX.dt-dI.dt;
s.db=dX.db-dI.db;
s.dl=dX.dl-dI.dl;
s.dr=dX.dr-dI.dr;