-------- DROP CONSTRAINTS -------

DROP TABLE PACIENT CASCADE CONSTRAINTS
/
DROP TABLE DOCTOR CASCADE CONSTRAINTS
/
DROP TABLE ASISTENT CASCADE CONSTRAINTS
/
DROP TABLE CAMERA CASCADE CONSTRAINTS
/
DROP TABLE SECTIE CASCADE CONSTRAINTS
/
DROP TABLE RAPORT CASCADE CONSTRAINTS
/
DROP TABLE MEDICAMENT CASCADE CONSTRAINTS
/
DROP TABLE FACTURA CASCADE CONSTRAINTS
/
DROP TABLE STAFF CASCADE CONSTRAINTS
/
DROP TABLE FISA_PACIENT CASCADE CONSTRAINTS
/
DROP TABLE SPECIALIZARE CASCADE CONSTRAINTS
/

------- PACIENT --------

CREATE TABLE Pacient( 
    ID INT NOT NULL PRIMARY KEY,
    NUME VARCHAR2(20) NOT NULL,  
    PRENUME VARCHAR2(25) NOT NULL,
    INALTIME INT,
    GREUTATE NUMBER(5),
    SEX CHAR(1) NOT NULL,
    TELEFON VARCHAR2(15), 
    DATA_NASTERE DATE,
    CATEGORIE VARCHAR(15)
)
/

----------- Sectie --------------

CREATE TABLE Sectie(
    ID INT NOT NULL PRIMARY KEY,
    DENUMIRE VARCHAR(25) UNIQUE NOT NULL
)
/


--------- Medicament -----------

CREATE TABLE Medicament(
    ID INT NOT NULL PRIMARY KEY,
    DENUMIRE VARCHAR(25) NOT NULL,
    CONSTRAINT fara_duplicate_medicament UNIQUE (ID, DENUMIRE)    
)
/

---------- Specializare -----------

CREATE TABLE Specializare(
    ID INT NOT NULL PRIMARY KEY,
    DENUMIRE VARCHAR(256) NOT NULL
)
/

-------- Doctor ----------

CREATE TABLE Doctor( 
    ID INT NOT NULL PRIMARY KEY,
    ID_SECTIE INT NOT NULL, 
    ID_SPECIALIZARE1 INT NOT NULL,
    ID_SPECIALIZARE2 INT,
    ID_SPECIALIZARE3 INT,
    ID_SPECIALIZARE4 INT,
    ID_SPECIALIZARE5 INT,
    CONSTRAINT fara_duplicate_doctori UNIQUE(ID, ID_SECTIE),
    CONSTRAINT FK_DOCTOR_ID_SECTIE FOREIGN KEY (ID_SECTIE) REFERENCES SECTIE(ID),
    CONSTRAINT FK_DOCTOR_ID_SPECIALIZARE1 FOREIGN KEY (ID_SPECIALIZARE1) REFERENCES SPECIALIZARE(ID),
    CONSTRAINT FK_DOCTOR_ID_SPECIALIZARE2 FOREIGN KEY (ID_SPECIALIZARE2) REFERENCES SPECIALIZARE(ID),
    CONSTRAINT FK_DOCTOR_ID_SPECIALIZARE3 FOREIGN KEY (ID_SPECIALIZARE3) REFERENCES SPECIALIZARE(ID),
    CONSTRAINT FK_DOCTOR_ID_SPECIALIZARE4 FOREIGN KEY (ID_SPECIALIZARE4) REFERENCES SPECIALIZARE(ID),
    CONSTRAINT FK_DOCTOR_ID_SPECIALIZARE5 FOREIGN KEY (ID_SPECIALIZARE5) REFERENCES SPECIALIZARE(ID)
)
/

-------- Asistent --------

CREATE TABLE Asistent( 
    ID INT NOT NULL PRIMARY KEY,
    ID_SECTIE INT NOT NULL, 
    ID_SPECIALIZARE1 INT NOT NULL,
    ID_SPECIALIZARE2 INT,
    ID_SPECIALIZARE3 INT,
    ID_SPECIALIZARE4 INT,
    ID_SPECIALIZARE5 INT,
    CONSTRAINT fara_duplicate_asistenti UNIQUE(ID, ID_SECTIE),
    CONSTRAINT FK_ASISTENT_ID_SECTIE FOREIGN KEY (ID_SECTIE) REFERENCES SECTIE(ID),
    CONSTRAINT FK_ASISTENT_ID_SPECIALIZARE1 FOREIGN KEY (ID_SPECIALIZARE1) REFERENCES SPECIALIZARE(ID),
    CONSTRAINT FK_ASISTENT_ID_SPECIALIZARE2 FOREIGN KEY (ID_SPECIALIZARE2) REFERENCES SPECIALIZARE(ID),
    CONSTRAINT FK_ASISTENT_ID_SPECIALIZARE3 FOREIGN KEY (ID_SPECIALIZARE3) REFERENCES SPECIALIZARE(ID),
    CONSTRAINT FK_ASISTENT_ID_SPECIALIZARE4 FOREIGN KEY (ID_SPECIALIZARE4) REFERENCES SPECIALIZARE(ID),
    CONSTRAINT FK_ASISTENT_ID_SPECIALIZARE5 FOREIGN KEY (ID_SPECIALIZARE5) REFERENCES SPECIALIZARE(ID)
)
/

------------ Camera ------------

CREATE TABLE Camera(
    ID INT NOT NULL,
    ID_SECTIE INT NOT NULL,
    NUMAR_LOCURI INT NOT NULL, 
    CONSTRAINT fara_duplicate_camera UNIQUE (ID, ID_SECTIE),
    CONSTRAINT FK_CAMERA_ID_SECTIE FOREIGN KEY (ID_SECTIE) REFERENCES SECTIE(ID)
)
/
   
----------- Staff -------------

CREATE TABLE Staff(
    ID INT NOT NULL PRIMARY KEY,
    CNP INT NOT NULL UNIQUE,
    NUME VARCHAR2(20) NOT NULL,
    PRENUME VARCHAR2(30) NOT NULL,
    FUNCTIE VARCHAR2(30) NOT NULL,
    SALARIU INT NOT NULL,
    CONSTRAINT fara_duplicate_staff UNIQUE (ID, CNP)
)
/

------------ Raport -----------

