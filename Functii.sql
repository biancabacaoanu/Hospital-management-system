-------------------------------------------------------------------------- ASISTENT ----------------------------------------------------------------------------------------------

set serveroutput on;
create or replace function gtAsistent(id_asistent number) return varchar2
is
asistentInfo ASISTENT%ROWTYPE;
nume varchar2(256);
prenume varchar2(256);
sectie varchar2(256);
denumire1 varchar2(256);
denumire2 varchar2(256);
denumire3 varchar2(256);
denumire4 varchar2(256);
denumire5 varchar2(256);
begin
    SELECT s.nume, s.prenume, n.denumire, p.denumire, p2.denumire, p3.denumire, p4.denumire, p5.denumire INTO nume, prenume, sectie, denumire1, denumire2, denumire3, denumire4, denumire5  FROM ASISTENT a
    JOIN SPECIALIZARE p ON p.id = a.id_specializare1
    JOIN SPECIALIZARE p2 ON p2.id = a.id_specializare2
    JOIN SPECIALIZARE p3 ON p3.id = a.id_specializare3
    JOIN SPECIALIZARE p4 ON p4.id = a.id_specializare4
    JOIN SPECIALIZARE p5 ON p5.id = a.id_specializare5
    JOIN STAFF s ON s.id = a.id
    JOIN SECTIE n ON n.id = a.id_sectie
    WHERE a.id = id_asistent;
    
    return nume || '/' || prenume || '/' || sectie || '/' || denumire1 || '/' || denumire2 || '/' || denumire3 || '/' || denumire4 || '/' || denumire5;
end;

------------------------------------------------------------------------- SECTIE ---------------------------------------------------------------

create or replace function getSectie(id_sectie number) return varchar2
is
    nr_camere number;
    denumire varchar2(256);
begin
    SELECT SUM(c.numar_locuri) INTO nr_camere FROM SECTIE s
    JOIN CAMERA c ON c.id_sectie = s.id
    WHERE s.id = id_sectie;
    
    SELECT s.denumire INTO denumire FROM SECTIE s
    WHERE s.id = id_sectie;
    
    return denumire || '/' || nr_camere;
end;

-------------------------------------------------------------- STAFF LISTA --------------------------------------------------------------

create or replace package pck_liste is
    TYPE linie_staff IS TABLE OF STAFF%ROWTYPE;
    function lista_staff return linie_staff;
end pck_liste;

create or replace package body pck_liste AS

 function lista_staff return linie_staff IS
      lista_angajati linie_staff;
      BEGIN
      
      SELECT st.* BULK COLLECT INTO lista_angajati FROM STAFF st;
      
      return lista_angajati;  
      exception
      when OTHERS then
      return null;
   end lista_staff;
   
end pck_liste;

set serveroutput on;
declare 
   l_result pck_liste.linie_staff;
begin   
   l_result := pck_liste.lista_staff();
    for i in l_result.first..l_result.last loop
    if l_result.exists(i) then 
    DBMS_OUTPUT.PUT_LINE( l_result(i).nume || ' ' || l_result(i).prenume);  
    end if;
    end loop;   
end;

------------------------------------------------------------ GARZI -------------------------------------------------------------

create or replace package pck_garda is
    TYPE linie_raport IS TABLE OF RAPORT%ROWTYPE;
    function lista_raport(id_pers number) return linie_raport;
end pck_garda;

create or replace package body pck_garda AS

 function lista_raport(id_pers number) return linie_raport IS
      list_raport linie_raport;
      BEGIN
      
      SELECT * BULK COLLECT INTO list_raport FROM RAPORT
      WHERE id_personal = id_pers;
      
      return list_raport;  
      exception
      when OTHERS then
      return null;
   end lista_raport;
   
end pck_garda;

set serveroutput on;
declare 
   l_result pck_garda.linie_raport;
begin   
   l_result := pck_garda.lista_raport(34);
    for i in l_result.first..l_result.last loop
    if l_result.exists(i) then 
    DBMS_OUTPUT.PUT_LINE( l_result(i).id_sectie || ' ' || l_result(i).ora_start || ' ' || l_result(i).ora_final );  
    end if;
    end loop;   
