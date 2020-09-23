sp_configure 'contained database authentication', 1;  
GO  
RECONFIGURE;  
GO  

DROP DATABASE IF EXISTS $(DbI);