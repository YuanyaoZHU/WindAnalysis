clear;
cd("E:\Simulation_File\windWaveAnalysis\nctoolbox-master");
setup_nctoolbox
filename1 = 'E:\Simulation_File\windWaveAnalysis\windData\Time2011_2013.grib';
filename2 = 'E:\Simulation_File\windWaveAnalysis\windData\Time2014_2016.grib';
filename3 = 'E:\Simulation_File\windWaveAnalysis\windData\Time2017_2019.grib';
filename4 = 'E:\Simulation_File\windWaveAnalysis\windData\Time2020.grib';

%%

x1 = ncdataset(filename1);
x1.variables

U1 = x1.data(x1.variables(1));
V1 = x1.data(x1.variables(2));

hs1 = x1.data(x1.variables(3));
T1_1 = x1.data(x1.variables(4));

lat1 = x1.data(x1.variables(5));
lon1 = x1.data(x1.variables(6));

time1 = x1.data(x1.variables(7));

%%
x2 = ncdataset(filename2);
x2.variables

U2 = x2.data(x2.variables(1));
V2 = x2.data(x2.variables(2));

hs2 = x2.data(x2.variables(3));
T1_2 = x2.data(x2.variables(4));

lat2 = x2.data(x2.variables(5));
lon2 = x2.data(x2.variables(6));

time2 = x2.data(x2.variables(7));

%%
x3 = ncdataset(filename3);
x3.variables

U3 = x3.data(x3.variables(1));
V3 = x3.data(x3.variables(2));

hs3 = x3.data(x3.variables(3));
T1_3 = x3.data(x3.variables(4));

lat3 = x3.data(x3.variables(5));
lon3 = x3.data(x3.variables(6));

time3 = x3.data(x3.variables(7));

%%
x4 = ncdataset(filename3);
x4.variables

U4 = x4.data(x4.variables(1));
V4 = x4.data(x4.variables(2));

hs4 = x4.data(x4.variables(3));
T1_4 = x4.data(x4.variables(4));

lat4 = x4.data(x4.variables(5));
lon4 = x4.data(x4.variables(6));

time4 = x4.data(x4.variables(7));

%%

hs = [hs1;hs2;hs3;hs4];
T1 = [T1_1;T1_2;T1_3;T1_4];
Tp = 1.073/0.834*T1;
U = [U1;U2;U3;U4];
V = [V1;V2;V3;V4];
[m,n] = size(U);
WindSpeed10=zeros(m,1);
WindSpeed90=zeros(m,1);
for i=1:m
  WindSpeed10(i) = sqrt(U(i,1)*U(i,1)+V(i,1)*V(i,1));
  WindSpeed90(i) = WindSpeed10(i)*(90/10).^0.1;
end
data = zeros(m,3);
data(:,1) = WindSpeed90;
data(:,2) = hs;
data(:,3) = Tp;

%%

save('E:\Simulation_File\windWaveAnalysis\analysisFile\data.mat',"data");








