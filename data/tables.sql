
CREATE TABLE user_account(Account_id int,first_name VARCHAR (50),password VARCHAR (255) UNIQUE ,email VARCHAR (255)  UNIQUE,phone VARCHAR (25),constraint pk1 primary key(Account_id));
CREATE TABLE activation_code( access_id int,access_code INT,constraint pk2 primary key(access_id) );
CREATE TABLE User_activation_code(pkk int,access_id int,Account_id int ,CONSTRAINT fg1 FOREIGN KEY (Account_id) REFERENCES user_account(Account_id) ,CONSTRAINT fg2 FOREIGN KEY (access_id) REFERENCES activation_code(access_id));
CREATE TABLE login( login_id int,email VARCHAR (255),password VARCHAR (255)UNIQUE ,constraint pk3 primary key(login_id) );
CREATE TABLE User_login(pkk int,login_id int,Account_id int ,CONSTRAINT fg3 FOREIGN KEY (Account_id) REFERENCES user_account(Account_id) ,CONSTRAINT fg4 FOREIGN KEY (login_id) REFERENCES login(login_id));

CREATE TABLE balance(balance_id int,mybalance int,constraint pk5 primary key(balance_id) );
CREATE TABLE calc(calc_id int,process_id int,balance_id int,mybalance int,constraint pk6 primary key(calc_id));
CREATE TABLE balance_calc(pkk int,balance_id int,calc_id int ,CONSTRAINT fg5 FOREIGN KEY (calc_id) REFERENCES calc(calc_id) ,CONSTRAINT fg6 FOREIGN KEY (balance_id) REFERENCES balance(balance_id));
CREATE TABLE process(process_id int,payment_value int,dateofprocess datetime,constraint pk7 primary key(process_id));
CREATE TABLE process_calc(pkk int,process_id int,calc_id int ,CONSTRAINT fg7 FOREIGN KEY (calc_id) REFERENCES calc(calc_id) ,CONSTRAINT fg8 FOREIGN KEY (process_id) REFERENCES process(process_id));
create table gov_bills(process_id int primary key references process(process_id),code VARCHAR(5));
create table phone_bills(process_id int primary key references process(process_id), phone_number int);
create table internet_bills(process_id int primary key references process(process_id), landline int);
create table shipping_cards(process_id int primary key references process(process_id), category int);
create table sim_charge(process_id int primary key references process(process_id), phone_number int);

create table electricity_bills(process_id int primary key references gov_bills(process_id), payment_value int);
create table gov_elec_bills(bill_id int,code INT,pure_bill int,constraint pk10 primary key(bill_id) );
create table fawry_elec_bills(pkk int,bill_id int,process_id int ,CONSTRAINT fg10 FOREIGN KEY (bill_id) REFERENCES gov_elec_bills(bill_id) ,CONSTRAINT fg11 FOREIGN KEY (process_id) REFERENCES electricity_bills(process_id));
create table water_bills(process_id int primary key references gov_bills(process_id), payment_value int);
create table gov_water_bills(water_bill_id int,code INT,water_pure_bill int,constraint pk100 primary key(water_bill_id) );
create table fawry_water_bills(pkk int,water_bill_id int,process_id int ,CONSTRAINT fg12 FOREIGN KEY (water_bill_id) REFERENCES gov_water_bills(water_bill_id) ,CONSTRAINT fg13 FOREIGN KEY (process_id) REFERENCES water_bills(process_id));
create table gas_bills(process_id int primary key references gov_bills(process_id), payment_value int);
create table gov_gas_bills(gas_bill_id int,code INT,gas_pure_bill int,constraint pk11 primary key(gas_bill_id) );
create table fawry_gas_bills(pkk int,gas_bill_id int,process_id int ,CONSTRAINT fg14 FOREIGN KEY (gas_bill_id) REFERENCES gov_gas_bills(gas_bill_id) ,CONSTRAINT fg15 FOREIGN KEY (process_id) REFERENCES gas_bills(process_id));

