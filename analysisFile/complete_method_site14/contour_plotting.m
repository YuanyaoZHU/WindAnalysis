close all;
h = figure('Position',[100 100 700 500]);

n_p = 1000;
contour_3D_new;
U1 = [28.9855;11.4;8];
delta1 = [0.001;0.01;0.05;0.001;0.001;0.001;0.001];
X = tp;
Y = h;
Z = Uw;
XV = reshape(X,1001*1001,1);
YV = reshape(Y,1001*1001,1);ZV = reshape(Z,1001*1001,1);
[z0,n]=max(ZV);
[XV(n),YV(n),z0]
[y0,n2]=max(YV);
[XV(n2),y0,ZV(n2)]
originx = [8;7;8;8.5;8;8.5;8];
originy = [2;3;2;1.5;2;1.5;2];
xmin = 2;
xmax = 20;
ymin = 0;
ymax = 12;
for i=1:1:length(U1)
    Z = Uw;
    ZV = reshape(Z,1001*1001,1);
    if i== 1
                                data1=[XV(n),YV(n)];
        filename = ['U=' num2str(z0) '.txt'];
        fid = fopen(filename, 'wt');
        fprintf(fid,'%12.3f',data1);
        fclose(fid);
        
        subplot(2,2,i+1);
        plot(XV(n),YV(n),'r.','Markersize',20)
        xlabel('Tp [s]','FontSize',7)
        ylabel('Hs [m]','FontSize',7);
        legend(['Uw =' num2str(z0) 'm/s'],'FontSize',7);
        axis([xmin,xmax,ymin,ymax]);
        set(gca,'XTick',xmin:2:xmax)
        set(gca,'YTick',ymin:2:ymax);
        set(gca,'FontSize',7)
        grid on
    else
        originy = originy-1;
        U0 = U1(i);
        delta = delta1(i);
        ZV = ZV - U0;
        [Zsort,I] = sort(ZV);
        Xsort = XV(I);
        Ysort = YV(I);
        ind1 = (Zsort>-delta);
        ind2 = (Zsort<delta);
        ind = ind1 & ind2;
        sum(ind)
        X_contour = Xsort(ind);
        Y_contour = Ysort(ind);
        [theta,rho] = cart2pol(X_contour-originx(i-1),Y_contour-originy(i-1));
        [theta_sort,I_theta] = sort(theta);
        rho_sort = rho(I_theta);
        [X_contour2, Y_contour2] = pol2cart(theta_sort,rho_sort);
        X_contour2 = X_contour2 + originx(i-1);
        Y_contour2 = Y_contour2 + originy(i-1);
        
                                XY_contour=[X_contour2,Y_contour2];
        filename = ['U=' num2str(U1(i)) '.txt'];
        fid = fopen(filename, 'wt');
        fprintf(fid,'%12.3f %12.3f\n',XY_contour');
        fclose(fid);
        
        X_contour2 = [X_contour2; X_contour2(1)];
        Y_contour2 = [Y_contour2; Y_contour2(1)];
        subplot(2,2,i+1);
        plot(X_contour2,Y_contour2,'-','Linewidth',1.5)
%         plot(X_contour2,Y_contour2,'-',originx,originy,'*',X_contour,Y_contour,'r.','Markersize',5,'Linewidth',1.5)
        xlabel('Tp [s]','FontSize',7)
        ylabel('Hs [m]','FontSize',7);
        legend(['Uw =' num2str(U0) 'm/s'],'FontSize',7);
        axis([xmin,xmax,ymin,ymax]);
        set(gca,'XTick',xmin:2:xmax)
        set(gca,'YTick',ymin:2:ymax);
        grid on;
        set(gca,'FontSize',7)
     end
end

n_p = 50;
contour_3D_new; % 3D contour surface of W,Hs,Tp

subplot(2,2,1);
surf(tp,h,Uw);
grid on
xlabel('Tp [s]','FontSize',7)
ylabel('Hs [m]','FontSize',7);
zlabel('Uw [m/s]','FontSize',7);
% title([num2str(yr) '-year contour surface (Site 14)'],'FontSize',10);
set(gca,'FontSize',7)  

% %% for annual report
% h = figure('Position',[100 100 560 480]);
% n_p = 1000;
% contour_3D_new;
% U1 = [33.5,28:-4:24];
% delta1 = [0.002;0.003;0.003;0.005;0.006;0.006;0.006];
% X = tp;
% Y = h;
% Z = Uw;
% XV = reshape(X,1001*1001,1);
% YV = reshape(Y,1001*1001,1);ZV = reshape(Z,1001*1001,1);
% [z0,n]=max(ZV);
% [XV(n),YV(n),z0]
% [y0,n2]=max(YV);
% [XV(n2),y0,ZV(n2)]
% originx = 14;
% originy = 14;
% xmin = 2;
% xmax = 20;
% ymin = 0;
% ymax = 16;
% for i=1:1:length(U1)
%     Z = Uw;
%     ZV = reshape(Z,1001*1001,1);
%     if i== 1
%                                 data1=[XV(n),YV(n)];
%         filename = ['U=' num2str(z0) '.txt'];
%         fid = fopen(filename, 'wt');
%         fprintf(fid,'%12.3f',data1);
%         fclose(fid);
%         
%         subplot(2,2,i+1);
%         plot(XV(n),YV(n),'r.','Markersize',5)
%         xlabel('Tp [s]','FontSize',7)
%         ylabel('Hs [m]','FontSize',7);
%         legend(['Uw =' num2str(z0) 'm/s'],'FontSize',7);
%         axis([xmin,xmax,ymin,ymax]);
%         set(gca,'XTick',xmin:2:xmax)
%         set(gca,'YTick',ymin:2:ymax);
%         set(gca,'FontSize',7)
%         grid on
%     else
%         originy = originy-1;
%         U0 = U1(i);
%         delta = delta1(i);
%         ZV = ZV - U0;
%         [Zsort,I] = sort(ZV);
%         Xsort = XV(I);
%         Ysort = YV(I);
%         ind1 = (Zsort>-delta);
%         ind2 = (Zsort<delta);
%         ind = ind1 & ind2;
%         sum(ind)
%         X_contour = Xsort(ind);
%         Y_contour = Ysort(ind);
%         [theta,rho] = cart2pol(X_contour-originx,Y_contour-originy);
%         [theta_sort,I_theta] = sort(theta);
%         rho_sort = rho(I_theta);
%         [X_contour2, Y_contour2] = pol2cart(theta_sort,rho_sort);
%         X_contour2 = X_contour2 + originx;
%         Y_contour2 = Y_contour2 + originy;
%         
%                                 XY_contour=[X_contour2,Y_contour2];
%         filename = ['U=' num2str(U1(i)) '.txt'];
%         fid = fopen(filename, 'wt');
%         fprintf(fid,'%12.3f %12.3f\n',XY_contour');
%         fclose(fid);
%         
%         X_contour2 = [X_contour2; X_contour2(1)];
%         Y_contour2 = [Y_contour2; Y_contour2(1)];
%         subplot(2,2,i+1);
%         plot(X_contour2,Y_contour2,'-','Linewidth',1.5)
% %         plot(X_contour2,Y_contour2,'-',originx,originy,'*',X_contour,Y_contour,'r.','Markersize',5,'Linewidth',1.5)
%         xlabel('Tp [s]','FontSize',7)
%         ylabel('Hs [m]','FontSize',7);
%         legend(['Uw =' num2str(U0) 'm/s'],'FontSize',7);
%         axis([xmin,xmax,ymin,ymax]);
%         set(gca,'XTick',xmin:2:xmax)
%         set(gca,'YTick',ymin:2:ymax);
%         grid on;
%         set(gca,'FontSize',7)
%      end
% end
% 
% n_p = 50;
% contour_3D_new; % 3D contour surface of W,Hs,Tp
% 
% subplot(2,2,1);
% surf(tp,h,Uw);
% grid on
% xlabel('Tp [s]','FontSize',7)
% ylabel('Hs [m]','FontSize',7);
% zlabel('Uw [m/s]','FontSize',7);
% % title([num2str(yr) '-year contour surface (Site 14)'],'FontSize',10);
% set(gca,'FontSize',7)  