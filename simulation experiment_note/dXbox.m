function s=dXbox(X)
% compute the derivative of pred_bbox w.r.t. [t,b,l,r] of `pred`
s.dt=-(X.r-X.l);
s.db=(X.r-X.l);
s.dl=-(X.b-X.t);
s.dr=(X.b-X.t);