create table orange_bills(process_id int primary key references phone_bills(process_id), payment_value int);
create table orange_comp_bills(orange_bill_id int,phone_number INT,orange_pure_bill int,constraint pk12 primary key(orange_bill_id) );
create table fawry_orange_bills(pkk int,orange_bill_id int,process_id int ,CONSTRAINT fg16 FOREIGN KEY (orange_bill_id) REFERENCES orange_comp_bills(orange_bill_id) ,CONSTRAINT fg17 FOREIGN KEY (process_id) REFERENCES orange_bills(process_id));
create table vodafone_bills(process_id int primary key references phone_bills(process_id), payment_value int);
create table vodafone_comp_bills(vodafone_bill_id int,phone_number INT,vodafone_pure_bill int,constraint pk13 primary key(vodafone_bill_id) );
create table fawry_vodafone_bills(pkk int,vodafone_bill_id int,process_id int ,CONSTRAINT fg18 FOREIGN KEY (vodafone_bill_id) REFERENCES vodafone_comp_bills(vodafone_bill_id) ,CONSTRAINT fg19 FOREIGN KEY (process_id) REFERENCES vodafone_bills(process_id));
create table etisalate_bills(process_id int primary key references phone_bills(process_id), payment_value int);
create table etisalate_comp_bills(etisalate_bill_id int,phone_number INT,etisalate_pure_bill int,constraint pk15 primary key(etisalate_bill_id) );
create table fawry_etisalate_bills(pkk int,etisalate_bill_id int,process_id int ,CONSTRAINT fg21 FOREIGN KEY (etisalate_bill_id) REFERENCES etisalate_comp_bills(etisalate_bill_id) ,CONSTRAINT fg22 FOREIGN KEY (process_id) REFERENCES etisalate_bills(process_id));
create table we_bills(process_id int primary key references phone_bills(process_id), payment_value int);
create table we_comp_bills(we_bill_id int,phone_number INT,we_pure_bill int,constraint pk27 primary key(we_bill_id) );
create table fawry_we_bills(pkk int,we_bill_id int,process_id int ,CONSTRAINT fg23 FOREIGN KEY (we_bill_id) REFERENCES we_comp_bills(we_bill_id) ,CONSTRAINT fg24 FOREIGN KEY (process_id) REFERENCES we_bills(process_id));

create table orange_card(process_id int primary key references shipping_cards(process_id), payment_value int);
create table orange_comp_card(orange_card_id int,codes INT, card_value int,constraint pk26 primary key(orange_card_id) );
create table fawry_orange_card(pkk int,orange_card_id int,process_id int ,CONSTRAINT fg25 FOREIGN KEY (orange_card_id) REFERENCES orange_comp_card(orange_card_id) ,CONSTRAINT fg26 FOREIGN KEY (process_id) REFERENCES orange_card(process_id));
create table vodafone_card(process_id int primary key references shipping_cards(process_id), payment_value int);
create table vodafone_comp_card(vodafone_card_id int,codes INT, card_value int,constraint pk24 primary key(vodafone_card_id) );
create table fawry_vodafone_card(pkk int,vodafone_card_id int,process_id int ,CONSTRAINT fg28 FOREIGN KEY (vodafone_card_id) REFERENCES vodafone_comp_card(vodafone_card_id) ,CONSTRAINT fg29 FOREIGN KEY (process_id) REFERENCES vodafone_card(process_id));
create table etisalate_card(process_id int primary key references shipping_cards(process_id), payment_value int);
create table etisalate_comp_card(etisalate_card_id int,codes INT, card_value int,constraint pk25 primary key(etisalate_card_id) );
create table fawry_etisalate_card(pkk int,etisalate_card_id int,process_id int ,CONSTRAINT fg30 FOREIGN KEY (etisalate_card_id) REFERENCES etisalate_comp_card(etisalate_card_id) ,CONSTRAINT fg31 FOREIGN KEY (process_id) REFERENCES etisalate_card(process_id));
create table we_card(process_id int primary key references shipping_cards(process_id), payment_value int);
create table we_comp_card(we_card_id int,codes INT, card_value int,constraint pk29 primary key(we_card_id) );
create table fawry_we_card(pkk int,we_card_id int,process_id int ,CONSTRAINT fg32 FOREIGN KEY (we_card_id) REFERENCES we_comp_card(we_card_id) ,CONSTRAINT fg33 FOREIGN KEY (process_id) REFERENCES we_card(process_id));


