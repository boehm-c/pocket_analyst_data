# build the image
sudo docker-compose build
sudo docker-compose up

# bash into image and run these queries to see database is restored
sudo docker exec -it pocket_analyst_container bash

sqlcmd -S localhost,1433 -U SA -P 'pa_Fancy_password1'

USE AdventureWorksDW2022;
GO

Select * from dbo.DimSalesReason;
GO

sudo docker-compose down -v