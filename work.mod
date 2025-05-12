sudo docker-compose build
sudo docker-compose up

sudo docker exec -it pocket_analyst_container bash



sqlcmd -S localhost,1433 -U SA -P 'pa_Fancy_password1'

USE AdventureWorksDW2022;
GO

Select * from dbo.DimSalesReason;
GO

sudo docker-compose down -v