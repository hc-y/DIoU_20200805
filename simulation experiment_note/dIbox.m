function s=dIbox(pred,gt)
% compute the derivative of intersection area w.r.t. [t,b,l,r] of `pred`
Ibox=In(pred,gt);
if pred.t>gt.t
    s.dt=-(Ibox.r-Ibox.l);
else
    s.dt=0;
end
if pred.b<gt.b
    s.db=Ibox.r-Ibox.l;
else
    s.db=0;
end
if pred.l>gt.l
    s.dl=-(Ibox.b-Ibox.t);
else
    s.dl=0;
end
if pred.r<gt.r
    s.dr=Ibox.b-Ibox.t;
else
    s.dr=0;
end