create table orange_charge(process_id int primary key references sim_charge(process_id), payment_value int);
create table orange_comp_charge(orange_charge_id int, payment_value int,constraint pk34 primary key(orange_charge_id) );
create table fawry_orange_charge(pkk int,orange_charge_id int,process_id int ,CONSTRAINT fg45 FOREIGN KEY (orange_charge_id) REFERENCES orange_comp_charge(orange_charge_id) ,CONSTRAINT fg46 FOREIGN KEY (process_id) REFERENCES orange_charge(process_id));
create table vodafone_charge(process_id int primary key references sim_charge(process_id), payment_value int);
create table vodafone_comp_charge(vodafone_charge_id int, payment_value int,constraint pk36 primary key(vodafone_charge_id) );
create table fawry_vodafone_charge(pkk int,vodafone_charge_id int,process_id int ,CONSTRAINT fg48 FOREIGN KEY (vodafone_charge_id) REFERENCES vodafone_comp_charge(vodafone_charge_id) ,CONSTRAINT fg49 FOREIGN KEY (process_id) REFERENCES vodafone_charge(process_id));
create table etisalate_charge(process_id int primary key references sim_charge(process_id), payment_value int);
create table etisalate_comp_charge(etisalate_charge_id int, payment_value int,constraint pk37 primary key(etisalate_charge_id) );
create table fawry_etisalate_charge(pkk int,etisalate_charge_id int,process_id int ,CONSTRAINT fg50 FOREIGN KEY (etisalate_charge_id) REFERENCES etisalate_comp_charge(etisalate_charge_id) ,CONSTRAINT fg51 FOREIGN KEY (process_id) REFERENCES etisalate_charge(process_id));
create table we_charge(process_id int primary key references sim_charge(process_id), payment_value int);
create table we_comp_charge(we_charge_id int, payment_value int,constraint pk39 primary key(we_charge_id) );
create table fawry_we_charge(pkk int,we_charge_id int,process_id int ,CONSTRAINT fg52 FOREIGN KEY (we_charge_id) REFERENCES we_comp_charge(we_charge_id) ,CONSTRAINT fg53 FOREIGN KEY (process_id) REFERENCES we_charge(process_id));


create table orange_internet_bills(process_id int primary key references internet_bills(process_id), payment_value int);
create table orangeinternet_comp_bills(orangeinternet_bill_id int,landline INT,orangeinternet_pure_bill int,constraint pk71 primary key(orangeinternet_bill_id) );
create table fawry_orangeinternet_bills(pkk int,orangeinternet_bill_id int,process_id int ,CONSTRAINT fg61 FOREIGN KEY (orangeinternet_bill_id) REFERENCES orangeinternet_comp_bills(orangeinternet_bill_id) ,CONSTRAINT fg78 FOREIGN KEY (process_id) REFERENCES orange_internet_bills(process_id));
create table vodafone_internet_bills(process_id int primary key references internet_bills(process_id), payment_value int);
create table vodafoneinternet_comp_bills(vodafoneinternet_bill_id int,landline INT,vodafoneinternet_pure_bill int,constraint pk96 primary key(vodafoneinternet_bill_id) );
create table fawry_vodafoneinternet_bills(pkk int,vodafoneinternet_bill_id int,process_id int ,CONSTRAINT fg97 FOREIGN KEY (vodafoneinternet_bill_id) REFERENCES vodafoneinternet_comp_bills(vodafoneinternet_bill_id) ,CONSTRAINT fg104 FOREIGN KEY (process_id) REFERENCES vodafone_internet_bills(process_id));
create table etisalate_internet_bills(process_id int primary key references internet_bills(process_id), payment_value int);
create table etisalateinternet_comp_bills(etisalateinternet_bill_id int,landline INT,etisalateinternet_pure_bill int,constraint pk154 primary key(etisalateinternet_bill_id) );
create table fawry_etisalateinternet_bills(pkk int,etisalateinternet_bill_id int,process_id int ,CONSTRAINT fg211 FOREIGN KEY (etisalateinternet_bill_id) REFERENCES etisalateinternet_comp_bills(etisalateinternet_bill_id) ,CONSTRAINT fg222 FOREIGN KEY (process_id) REFERENCES etisalate_internet_bills(process_id));
create table we_internet_bills(process_id int primary key references internet_bills(process_id), payment_value int);
create table weinternet_comp_bills(weinternet_bill_id int,landline INT,weinternet_pure_bill int,constraint pk277 primary key(weinternet_bill_id) );
create table fawry_weinternet_bills(pkk int,weinternet_bill_id int,process_id int ,CONSTRAINT fg253 FOREIGN KEY (weinternet_bill_id) REFERENCES weinternet_comp_bills(weinternet_bill_id) ,CONSTRAINT fg245 FOREIGN KEY (process_id) REFERENCES we_internet_bills(process_id));

ALTER TABLE water_bills
ADD Phone_number int;
ALTER TABLE water_bills
ADD code int;

ALTER TABLE electricity_bills
ADD Phone_number int;
ALTER TABLE electricity_bills
ADD code int;

ALTER TABLE gas_bills
ADD Phone_number int;
ALTER TABLE gas_bills
ADD code int;

ALTER TABLE phone_bills
ADD payment_value int;
ALTER TABLE phone_bills
ADD code varchar(6);