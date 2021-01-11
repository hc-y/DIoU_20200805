function s=dIOU(pred,gt)
% compute the derivative of IoU w.r.t. [t,b,l,r] of `pred`
Ibox=In(pred,gt);
I=(Ibox.b-Ibox.t)*(Ibox.r-Ibox.l);
U=(pred.b-pred.t)*(pred.r-pred.l)+(gt.b-gt.t)*(gt.r-gt.l)-I;
dI=dIbox(pred,gt);
dU=dUbox(pred,gt);
s.dt=0;
s.db=0;
s.dl=0;
s.dr=0;
if Ibox.t<Ibox.b&&Ibox.l<Ibox.r&&U>0  % ���2��bbox���ص�, �ż��㵼�� % &&U>0�����������ɾȥ
    s.dt=(U*dI.dt-I*dU.dt)/U^2;
    s.db=(U*dI.db-I*dU.db)/U^2;
    s.dl=(U*dI.dl-I*dU.dl)/U^2;
    s.dr=(U*dI.dr-I*dU.dr)/U^2;
else
    s.dt=0;
    s.db=0;
    s.dl=0;
    s.dr=0;
end
% hc-y_Q:��ô�����������pred.t<pred.b��pred.l<pred.r�⼸��? �о������pred.t<pred.b�����Ļ�,
% ��ô��ǰ��I, U�����������ѽ;
if pred.t<pred.b
    s.dt=s.dt;
    s.db=s.db;
else
    s.dt=s.db;
    s.db=s.dt;
end
if pred.l<pred.r
    s.dl=s.dl;
    s.dr=s.dr;
else
    s.dl=s.dr;
    s.dr=s.dl;
end