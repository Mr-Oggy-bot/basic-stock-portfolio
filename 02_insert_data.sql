--Insert into investor 
INSERT INTO investor VALUES (101,'Avneet Kaur','avneet@gmail.com','9876500001',DATE '2005-03-12','PANAK101');
INSERT INTO investor VALUES (102,'Archita Sharma','archita@gmail.com','9876500002',DATE '2005-06-18','PANAS102');
INSERT INTO investor VALUES (103,'Shrey Singh','shrey@gmail.com','9876500003',DATE '2004-11-02','PANSS103');
INSERT INTO investor VALUES (104,'Rahul Verma','rahul@gmail.com','9876500004',DATE '2003-08-14','PANRV104');
INSERT INTO investor VALUES (105,'Priya Jain','priya@gmail.com','9876500005',DATE '2004-05-21','PANPJ105');

INSERT INTO investor VALUES (106,'Karan Mehta','karan@gmail.com','9876500006',DATE '2002-09-09','PANKM106');
INSERT INTO investor VALUES (107,'Simran Gill','simran@gmail.com','9876500007',DATE '2005-01-11','PANSG107');
INSERT INTO investor VALUES (108,'Aman Gupta','aman@gmail.com','9876500008',DATE '2001-12-25','PANAG108');
INSERT INTO investor VALUES (109,'Neha Arora','neha@gmail.com','9876500009',DATE '2004-04-16','PANNA109');
INSERT INTO investor VALUES (110,'Rohit Kapoor','rohit@gmail.com','9876500010',DATE '2003-10-30','PANRK110');

INSERT INTO investor VALUES (111,'Pooja Bansal','pooja@gmail.com','9876500011',DATE '2002-07-17','PANPB111');
INSERT INTO investor VALUES (112,'Harsh Yadav','harsh@gmail.com','9876500012',DATE '2004-02-09','PANHY112');
INSERT INTO investor VALUES (113,'Isha Malhotra','isha@gmail.com','9876500013',DATE '2005-09-03','PANIM113');
INSERT INTO investor VALUES (114,'Vikas Sharma','vikas@gmail.com','9876500014',DATE '2003-03-28','PANVS114');
INSERT INTO investor VALUES (115,'Sneha Kapoor','sneha@gmail.com','9876500015',DATE '2004-12-12','PANSK115');

-- Insert into Stock
INSERT INTO stock VALUES (1,'TCS','Tata Consultancy Services','IT',3800);
INSERT INTO stock VALUES (2,'INFY','Infosys Ltd','IT',1450);
INSERT INTO stock VALUES (3,'WIPRO','Wipro Ltd','IT',510);
INSERT INTO stock VALUES (4,'HCLTECH','HCL Technologies','IT',1520);

INSERT INTO stock VALUES (5,'HDFCBK','HDFC Bank','Banking',1620);
INSERT INTO stock VALUES (6,'ICICI','ICICI Bank','Banking',1180);
INSERT INTO stock VALUES (7,'SBIN','State Bank of India','Banking',845);

INSERT INTO stock VALUES (8,'RELI','Reliance Industries','Energy',2890);
INSERT INTO stock VALUES (9,'ONGC','ONGC Ltd','Energy',290);
INSERT INTO stock VALUES (10,'BPCL','Bharat Petroleum','Energy',610);

INSERT INTO stock VALUES (11,'MARUTI','Maruti Suzuki','Auto',12400);
INSERT INTO stock VALUES (12,'TATAMOT','Tata Motors','Auto',910);
INSERT INTO stock VALUES (13,'M&M','Mahindra & Mahindra','Auto',2780);

INSERT INTO stock VALUES (14,'SUNPHAR','Sun Pharma','Pharma',1680);
INSERT INTO stock VALUES (15,'CIPLA','Cipla Ltd','Pharma',1525);

INSERT INTO stock VALUES (16,'ITC','ITC Ltd','FMCG',468);
INSERT INTO stock VALUES (17,'HUL','Hindustan Unilever','FMCG',2420);

INSERT INTO stock VALUES (18,'BAJFIN','Bajaj Finance','Finance',7080);
INSERT INTO stock VALUES (19,'BHARTI','Bharti Airtel','Telecom',1340);
INSERT INTO stock VALUES (20,'JIOFIN','Jio Financial','Finance',360);

--Create Portfolio (1 per investor)
INSERT INTO portfolio VALUES (201,101,'Growth Portfolio',SYSDATE);
INSERT INTO portfolio VALUES (202,102,'Balanced Portfolio',SYSDATE);
INSERT INTO portfolio VALUES (203,103,'Long Term Wealth',SYSDATE);
INSERT INTO portfolio VALUES (204,104,'Bluechip Basket',SYSDATE);
INSERT INTO portfolio VALUES (205,105,'Smart Investor',SYSDATE);

INSERT INTO portfolio VALUES (206,106,'Future Fund',SYSDATE);
INSERT INTO portfolio VALUES (207,107,'Alpha Returns',SYSDATE);
INSERT INTO portfolio VALUES (208,108,'Value Picks',SYSDATE);
INSERT INTO portfolio VALUES (209,109,'Growth Max',SYSDATE);
INSERT INTO portfolio VALUES (210,110,'Dividend Plan',SYSDATE);

INSERT INTO portfolio VALUES (211,111,'Stable Gains',SYSDATE);
INSERT INTO portfolio VALUES (212,112,'Power Stocks',SYSDATE);
INSERT INTO portfolio VALUES (213,113,'Tech Wealth',SYSDATE);
INSERT INTO portfolio VALUES (214,114,'Capital Rise',SYSDATE);
INSERT INTO portfolio VALUES (215,115,'Profit Hub',SYSDATE);

--Initial Holdings
INSERT INTO holdings VALUES (1,201,1,5,3700);
INSERT INTO holdings VALUES (2,201,2,10,1400);
INSERT INTO holdings VALUES (3,202,5,7,1600);
INSERT INTO holdings VALUES (4,203,8,4,2800);
INSERT INTO holdings VALUES (5,204,12,15,850);
INSERT INTO holdings VALUES (6,205,14,8,1600);
INSERT INTO holdings VALUES (7,206,16,20,450);
INSERT INTO holdings VALUES (8,207,17,5,2380);
INSERT INTO holdings VALUES (9,208,18,2,7000);
INSERT INTO holdings VALUES (10,209,19,11,1290);
INSERT INTO holdings VALUES (11,210,11,3,12100);
INSERT INTO holdings VALUES (12,211,13,7,2700);
INSERT INTO holdings VALUES (13,212,3,30,500);
INSERT INTO holdings VALUES (14,213,4,6,1490);
INSERT INTO holdings VALUES (15,214,6,12,1150);

--Starter Profit/Loss Rows
INSERT INTO profit_loss_report VALUES (1,101,1,600,0);
INSERT INTO profit_loss_report VALUES (2,102,5,140,0);
INSERT INTO profit_loss_report VALUES (3,103,8,360,0);
INSERT INTO profit_loss_report VALUES (4,104,12,900,0);
INSERT INTO profit_loss_report VALUES (5,105,14,640,0);
INSERT INTO profit_loss_report VALUES (6,106,16,360,0);
INSERT INTO profit_loss_report VALUES (7,107,17,200,0);
INSERT INTO profit_loss_report VALUES (8,108,18,160,0);

COMMIT;