end;

set serveroutput on;
create or replace function gtDoctor(id_doctor number) return varchar2
is
nume varchar2(256);
prenume varchar2(256);
sectie varchar2(256);
denumire1 varchar2(256);
denumire2 varchar2(256);
denumire3 varchar2(256);
denumire4 varchar2(256);
denumire5 varchar2(256);
salariu number;
begin
    SELECT s.nume, s.prenume, n.denumire, p.denumire, p2.denumire, p3.denumire, p4.denumire, p5.denumire, s.salariu INTO nume, prenume, sectie, denumire1, denumire2, denumire3, denumire4, denumire5, salariu  FROM Doctor a
    JOIN SPECIALIZARE p ON p.id = a.id_specializare1
    JOIN SPECIALIZARE p2 ON p2.id = a.id_specializare2
    JOIN SPECIALIZARE p3 ON p3.id = a.id_specializare3
    JOIN SPECIALIZARE p4 ON p4.id = a.id_specializare4
    JOIN SPECIALIZARE p5 ON p5.id = a.id_specializare5
    JOIN STAFF s ON s.id = a.id
    JOIN SECTIE n ON n.id = a.id_sectie
    WHERE a.id = id_doctor;
    
    return nume || '/' || prenume || '/' || sectie || '/' || denumire1 || '/' || denumire2 || '/' || denumire3 || '/' || denumire4 || '/' || denumire5 || '/' || salariu;
end;

set serveroutput on;
declare
    val varchar2(256);
begin
    val:=gtDoctor(35);
    DBMS_OUTPUT.PUT_LINE(val);
end;


---------------------------------------------------------- TRATAMENT ----------------------------------------------------------------------------

create or replace package pck_tratament is
    TYPE linie_tratament IS TABLE OF MEDICAMENT%ROWTYPE;
    function lista_tratamente(id_pers number) return linie_tratament;
end pck_tratament;

create or replace package body pck_tratament AS

 function lista_tratamente(id_pers number) return linie_tratament IS
      list_tratamente linie_tratament;
      BEGIN
      
      SELECT m.* BULK COLLECT INTO list_tratamente FROM FISA_PACIENT p
      JOIN MEDICAMENT m ON m.id = p.id_medicament1
      WHERE id_pacient = id_pers
      ORDER BY DATA_INTERNARE DESC;
      
      return list_tratamente;  
      exception
      when OTHERS then
      return null;
   end lista_tratamente;
   
end pck_tratament;

set serveroutput on;
declare 
   l_result pck_tratament.linie_tratament;
begin   
   l_result := pck_tratament.lista_tratamente(5);
    for i in l_result.first..l_result.last loop
    if l_result.exists(i) then 
         DBMS_OUTPUT.PUT_LINE( l_result(i).denumire);  
    end if;
    end loop;   
end;

------------------------------------------------------------ BOLI FRECVENTE -----------------------------------------------------

create or replace package pck_boli is
    TYPE linie_diagnostic IS TABLE OF FISA_PACIENT%ROWTYPE;
    function lista_boli return linie_diagnostic;
end pck_boli;

create or replace package body pck_boli AS

 function lista_boli return linie_diagnostic IS
      list_diag linie_diagnostic;
      BEGIN
      
      SELECT * BULK COLLECT INTO list_diag FROM FISA_PACIENT
      GROUP BY diagnostic
      ORDER BY COUNT(DIAGNOSTIC) DESC;
      
      return list_diag;  
      exception
      when OTHERS then
      return null;
   end lista_boli;
   
end pck_boli;

set serveroutput on;
declare 
   l_result pck_boli.linie_diagnostic;
begin   
    l_result := pck_boli.lista_boli();
    for i in l_result.first..l_result.last loop
    if l_result.exists(i) then 
         DBMS_OUTPUT.PUT_LINE( l_result(i).diagnostic);  
    end if;
    end loop;   
end;