CREATE TABLE Raport(
    ID_PERSONAL INT NOT NULL,
    ID_SECTIE INT,
    ORA_START INT,
    ORA_FINAL INT,
    DATA_RAPORT DATE NOT NULL,
    CONSTRAINT FK_RAPORT_ID_PERSONAL FOREIGN KEY (ID_PERSONAL) REFERENCES STAFF(ID),
    CONSTRAINT FK_RAPORT_ID_SECTIE FOREIGN KEY (ID_SECTIE) REFERENCES SECTIE(ID)
) 
/

--INSERT INTO Raport (ID_PERSONAL, ID_SECTIE, INTERVAL_ORAR, DATA_RAPORT, FUNCTIE)
 --  VALUES (2, 2, TO_TIMESTAMP('2014-07-02 06:14:00.742000000', 'YYYY-MM-DD HH24:MI:SS.FF'), TO_DATE('17/12/2015', 'DD/MM/YYYY'), 'doctor');

---------- Fisa pacient -----------

CREATE TABLE Fisa_pacient(
    ID INT NOT NULL PRIMARY KEY,
    ID_PACIENT INT NOT NULL, 
    ID_DOCTOR INT NOT NULL,    
    DATA_INTERNARE DATE NOT NULL, 
    DATA_EXTERNARE DATE NOT NULL,
    DIAGNOSTIC VARCHAR2(255) NOT NULL,
    ID_MEDICAMENT1 INT NOT NULL,
    ID_MEDICAMENT2 INT,
    ID_MEDICAMENT3 INT,
    ID_MEDICAMENT4 INT,
    ID_MEDICAMENT5 INT,
    ID_MEDICAMENT6 INT,
    ID_MEDICAMENT7 INT,
    ID_MEDICAMENT8 INT,
    ID_MEDICAMENT9 INT,
    ID_MEDICAMENT10 INT,
    CONSTRAINT FK_FISA_PACIENT_ID_PACIENT FOREIGN KEY (ID_PACIENT) REFERENCES PACIENT(ID),
    CONSTRAINT FK_FISA_PACIENT_ID_DOCTOR FOREIGN KEY (ID_DOCTOR) REFERENCES DOCTOR(ID), 
    CONSTRAINT FK_ID_MEDICAMENT1 FOREIGN KEY (ID_MEDICAMENT1) REFERENCES MEDICAMENT(ID),
    CONSTRAINT FK_ID_MEDICAMENT2 FOREIGN KEY (ID_MEDICAMENT2) REFERENCES MEDICAMENT(ID),
    CONSTRAINT FK_ID_MEDICAMENT3 FOREIGN KEY (ID_MEDICAMENT3) REFERENCES MEDICAMENT(ID),
    CONSTRAINT FK_ID_MEDICAMENT4 FOREIGN KEY (ID_MEDICAMENT4) REFERENCES MEDICAMENT(ID),
    CONSTRAINT FK_ID_MEDICAMENT5 FOREIGN KEY (ID_MEDICAMENT5) REFERENCES MEDICAMENT(ID),
    CONSTRAINT FK_ID_MEDICAMENT6 FOREIGN KEY (ID_MEDICAMENT6) REFERENCES MEDICAMENT(ID),
    CONSTRAINT FK_ID_MEDICAMENT7 FOREIGN KEY (ID_MEDICAMENT7) REFERENCES MEDICAMENT(ID),
    CONSTRAINT FK_ID_MEDICAMENT8 FOREIGN KEY (ID_MEDICAMENT8) REFERENCES MEDICAMENT(ID),
    CONSTRAINT FK_ID_MEDICAMENT9 FOREIGN KEY (ID_MEDICAMENT9) REFERENCES MEDICAMENT(ID),
    CONSTRAINT FK_ID_MEDICAMENT10 FOREIGN KEY (ID_MEDICAMENT10) REFERENCES MEDICAMENT(ID)
)
/

---------- Factura ---------

CREATE TABLE Factura(
    ID INT NOT NULL PRIMARY KEY, 
    ID_FISA_PACIENT INT,
    PLATA INT NOT NULL,
    CONSTRAINT FK_FACTURA_ID_FISA_PACIENT FOREIGN KEY (ID_FISA_PACIENT) REFERENCES FISA_PACIENT(ID)
)
/




----------- POPULARE ------------

