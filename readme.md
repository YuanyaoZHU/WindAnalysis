# 本文件加用于对风浪流数据的分析和对水深条件的总结

- Both_Method_example 用于对风浪数据的分析，是原始的程序，用于备份，不要对程序进行修改。

- waterDepth 用于对水深数据的读取，水深数据文件较大已被删除，可以到[NOAA](https://www.ngdc.noaa.gov/mgg/global/relief/ETOPO1/data/ice_surface/grid_registered/binary/) 网站中进行下载，
文件名为etopo1_ice_g_f4.zip

- windData 是从 [ERA5](https://cds.climate.copernicus.eu/cdsapp#!/home) 中下载的风浪数据

- nctoolbox-master.zip 是从[github](https://github.com/nctoolbox/nctoolbox) 中下载的读取ERA5数据的工具包

- analysisFile 为分析文件夹，其中包含了修改后用于西沙群岛三沙市附近海域的风浪数据提取程序analysisP.m 和 针对这个数据进行
分析的程序包**complete_method_site14**, 文件夹中还包含了已经处理好的数据data.mat和其他图片文件。

## 分析流程

1. 确定经纬度坐标

2. 从 [ERA5](https://cds.climate.copernicus.eu/cdsapp#!/home) 中下载相关经纬度的风浪数据

3. 采用nctoolbox读取ERA5的grib数据。

4. 整理成10年范围的风速、有义波高、谱峰周期数据，喂给Both_Method_example文件中的风浪联合分析程序。

5. 得到分析结果。