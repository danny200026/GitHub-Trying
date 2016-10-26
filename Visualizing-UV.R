# STEP_1：繪製基本地圖 (1)
### 1. 安裝套件(這一段會被執行)
# 安裝"ggmap"套件
if(!require(ggmap)) install.packages("ggmap")

# 安裝"mapproj"套件
if(!require(mapproj)) install.packages("mapproj")




# STEP_2：取得資料
### 1. 下載資料、切換至工作目錄
### 2. 載入、檢視的資料檔

uv <- read.csv("UV_20161025112810.csv")
head(uv)  # 檢視資料檔的前半段資料




# STEP_3：處理資料、輸出結果
### A. 進行經緯度的轉換
lon.deg <- sapply((strsplit(as.character(uv$WGS84Lon), ",")), as.numeric)
uv$lon <- lon.deg[1, ] + lon.deg[2, ]/60 + lon.deg[3, ]/3600
lat.deg <- sapply((strsplit(as.character(uv$WGS84Lat), ",")), as.numeric)
uv$lat <- lat.deg[1, ] + lat.deg[2, ]/60 + lat.deg[3, ]/3600


### B. 把資料加入地圖中
ggmap(map) + geom_point(aes(x = lon, y = lat, size = UVI), data = uv)

