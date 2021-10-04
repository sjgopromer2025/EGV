create table movieinfo
(
	m_no int primary key not null auto_increment,
	m_title varchar(200) not null,
	m_year varchar(200) not null,
	m_rate varchar(200) not null,
	m_gen varchar(200) not null,
	m_country varchar(200) not null,
	m_time varchar(200) not null,
	m_company varchar(200) not null,
	m_grade int not null,
	m_code varchar(200) not null,
	m_url text
);

create table userinfo
(
	u_no int primary key not null auto_increment,
	u_name varchar(100) not null,
	u_id varchar(100) not null,
	u_pw 	varchar(100) not null,
	u_email 	varchar(200) not null,
	u_movieck 	int  default 0
	
);


create table bookmark
(
	b_no int primary key not null auto_increment,
	m_no int not null,
	u_no int not null
);

create table reco_m
(
	r_no int primary key not null auto_increment,
	u_no int not null,
	m_title  varchar(200) not null
)

create table pivot
(
	p_no int primary key not null auto_increment,
	p_user varchar(100) not null,
	p_title varchar(150) not null,
	p_grade float(7,2)  not null,
	p_genres varchar(100) not null
);