SET SERVEROUTPUT ON;
DECLARE 
    TYPE ARR IS VARRAY(1001) OF VARCHAR2(255);
    
    vec_nume_familie ARR := ARR('Acsenti', 'Acsinteanu', 'Acsintescu', 'Acsintovici', 'Actarian', 'Aculitei', 'Adace', 'Adagiu', 'Adaitei', 'Adalau', 'Adaliu', 'Adamache', 'Adaman', 'Adamas', 'Adamescu', 'Adamesteanu', 'Adamia', 'Adamiade', 'Adamide', 'Adamila', 'Adamiu', 'Adamoiu', 'Adamon', 'Adamov', 'Adamovici', 'Adamus', 'Adamut', 'Adaniloae', 'Adaniloaiei', 'Adascalitei', 'Adascaliti', 'Adascaloaie', 'Adascaloaiei', 'Adascalului', 'Adavidoaiei', 'Aderca', 'Adesea', 'Adespea', 'Adetu', 'Adime', 'Adincu', 'Adir', 'Adjudeanu', 'Adoamnei', 'Adobricai', 'Adobritei', 'Adochiei', 'Adomnicai', 'Adonicioaiei', 'Adorian', 'Adorjani', 'Adriano', 'Adumitracesei', 'Adumitresei', 'Adumitroaie', 'Adumitroaiei', 'Adurian', 'Aecoboaie', 'Aelenei', 'Aelisabetei', 'Aenachioaiei', 'Aenasoaiei', 'Aenei', 'Aermitioaia', 'Afanasiev', 'Afanoaiei', 'Afecioritei', 'Afedoaiei', 'Afemeii', 'Afendache', 'Afenduli', 'Afide', 'Afilipoaie', 'Aflatu', 'Afloarei', 'Aflorei', 'Afloricicai', 'Aflorii', 'Afloroaei', 'Afodoroaiei', 'Afrasinei', 'Afrenie', 'Afrentoaie', 'Afronie', 'Aftalion', 'Aftanache', 'Aftanachi', 'Aftanase', 'Aftanasie', 'Aftanasiu', 'Aftemie', 'Aftenie', 'Aftim', 'Aftiniei', 'Aftodor', 'Afumatu', 'Afusoaie', 'Afxente', 'Aga', 'Agache', 'Baba', 'Babaca', 'Babacea', 'Babacov', 'Babacu', 'Babad', 'Babadag', 'Babadan', 'Babadita', 'Babaita', 'Babalau', 'Babalcioaia', 'Babalic', 'Baban', 'Babanau', 'Babanea', 'Babanete', 'Babaoan', 'Babasa', 'Babascu', 'Babat', 'Babau', 'Babcan', 'Babe', 'Babea', 'Babeanu', 'Babei', 'Babeiu', 'Babencu', 'Babenko', 'Babes', 'Babescu', 'Babet', 'Babeti', 'Babetiu', 'Babeu', 'Babi', 'Babiac', 'Babian', 'Babic', 'Babiceanu', 'Babici', 'Babiciu', 'Babiciuc', 'Babii', 'Babin', 'Babiuc', 'Babliga', 'Babliuc', 'Baboe', 'Baboeanu', 'Baboia', 'Baboian', 'Baboianu', 'Baboie', 'Baboiu', 'Babolea', 'Baboli', 'Babora', 'Babos', 'Babtan', 'Babu', 'Babuc', 'Babuciu', 'Babulos', 'Babus', 'Babusca', 'Babusoru', 'Babut', 'Babutan', 'Babutia', 'Bac', 'Baca', 'Bacaciu', 'Bacaintan', 'Bacal', 'Bacala', 'Bacalan', 'Bacalbasa', 'Bacalem', 'Bacalescu', 'Bacalete', 'Bacaloglu', 'Bacalov', 'Bacalu', 'Bacan', 'Bacanar', 'Bacanaru', 'Bacanau', 'Bacanoiu', 'Bacanu', 'Bacaoanu', 'Bacar', 'Bacau', 'Bacavan', 'Bacea', 'Baceanu', 'Bacescu', 'Bachia', 'Bachieru', 'Percheata', 'Percic', 'Percinopol', 'Perciun', 'Perciunaru', 'Perciunescu', 'Percus', 'Perda', 'Perdea', 'Perdicari', 'Perdichi', 'Perdus', 'Pereanu', 'Pereni', 'Peret', 'Perete', 'Pereteanu', 'Peretianu', 'Peretz', 'Perian', 'Perianu', 'Perici', 'Pericle', 'Peride', 'Perie', 'Perieteanu', 'Perietzeanu', 'Periianu', 'Periijoc', 'Peris', 'Perisan', 'Perisoreanu', 'Perita', 'Peritanu', 'Perja', 'Perjariu', 'Perjea', 'Perjeru', 'Perjescu', 'Perju', 'Perlea', 'Pernea', 'Perneci', 'Pernoiu', 'Peronescu', 'Perpelea', 'Perpeliuc', 'Persa', 'Perseca', 'Perseghian', 'Persianu', 'Persic', 'Persiceanu', 'Persicu', 'Persideanu', 'Persinaru', 'Persioara', 'Persoiu', 'Persu', 'Persunaru', 'Pert', 'Perta', 'Pertia', 'Perticari', 'Perticariu', 'Pervan', 'Pervian', 'Pervoiu', 'Pervu', 'Pervulescu', 'Pesacov', 'Pescan', 'Pescar', 'Pescariu', 'Pescaru', 'Pescarul', 'Pescasescu', 'Peschir', 'Peschiru', 'Pesin', 'Peslan', 'Pesliuc', 'Pessiacov', 'Pessione', 'Pesta', 'Peste', 'Pesteanu', 'Pestelca', 'Pestenaru', 'Pesteri', 'Pestimagiu', 'Pestisanu', 'Pestrea', 'Pestreac', 'Pestritu', 'Peta', 'Petai', 'Petco', 'Petcoiu', 'Petcos', 'Poppa', 'Popsor', 'Poptelecan', 'Poptilie', 'Popu', 'Populeanu', 'Popusoi', 'Poputa', 'Poputeanu', 'Pora', 'Poradim', 'Porascanu', 'Porastie', 'Porca', 'Porcari', 'Porcariu', 'Porceanu', 'Porcescu', 'Porcica', 'Porcolean', 'Porcoleanu', 'Porcov', 'Porcu', 'Porcutu', 'Porfir', 'Porfira', 'Porfireanu', 'Porfiriu', 'Porfiroiu', 'Porfiroiul', 'Porfiru', 'Poricel', 'Porneala', 'Porohniuc', 'Poroianu', 'Poroineanu', 'Porojan', 'Porojnicu', 'Poroschianu', 'Porosnicu', 'Porosu', 'Porpala', 'Porsila', 'Portase', 'Portasescu', 'Porteanu', 'Porteti', 'Porumb', 'Porumbaru', 'Porumbeanu', 'Porumbel', 'Porumbelu', 'Porumbescu', 'Porumbiel', 'Porumbita', 'Porumboiu', 'Porumbovici', 'Porumbu', 'Porupca', 'Porusnic', 'Porusnicu', 'Porusniuc', 'Porutiu', 'Posa', 'Posala', 'Posar', 'Posea', 'Posescu', 'Posirca', 'Poslusnic', 'Poslusnicu', 'Posmagiu', 'Posmogu', 'Posmosanu', 'Posoiu', 'Pospaiu', 'Possa', 'Possea', 'Possescu', 'Postacenca', 'Postarenco', 'Postarita', 'Postariu', 'Postariuc', 'Postaru', 'Postasu', 'Postea', 'Postean', 'Posteanu', 'Postelneac', 'Postelnicescu', 'Postelnicu', 'Postescu', 'Postica', 'Posticescu', 'Postoaca', 'Postolache', 'Postole', 'Postolea', 'Popescu', 'Nabain', 'Nabandian', 'Nabintu', 'Naca', 'Nacco', 'Nace', 'Nacea', 'Naceanu', 'Nacescu', 'Nache', 'Nachi', 'Nachita', 'Naciian', 'Naciu', 'Naclad', 'Naclada', 'Nacu', 'Nacuta', 'Nadabaica', 'Nadabaico', 'Nadabaicu', 'Nadaban', 'Nadasan', 'Nadasanu', 'Nadea', 'Nadejde', 'Nadejenco', 'Nadelcovici', 'Nadin', 'Nadirgeac', 'Nadis', 'Nadisan', 'Nadoiu', 'Nadoleanu', 'Nadolenco', 'Nadolschi', 'Nadolu', 'Nados', 'Nadrag', 'Nadragan', 'Nadragea', 'Nadragoae', 'Nadrar', 'Nadu','Nae', 'Naescu', 'Naflan', 'Naflica', 'Nafliu', 'Naforeanu', 'Naforica', 'Nafta', 'Naftan', 'Naftanaila', 'Naftica', 'Nagacevschi', 'Nagara', 'Nagaschi', 'Naghe', 'Naghi', 'Naghiu', 'Nagiescu', 'Nagit', 'Naglabeanu', 'Nahaiu', 'Nahoiu', 'Nahoreanu', 'Nahorneac', 'Nahorniac', 'Nahrib', 'Nahut', 'Naiche', 'Naicu', 'Naiculescu', 'Naidin', 'Naidiu', 'Naie', 'Naiescu', 'Nailescu', 'Naipeanu', 'Naitescu', 'Naitica', 'Naizer', 'Nalba', 'Nalbac', 'Nalban', 'Nalbandian', 'Nalbantu', 'Nalbar', 'Nalbaru', 'Nalbitoru', 'Nalboc', 'Naltu', 'Namescu', 'Namila', 'Namoian', 'Namoianu', 'Namolasanu', 'Namoloiu', 'Namolosan', 'Caba', 'Caban', 'Cabanov', 'Cabaroiu', 'Cabas', 'Cabasanu', 'Cabascu', 'Cabat', 'Cabate', 'Cabele', 'Cabniuc', 'Cabrugan', 'Cabulca', 'Cabulea', 'Cabuta', 'Cabuz', 'Caca', 'Cacabos', 'Cacalateanu', 'Cacalete', 'Cacaliceanu', 'Cacaraci', 'Cacareanu', 'Cacarez', 'Cacariaza', 'Cacariu', 'Cacau', 'Cacegeanu', 'Cacenco', 'Caceonica', 'Cacerovschi', 'Cacherda', 'Cachita', 'Caciauna', 'Cacina', 'Caciona', 'Cacioni', 'Cacior', 'Caciov', 'Cacip', 'Caciu', 'Caciuc', 'Caciudau', 'Caciula', 'Caciulan', 'Caciularu', 'Caciuleac', 'Caciulean', 'Caciuleanu', 'Caciulescu', 'Caciulov', 'Caciumariuc', 'Cacovean', 'Cacoveanu', 'Cacu', 'Cacuci', 'Cacui', 'Cada', 'Cadantu', 'Cadar', 'Cadarea', 'Cadareanu', 'Cadariu', 'Cadau', 'Cadea', 'Cadelcu', 'Cadere', 'Cadeschi', 'Cadia', 'Cadinescu', 'Cadinoiu', 'Cadioschi', 'Cadir', 'Cadiu', 'Cadoiu', 'Cadran', 'Cae', 'Caenaru', 'Cafegiu', 'Cafigiu', 'Cafon', 'Cafrita', 'Caftan', 'Caftanat', 'Cahu', 'Cahuci', 'Cahul', 'Caia', 'Caiata', 'Caiavateanu', 'Caic', 'Caicas', 'Caiea', 'Caieacu', 'Caieriu', 'Caieru', 'Caila', 'Caileanu', 'Caimac', 'Caimacan', 'Tabac', 'Tabacar', 'Tabacariu', 'Tabacaru', 'Tabacelea', 'Tabachiu', 'Tabacila', 'Tabacinic', 'Tabacopol', 'Tabacovici', 'Tabacu', 'Tabacutu', 'Tabai', 'Tabaia', 'Tabakov', 'Taban', 'Tabara', 'Tabaran', 'Tabarana', 'Tabaranu', 'Tabaras', 'Tabarasi', 'Tabarasu', 'Tabarca', 'Tabarcea', 'Tabaroiu', 'Tabaulea', 'Tabic', 'Tabiltoc', 'Tabirca', 'Tabircea', 'Tabirgic', 'Tabirnac', 'Tabla', 'Tablan', 'Tablon', 'Tabol', 'Tabolcea', 'Taborschi', 'Tabra', 'Tabrea', 'Tabreanu', 'Tabuc', 'Tabucanu', 'Tabun', 'Tabusca', 'Tac', 'Taca', 'Tacaluta', 'Tacciu', 'Tacea', 'Tache', 'Tachel', 'Tachescu', 'Tachici', 'Tachievici', 'Tachita', 'Tachiu', 'Taci', 'Tacian', 'Tacit', 'Taciu', 'Taciuc', 'Taciulescu', 'Taco', 'Tacoescu', 'Tacoi', 'Tacoiu', 'Tacomis', 'Tacorian', 'Tacos', 'Tacosa', 'Tacu', 'Tacuita', 'Taculeanu', 'Taculescu', 'Tacuteanu', 'Tacutu', 'Tafalan', 'Taflan', 'Taflaru', 'Tafoiu', 'Tafrali', 'Tafta', 'Tafui', 'Taga', 'Taganel', 'Tagarcea', 'Tagarici', 'Taglici', 'Tahale', 'Tahau', 'Tahis', 'Tahula', 'Taica', 'Taicu', 'Taicutanu', 'Taicutu', 'Taielup', 'Taifas', 'Timboiu', 'Timbolaru', 'Timbolschi', 'Timbrie', 'Timbuc', 'Timbus', 'Timca', 'Timco', 'Timcu', 'Time', 'Timeriu', 'Timic', 'Timica', 'Timinescu', 'Timircan', 'Timirgaziu', 'Timis', 'Timisan', 'Timisescu', 'Timita', 'Timnea', 'Timoc', 'Timocel', 'Timofei', 'Timofi', 'Timofte', 'Timoftei', 'Timoftescu', 'Timofticiuc', 'Timoftiuc', 'Timoianu', 'Timolean', 'Timonea', 'Timos', 'Timosteak', 'Timotei', 'Timotin', 'Timpanariu', 'Timpanaru', 'Timpau', 'Timpea', 'Timpeanu', 'Timpescu', 'Timplaru', 'Timpoc', 'Timpor', 'Timpu', 'Timu', 'Timulescu', 'Timurea', 'Timurlea', 'Timus', 'Tinaru', 'Tinbala', 'Tinc', 'Tinca', 'Tincaba', 'Tincanus', 'Tincau', 'Tincea', 'Tinchel', 'Tinclete', 'Tincoca', 'Tincu', 'Tinculescu', 'Tinculete', 'Tincus', 'Tinescu', 'Tingaianu', 'Tingire', 'Tingirica', 'Tingureanu', 'Tinica', 'Tiniras', 'Tinis', 'Tinjala', 'Tino', 'Tinofi', 'Tint', 'Tinta', 'Tintar', 'Tintareanu', 'Tintarescu', 'Tintariu', 'Tintaru', 'Tintas', 'Tintaveanu', 'Tintea', 'Tintes', 'Tintesanu', 'Tintescu', 'Tintila', 'Tintorian', 'Tintos', 'Tintovan', 'Tintu', 'Tinuca', 'Tiocaliuc', 'Tiolea', 'Tiorog', 'Derebei', 'Derer', 'Deres', 'Deresoiu', 'Dereustean', 'Derevencu', 'Derevici', 'Derioiu', 'Deris', 'Derisievici', 'Deriteanu', 'Derjea', 'Derlogea', 'Dermedegeanu', 'Dermengiu', 'Dermoiu', 'Dermon', 'Derscanu', 'Derscariu', 'Dersidan', 'Dertea', 'Derunian', 'Dervenco', 'Desaga', 'Desan', 'Desanu', 'Desca', 'Descau', 'Descu', 'Descultu', 'Deselnicu', 'Desideratu', 'Desideriu', 'Desila', 'Desiu', 'Desliu', 'Desmierdatu', 'Desmirna', 'Desna','Despa', 'Despi', 'Despia', 'Despin', 'Despina', 'Despinoiu', 'Despoiu', 'Despon', 'Despot', 'Despotide', 'Dessefi', 'Dessila', 'Desta', 'Destelnicu', 'Detesan', 'Detot', 'Devechi', 'Devedera', 'Devederea', 'Deveghe', 'Devesel', 'Deveseleanu', 'Devianu', 'Devisevici', 'Dexamir', 'Dezideratu', 'Dezmireanu', 'Dgeaferovici', 'Dia', 'Diac', 'Diaca', 'Diacatos','Diacenco', 'Diacencu', 'Diacon', 'Diaconasu', 'Diaconeasa', 'Diaconescu', 'Diaconesei', 'Diaconita', 'Diaconitei', 'Diaconiuc', 'Diaconovici', 'Diaconu', 'Diacov', 'Diacu', 'Diak', 'Diamancescu', 'Diamandescu', 'Diamandi', 'Diamandopol', 'Diamandy', 'Diamant', 'Diamante', 'Diamantescu', 'Dianu', 'Diark', 'Diavoliuc', 'Dib', 'Diba', 'Dibla', 'Eacota', 'Eana', 'Ebetiuc', 'Ebicescu', 'Ebinca', 'Ebion', 'Ecaterina', 'Echim', 'Echisciolu', 'Eciu', 'Ecobescu', 'Ecobici', 'Ecoboiu', 'Economescu', 'Economu', 'Ecopita', 'Ecovoiu', 'Edeleanu', 'Edroiu', 'Edu', 'Eduard', 'Edutan', 'Efciuciuc', 'Efesiul', 'Efrim', 'Efrimescu', 'Efrosin', 'Efstatiade', 'Efta', 'Eftatopol', 'Eftemie', 'Efteni', 'Eftimescu', 'Eftimian', 'Eftimie', 'Eftimiu', 'Eftimoiu', 'Eftode', 'Egri', 'Eladescu', 'Eladi', 'Elec', 'Elefteratos', 'Elefterescu', 'Elefterie','Elefteriu', 'Elenescu', 'Eleseu', 'Eleuterescu', 'Eleuteriade', 'Eliad', 'Eliade', 'Elian', 'Elianu', 'Eliasei', 'Eliat', 'Elic', 'Eliescu', 'Elin', 'Elinescu', 'Elinschi', 'Elipidiu', 'Elisei', 'Elisicovici', 'Elisievici', 'Elit', 'Elitere', 'Elvas', 'Elvetia', 'Emancipatul', 'Emandi', 'Emanidi', 'Emanoil', 'Emanoiliu', 'Emanuel', 'Emil', 'Emilescu', 'Emilian', 'Eminescu', 'Eminet', 'Eminovici', 'Enaceanu', 'Enache', 'Enachescu', 'Enachi', 'Enachioaia', 'Enachioasa', 'Enachioiu', 'Enachita', 'Enacovici', 'Enascu', 'Enasel', 'Enasescu', 'Enasoae', 'Enasoaie', 'Enasoiu', 'Enatescu', 'Ence', 'Encea', 'Enceanu');
    
    vec_prenume_fete ARR := ARR('Adela', 'Adina', 'Adriana', 'Alexandrina', 'Alina', 'Anamaria', 'Aneta', 'Angela', 'Angelica', 'Anisoara', 'Aurelia', 'Aurica', 'Aurelia', 'Bianca', 'Camelia', 'Carmen', 'Catinca', 'Cecilia', 'Claudia', 'Constanta', 'Constantina', 'Corina', 'Cornelia', 'Cristina', 'Daniela', 'Delia', 'Diana', 'Domnica', 'Dorina', 'Eleonora', 'Elvira', 'Emilia', 'Erika', 'Eva', 'Felicia', 'Filofteia', 'Florentina', 'Florina', 'Gabriela', 'Georgeta', 'Giorgiana', 'Geta', 'Georgeta', 'Gherghina', 'Gina', 'Ionela', 'Ionica', 'Irma', 'Iulia', 'Iuliana', 'Lacramioara', 'Laura', 'Lavinia', 'Leontina', 'Lidia', 'Liliana', 'Lina', 'Livia', 'Loredana', 'Lucia', 'Lucica', 'Lucretia', 'Luminita', 'Marcela', 'Mariana', 'Marilena', 'Marinela', 'Marioara', 'Mihaela', 'Mioara', 'Mirela', 'Monica', 'Natalia', 'Nicoleta', 'Niculina', 'Olimpia', 'Otilia', 'Paula', 'Paulina', 'Petronela', 'Ramona', 'Rodica', 'Rozalia', 'Sabina', 'Silvia', 'Simona', 'Sorina', 'Stela', 'Steliana', 'Steluta', 'Susana', 'Terezia', 'Tinca', 'Valentina', 'Valeria', 'Valerica', 'Veronica', 'Victoria', 'Violeta', 'Viorica', 'Virginia');
                            
    vec_prenume_baieti ARR := ARR('Adrian', 'Alin', 'Augustin', 'Aurelian', 'Claudiu', 'Cornel', 'Corneliu', 'Costel', 'Costica', 'Cristian', 'Cristinel', 'Dorel', 'Dorin', 'Doru', 'Eduard', 'Emil', 'Emilian', 'Eugen', 'Florian', 'Florin', 'Gabriel', 'George', 'Ionel', 'Ionut', 'Iulian', 'Iuliu', 'Laurentiu', 'Levente', 'Liviu', 'Ludovic', 'Marcel', 'Marian', 'Marius', 'Mihaita', 'Neculai', 'Nelu', 'Nicolae', 'Nicolaie', 'Nicu', 'Niculae', 'Niculaie','Nicusor', 'Octavian', 'Ovidiu', 'Paul', 'Remus', 'Robert', 'Romeo', 'Sandu', 'Sebastian', 'Sergiu', 'Silviu', 'Sorin', 'Stefan', 'Stelian', 'Tiberiu', 'Traian', 'Valentin', 'Valeriu', 'Victor', 'Viorel', 'Virgil');
    
    vec_nr_tel ARR := ARR('0758634834', '0754633434', '0728634644', '0753162830', '0741163834', '0754133434', '0728637824', '0753163210', '07586447346', '0754633480', '0728639064', '0753060730');
    
    vec_categorie ARR := ARR('student', 'elev', 'pensionar', 'adult', 'copil');
    
    vec_sex ARR := ARR('F', 'M');
    
    vec_specializari ARR := ARR('ALERGOLOGIE SI IMUNOLOGIE CLINICA',  'ANESTEZIE SI TERAPIE INTENSIVA',  'BOLI INFECTIOASE', 'CARDIOLOGIE', 'CHIRURGIE GENERALA', 
                               'CHIRURGIE ORALA SI MAXILO-FACIALA', 'CHIRURGIE PEDIATRICA', 'CHIRURGIE TORACICA', 'CHIRURGIE VASCULARA', 'ENDOCRINOLOGIE' , 
                               'HEMATOLOGIE',  'MEDICINA DE FAMILIE', 'NEFROLOGIE', 'NEUROLOGIE',  'OBSTETRICA-GINECOLOGIE', 'OFTALMOLOGIE', 'ONCOLOGIE','ORTOPEDIE',
                               'PEDIATRIE', 'PNEUMOLOGIE',  'PSIHIATRIE',  'RADIOTERAPIE',  'UROLOGIE', 'NEUROCHIRURGIE', 'GASTROENTEROLOGIE', 'DERMATOVENEROLOGIE',
                               'EPIDEMIOLOGIE', 'PARODONTOLOGIE',  'PEDODONTIE', 'STOMATOLOGIE', 'DERMATOLOGIE', 'IMUNOLOGIE', 'MEDICINA LEGALA', 'MEDICINA DE FAMILIE', 
                               'ORTOPEDIE', 'ORL');
                               
    vec_specializari_sectii ARR := ARR( 'PEDIATRIE', 'GINECOLOGIE','BOLO INFECTIOASE', 'NEUROLOGIE','CARDIOLOGIE',
                                        'HEMATOLOGIE','TERAPIE INTENSIVA','CHIRURGIE','ORTOPEDIE','ONCOLOGIE', 'OFTALMOLOGIE');
                                        
    vec_medicamente ARR := ARR('Venlax', 'Efexor', 'Efectin', 'Faxine', 'Diclofenac', 'Aspirina', 'Parasinus', 'Ibuprofen', 'Keterolac', 'Naproxen', 
                               'Piroxicam', 'Lumiracoxib', 'Pethidine', 'Morfina', 'Tramadol', 'Paracetamol', 'Celecoxib', 'Nurofen', 'Sandoz', 
                               'Abacavir', 'Abasaglar', 'Abilify', 'ACC', 'Aciclovir', 'Amoxicilina', 'Cicatrol', 'Darizol', 'Dexamed', 'Diflucan', 
                               'Enafilzil', 'Faringo', 'Fervex', 'Fuzeon', 'Inflectra', 'Klacid', 'Legalon', 'Lercaril', 'Lipofib', 'Memantina',
                               'Metoject', 'Monoprid', 'Movalis', 'Neoclarityn', 'Nevanac', 'Nolpaza', 'Novocalmin', 'Olssa', 'Omicral', 'Oxacilina', 
                               'Ovestin', 'Palexia', 'Panadol', 'Penicilina', 'Ribovact', 'Ropinirol', 'Rosudapin', '	Salazidin', 'Septolete', 
                               'Sinerdol', 'Stadalax', 'Targocid', 'Tetavax', 'Tramadol', 'Valarox', 'Vasopirin', 'Xaleba', 'Zenaro', 'Zofenopril',
                               'Zolinef', 'Zoloft', 'Zycalor', 'Zyrtec');
                               
    vec_diagnostic ARR := ARR( 'Poliomielita acuta neparalitica', 'Panencefalita sclerozanta subacuta', 'Dermatita cercariara', 'Dicrocoeliaza',
                                'Hepatita acuta c', 'Ulcerul esofagului', 'Ulcerul gastric', 'Obstructia duodenului', 'Berilioza', 'Sideroza',
                                'Bronsita acuta datorita virusului coxsackie', 'Pneumonie', 'Stenoza mitrala', 'Insuficienta tricuspida', 
                                'Angina instabila', 'Sindromul dressler', 'Anevrismul arterei coronare', 'Ateroscleroza cerebrala', 'Encefalopatia hipertensiva',
                                'Marasm nutritional', 'Adipozitate localizata', 'Albinism', 'Fenilcetonuria clasica', 'Deficit congenital in lactaza',
                                'Nevrita optica', 'Atrofia optica', 'Conjuctivita cronica', 'Otita externa maligna', 'Onicholiza','Dermatita seboreica',
                                'Urticaria alergica', 'Piodermita gangrenoasa', 'Alfa-thalasemia', 'Beta-thalasemia', 'Sferocitoza ereditara', 
                                'Elliptocitoza ereditara', 'Poliarterita nodoasa', 'Coxa plana', 'Poliartroza', 'Nodozitati bouchard',
                                'Litiaza vezicala', 'Calculii rinichiului', 'Sindrom nefritic acut','Mastopatia chistica difuza', 
                                'Ectazia canalelor galactofore', 'Fibroscleroza sanului', 'Mastodinie', 'Atrofia sanului', 'Necroza adipoasa a sanului',
                                'Fisura si fistula');
    
    --- PACIENTI / DOCTORI / ASISTENTI / STAFF ----
    vec_nume VARCHAR2(255);
    vec_prenume VARCHAR2(255);
    id_pacient INT;
    varsta INT;
    inaltime INT;
    greutate number(5);
    telefon VARCHAR2(12);
    data_nastere DATE;
    categorie VARCHAR2(25);
    cnt INT;
    nr_inregistrari_pacienti INT := 100000;
    nr_inregistrari_femei INT := 101;
    nr_inregistrari_barbati INT := 62;
    nr_specializari INT := 36;
    nr_medicamente INT := 73;
    nr_rapoarte INT := 1000;
    nr_fise INT := 100000;
    nr_fise_pacient INT := 10;
    random_nr INT;
    
    ---- SPECIALIZARE / DOCTOR / ASISTENT ----
    id_specializare INT;
    nume_specializare VARCHAR2(255);
    
    ---- SECTIE ----
    id_sectie INT;
    
    --- Camere ---
    id_camera INT;
    nr_locuri INT;
    
    --- Staff ---
    CNP NUMBER(15);
    
    --- Medicamente ---
    nume_medicament VARCHAR2(255);
    
    cnt_fise INT;
    
    
