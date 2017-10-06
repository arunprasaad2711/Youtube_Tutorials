% CODE TO CALCULATE MEAN AND STANDERD DEVIATION 
clc; clear all;
lat = ncread('netcdf-atls20-a562cefde8a29a7288fa0b8b7f9413f7-F_bLp2.nc',...
    'latitude');
lon = ncread('netcdf-atls20-a562cefde8a29a7288fa0b8b7f9413f7-F_bLp2.nc',...
    'longitude');
time = ncread('netcdf-atls20-a562cefde8a29a7288fa0b8b7f9413f7-F_bLp2.nc',...
    'time');
U = ncread('netcdf-atls20-a562cefde8a29a7288fa0b8b7f9413f7-F_bLp2.nc',...
    'u10');
V = ncread('netcdf-atls20-a562cefde8a29a7288fa0b8b7f9413f7-F_bLp2.nc',...
    'v10');
temp = ncread('netcdf-atls20-a562cefde8a29a7288fa0b8b7f9413f7-F_bLp2.nc',...
    't2m');
% T_std = zeros(25,25);
% U_std = zeros(25,25);
% V_std = zeros(25,25);
% for i = 1:25
%     for j = 1:25
%             T_std(i,j) = std(temp(i,j,:));
%             U_std(i,j) = std(U(i,j,:));
%             V_std(i,j) = std(V(i,j,:));
%     end
% end
% T_std_avg = sum(sum(T_std))/625;
% figure(1);
% contourf(lon, lat, T_std);
% colorbar;
% figure(2);
% contourf(lon, lat, U_std);
% colorbar;
% figure(3);
% contourf(lon, lat, V_std);
% colorbar;
%                           WRITE DATA IN TXT
% fileID = fopen('T_std.txt','w');
% fprintf(fileID,'%6.2f\n',T_std);
% fclose(fileID);
%                           WRITE DATA IN NETCDF
% ncid = netcdf.create('myfile.nc','NC_WRITE');
% dimidrow = netcdf.defDim(ncid,'rows',25);
% dimidcol = netcdf.defDim(ncid,'length',25);
% varid = netcdf.defVar(ncid,'T_std','NC_DOUBLE',[dimidrow dimidcol]);
% netcdf.endDef(ncid);
% netcdf.putVar(ncid,varid,my_data);
T_sheet = zeros(182, 361);
% T_sheet(1,:) = [0 lon'];
% T_sheet(:,1) = [0; lat];
% T_sheet(2:361, 2:182) = temp(:,:,1);
xlswrite('example.xls', T_sheet);