BEGIN

     DBMS_OUTPUT.PUT_LINE('Inserare pacienti.');
     cnt := 1;
     
     FOR contor IN 1..nr_inregistrari_pacienti LOOP
        vec_nume := vec_nume_familie(DBMS_RANDOM.VALUE(1,1000));
        random_nr := TRUNC(DBMS_RANDOM.VALUE(0, 2));
        IF(random_nr = 0) THEN
            vec_prenume := vec_prenume_fete(TRUNC(DBMS_RANDOM.VALUE(1,102)));
        ELSIF (random_nr = 1) THEN
            vec_prenume := vec_prenume_baieti(TRUNC(DBMS_RANDOM.VALUE(1, 62)));
        END IF;
        inaltime := TRUNC(DBMS_RANDOM.VALUE(25,200));
        greutate := TRUNC(DBMS_RANDOM.VALUE(1,130));
        telefon := vec_nr_tel(TRUNC(DBMS_RANDOM.VALUE(1, 11)));
        data_nastere :=  TO_DATE('01-01-1974','MM-DD-YYYY')+ TRUNC(DBMS_RANDOM.VALUE(0,16500));
        if(EXTRACT(YEAR from DATA_NASTERE) > 1992 AND EXTRACT(YEAR from DATA_NASTERE) < 2000) THEN categorie := vec_categorie(1);
        ELSIF(EXTRACT(YEAR from DATA_NASTERE) >= 2000 AND EXTRACT(YEAR from DATA_NASTERE) < 2013) THEN categorie := vec_categorie(2);
        ELSIF(EXTRACT(YEAR from DATA_NASTERE) > 2012) THEN categorie := vec_categorie(5);
        ELSIF(EXTRACT(YEAR from DATA_NASTERE) > 1957 AND EXTRACT(YEAR from DATA_NASTERE) <= 1992) THEN categorie := vec_categorie(4);
        ELSIF(EXTRACT(YEAR FROM DATA_NASTERE) <= 1957) THEN categorie := vec_categorie(3);
        END IF;
        id_pacient := cnt;
        cnt := cnt + 1;
        INSERT INTO PACIENT VALUES(ID_PACIENT, VEC_NUME, VEC_PRENUME, INALTIME, greutate, VEC_SEX(1), TELEFON, DATA_NASTERE, CATEGORIE);
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('Done!');   
    
    DBMS_OUTPUT.PUT_LINE('Inserare specializari.');
    
    FOR contor IN 1..nr_specializari LOOP
        id_specializare := contor;
        nume_specializare := vec_specializari(contor);
        INSERT INTO SPECIALIZARE VALUES(id_specializare, nume_specializare);
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('Done!');
    DBMS_OUTPUT.PUT_LINE('Inserare sectii.');
    
    FOR contor IN 1..10 LOOP
        id_sectie := contor;
        nume_specializare := vec_specializari_sectii(contor);
        INSERT INTO SECTIE VALUES(id_sectie, nume_specializare);
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('Done!');
    DBMS_OUTPUT.PUT_LINE('Inserare camere.');
    
    FOR contor IN 1..10 LOOP
        random_nr := TRUNC(DBMS_RANDOM.VALUE(10, 25));
        id_sectie := contor;
        FOR i IN 1..random_nr LOOP
            id_camera := i;
            nr_locuri := TRUNC(DBMS_RANDOM.VALUE(1, 5));
            INSERT INTO Camera VALUES(id_camera, id_sectie, nr_locuri);
        END LOOP;
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('Done!');
    
    DBMS_OUTPUT.PUT_LINE('Inserare staff.');
    DBMS_OUTPUT.PUT_LINE('Inserare ingrijitori.');
    cnt := 1;
    FOR contor IN 1..20 LOOP
        random_nr := TRUNC(DBMS_RANDOM.VALUE(0, 2));
        IF(random_nr = 0) THEN
            vec_prenume := vec_prenume_fete(TRUNC(DBMS_RANDOM.VALUE(1,102)));
        ELSIF (random_nr = 1) THEN
            vec_prenume := vec_prenume_baieti(TRUNC(DBMS_RANDOM.VALUE(1, 62)));
        END IF;
        CNP := TRUNC(DBMS_RANDOM.VALUE(1000000000000,9999999999999));
        INSERT INTO Staff VALUES(contor, CNP, vec_nume_familie(TRUNC(DBMS_RANDOM.VALUE(1,1000))), vec_prenume, 'Ingrijitor', 1500);
         FOR i in 1..nr_rapoarte LOOP
            INSERT INTO Raport VALUES (cnt, NULL, DBMS_RANDOM.VALUE(0,24), DBMS_RANDOM.VALUE(0,24),  TO_DATE('01-01-2015','MM-DD-YYYY')+ TRUNC(DBMS_RANDOM.VALUE(0,1200))); 
        END LOOP;
        cnt := cnt + 1;
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('Done!');
    DBMS_OUTPUT.PUT_LINE('Inserare receptioneri.');
    FOR contor IN 1..3 LOOP
        random_nr := TRUNC(DBMS_RANDOM.VALUE(0, 2));
        IF(random_nr = 0) THEN
            vec_prenume := vec_prenume_fete(TRUNC(DBMS_RANDOM.VALUE(1,102)));
        ELSIF (random_nr = 1) THEN
            vec_prenume := vec_prenume_baieti(TRUNC(DBMS_RANDOM.VALUE(1, 62)));
        END IF;
        CNP := TRUNC(DBMS_RANDOM.VALUE(1000000000000,9999999999999));
        INSERT INTO Staff VALUES(cnt, CNP, vec_nume_familie(TRUNC(DBMS_RANDOM.VALUE(1,1000))), vec_prenume, 'Receptioner', 2000);
        FOR i in 1..nr_rapoarte LOOP
            INSERT INTO Raport VALUES (cnt, NULL, DBMS_RANDOM.VALUE(0,24), DBMS_RANDOM.VALUE(0,24),  TO_DATE('01-01-2015','MM-DD-YYYY')+ TRUNC(DBMS_RANDOM.VALUE(0,1200))); 
        END LOOP;
        cnt := cnt + 1;
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('Done!');
    DBMS_OUTPUT.PUT_LINE('Inserare paznici.');
    FOR contor IN 1..10 LOOP
        random_nr := TRUNC(DBMS_RANDOM.VALUE(0, 2));
        IF(random_nr = 0) THEN
            vec_prenume := vec_prenume_fete(TRUNC(DBMS_RANDOM.VALUE(1,102)));
        ELSIF (random_nr = 1) THEN
            vec_prenume := vec_prenume_baieti(TRUNC(DBMS_RANDOM.VALUE(1, 62)));
        END IF;
        CNP := TRUNC(DBMS_RANDOM.VALUE(1000000000000,9999999999999));
        INSERT INTO Staff VALUES(cnt, CNP, vec_nume_familie(TRUNC(DBMS_RANDOM.VALUE(1,1000))), vec_prenume, 'Paznic', 1800);
        FOR i in 1..nr_rapoarte LOOP
            INSERT INTO Raport VALUES (cnt, NULL, DBMS_RANDOM.VALUE(0,24), DBMS_RANDOM.VALUE(0,24),  TO_DATE('01-01-2015','MM-DD-YYYY')+ TRUNC(DBMS_RANDOM.VALUE(0,1200))); 
        END LOOP;
        cnt := cnt + 1;
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('Done!');
    DBMS_OUTPUT.PUT_LINE('Inserare doctori.');
    
    FOR contor IN 1..20 LOOP
        random_nr := TRUNC(DBMS_RANDOM.VALUE(0, 2));
        IF(random_nr = 0) THEN
            vec_prenume := vec_prenume_fete(TRUNC(DBMS_RANDOM.VALUE(1,102)));
        ELSIF (random_nr = 1) THEN
            vec_prenume := vec_prenume_baieti(TRUNC(DBMS_RANDOM.VALUE(1, 62)));
        END IF;
        
        id_sectie := TRUNC(DBMS_RANDOM.VALUE(1, 10));
        CNP := TRUNC(DBMS_RANDOM.VALUE(1000000000000,9999999999999));
        INSERT INTO Staff VALUES(cnt, CNP, vec_nume_familie(TRUNC(DBMS_RANDOM.VALUE(1,1000))), vec_prenume, 'Doctor', 8000);
        INSERT INTO Doctor VALUES(cnt, id_sectie, TRUNC(DBMS_RANDOM.VALUE(1, 6)), TRUNC(DBMS_RANDOM.VALUE(7, 12)), TRUNC(DBMS_RANDOM.VALUE(13, 18)), TRUNC(DBMS_RANDOM.VALUE(19, 24)), TRUNC(DBMS_RANDOM.VALUE(25, 36)));
        
        FOR i in 1..nr_rapoarte LOOP
            INSERT INTO Raport VALUES (cnt, id_sectie, DBMS_RANDOM.VALUE(0,24), DBMS_RANDOM.VALUE(0,24),  TO_DATE('01-01-2015','MM-DD-YYYY')+ TRUNC(DBMS_RANDOM.VALUE(0,1200))); 
        END LOOP;
        cnt := cnt + 1;
        
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('Done!');
    DBMS_OUTPUT.PUT_LINE('Inserare asistente.');
    FOR contor IN 1..100 LOOP
        random_nr := TRUNC(DBMS_RANDOM.VALUE(0, 2));
        IF(random_nr = 0) THEN
            vec_prenume := vec_prenume_fete(TRUNC(DBMS_RANDOM.VALUE(1,102)));
        ELSIF (random_nr = 1) THEN
            vec_prenume := vec_prenume_baieti(TRUNC(DBMS_RANDOM.VALUE(1, 62)));
        END IF;
        CNP := TRUNC(DBMS_RANDOM.VALUE(1000000000000,9999999999999));
        INSERT INTO Staff VALUES(cnt, CNP, vec_nume_familie(TRUNC(DBMS_RANDOM.VALUE(1,1000))), vec_prenume, 'Asistent', 4000);
        INSERT INTO Asistent VALUES(cnt, TRUNC(DBMS_RANDOM.VALUE(1, 10)), TRUNC(DBMS_RANDOM.VALUE(1, 6)), TRUNC(DBMS_RANDOM.VALUE(7, 12)), TRUNC(DBMS_RANDOM.VALUE(13, 18)), TRUNC(DBMS_RANDOM.VALUE(19, 24)), TRUNC(DBMS_RANDOM.VALUE(25, 36)));
        
        FOR i in 1..nr_rapoarte LOOP
            INSERT INTO Raport VALUES (cnt, id_sectie, DBMS_RANDOM.VALUE(0,24), DBMS_RANDOM.VALUE(0,24),  TO_DATE('01-01-2015','MM-DD-YYYY')+ TRUNC(DBMS_RANDOM.VALUE(0,1200))); 
        END LOOP;
        cnt := cnt + 1;

    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('Done!');
    DBMS_OUTPUT.PUT_LINE('Inserare medicamente.');
    
    FOR contor IN 1..72 LOOP
        nume_medicament := vec_medicamente(contor);
        INSERT INTO Medicament VALUES(contor, nume_medicament);
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('Done!');
    DBMS_OUTPUT.PUT_LINE('Inserare fise medicale.');
    
    cnt_fise := 1;
    FOR contor IN 1..nr_fise LOOP
        FOR i IN 1..nr_fise_pacient LOOP
            INSERT INTO FISA_PACIENT VALUES(cnt_fise, contor, TRUNC(DBMS_RANDOM.VALUE(34, 53)) ,(TO_DATE('01-01-1974','MM-DD-YYYY')+ TRUNC(DBMS_RANDOM.VALUE(16470,16500))),
                                            (TO_DATE('01-01-1974','MM-DD-YYYY')+ TRUNC(DBMS_RANDOM.VALUE(16500,16530))), vec_diagnostic(TRUNC(DBMS_RANDOM.VALUE(1,50))), TRUNC(DBMS_RANDOM.VALUE(1, nr_medicamente)), 
                                            NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
            cnt_fise := cnt_fise + 1;
        END LOOP;
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('Done!');
    DBMS_OUTPUT.PUT_LINE('Inserare facturi.');
    FOR contor IN 1..(nr_fise * nr_fise_pacient) LOOP
        INSERT INTO Factura VALUES(CONTOR, CONTOR, DBMS_RANDOM.VALUE(100,6000));
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('Done!');
END;
/

select COUNT(*) FROM PACIENT;/
SELECT count(*) FROM Fisa_pacient;/
SELECT count(*) FROM FACTURA;/



