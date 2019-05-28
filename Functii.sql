-------------------------------------------------------------------------- PERSONAL ----------------------------------------------------------------------------------------------

create or replace package pck_personal is
    function gtAsistent(id_asistent number) return varchar2;
    function gtDoctor(id_doctor number) return varchar2;
    procedure adauga_Personal(ID staff.ID%TYPE, cnp staff.cnp%type, nume staff.nume%type, prenume staff.prenume%type,
                      functie staff.functie%type, salariu staff.salariu%type);
end pck_personal;

create or replace package body pck_personal AS
    function gtAsistent(id_asistent number) return varchar2
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
    end gtAsistent;
    
    function gtDoctor(id_doctor number) return varchar2
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
    end gtDoctor;
    
    procedure adauga_Personal(ID staff.ID%TYPE, cnp staff.cnp%type, nume staff.nume%type, prenume staff.prenume%type, functie staff.functie%type, salariu staff.salariu%type)
    is 
    begin
         INSERT INTO STAFF(ID, CNP, NUME, PRENUME, FUNCTIE,SALARIU) values(ID,cnp,nume,prenume,functie,salariu);
    end adauga_Personal;

end pck_personal;

set serveroutput on;
declare
    val varchar2(256);
begin
    val:=pck_personal.gtDoctor(35);
    DBMS_OUTPUT.PUT_LINE(val);
end;

exec pck_personal.adauga_Personal(160, 012345678, 'Baciu', 'Narcisa','asistent','4500');

------------------------------------------------------------------------- SECTIE ---------------------------------------------------------------
create or replace package pck_sectie is 
    function getSectie(id_sectie number) return varchar2;
end pck_sectie;
/
create or replace package body pck_sectie AS

    function getSectie(id_sectie number) return varchar2
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

end pck_sectie;

-------------------------------------------------------------- STAFF LISTA --------------------------------------------------------------

create or replace package pck_liste is
    TYPE linie_staff IS TABLE OF STAFF%ROWTYPE;
    function lista_staff return linie_staff;
    procedure marire_salariu(in_id_personal STAFF.id%type, sal STAFF.salariu%TYPE);
end pck_liste;
/
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
   
   procedure marire_salariu(in_id_personal STAFF.id%type, sal STAFF.salariu%TYPE)
      is
      valoare STAFF.salariu%type:=250;
       valoare_salariu STAFF.salariu%type:=0; 
      begin
      
      SELECT salariu into valoare_salariu FROM staff where in_id_personal=id;
       valoare_salariu:=valoare_salariu+valoare;
       update STAFF set salariu = valoare_salariu
    where in_id_personal = id;
    end marire_salariu;
   
end pck_liste;

exec pck_liste.marire_salariu(1, 25);

set serveroutput on;
declare 
   linie pck_liste.linie_staff;
begin   
    linie := pck_liste.lista_staff();
    for i in linie.first..linie.last loop
        if linie.exists(i) then 
             DBMS_OUTPUT.PUT_LINE( linie(i).nume || ' ' || linie(i).prenume);  
        end if;
    end loop;   
end;

------------------------------------------------------------ GARZI -------------------------------------------------------------

create or replace package pck_garda is
    TYPE linie_raport IS TABLE OF RAPORT%ROWTYPE;
    function lista_raport(id_pers number) return linie_raport;
    procedure garda_x_1( id_p RAPORT.id_personal%type, ora_s RAPORT.ora_start%type, ora_f RAPORT.ora_final%type, 
                                         data_r RAPORT.data_raport%type);
end pck_garda;
/
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
   
 procedure garda_x_1( id_p RAPORT.id_personal%type, ora_s RAPORT.ora_start%type, ora_f RAPORT.ora_final%type, 
                                         data_r RAPORT.data_raport%type)
    is
    p_mesaj VARCHAR2(100);
    cursor c is 
    SELECT s.nume, s.prenume, s.functie FROM raport r  JOIN staff s on r.id_personal=s.id WHERE r.ora_start=ora_s and r.ora_final=ora_f
                      and id_p=r.id_personal and r.data_raport=data_r;
    begin 
    for c_record in c loop
     p_mesaj:=(c_record.nume||' '||c_record.prenume||' '|| c_record.functie);
      dbms_output.put_line(p_mesaj);
     end loop;
    end;
   
end pck_garda;

set serveroutput on;
declare 
   linie pck_garda.linie_raport;
begin   
    linie := pck_garda.lista_raport(34);
    for i in linie.first..linie.last loop
        if linie.exists(i) then 
             DBMS_OUTPUT.PUT_LINE( linie(i).id_sectie || ' ' || linie(i).ora_start || ' ' || linie(i).ora_final );  
        end if;
    end loop;   
end;

exec pck_garda.garda_x_1(1,2,4,'19-MAR-17');

---------------------------------------------------------- FISA_PACIENT ----------------------------------------------------------------------------

create or replace package pck_fisapacient is
    TYPE linie_tratament IS TABLE OF MEDICAMENT%ROWTYPE;
    function lista_tratamente(id_pers number) return linie_tratament;
    procedure add_fisa_pacient(id number, id_pacient number, id_doctor number, data_internare date, data_externare date, diagnostic varchar2, id_medicament1 number, id_medicament2 number, id_medicament3 number,
    id_medicament4 number, id_medicament5 number, id_medicament6 number, id_medicament7 number, id_medicament8 number, id_medicament9 number, id_medicament10 number);
    function fisa_tp(id_pac number) return varchar2;
    procedure adauga_Pacient(id NUMBER, nume VARCHAR2, prenume VARCHAR2, inaltime NUMBER, greutate NUMBER, sex CHAR, telefon NUMBER, data_nastere DATE, categorie VARCHAR2);
    procedure nr_zile_internare(id_pac in FISA_PACIENT.id_pacient%type, id_doc FISA_PACIENT.ID_DOCTOR%TYPE);  
    procedure numar_fisa_pacient(in_id FISA_PACIENT.id_pacient%type);
    procedure localizare_pacient(id_pac FISA_PACIENT.id_pacient%type);
end pck_fisapacient;
/
create or replace package body pck_fisapacient AS
  
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
   
 procedure add_fisa_pacient(id number, id_pacient number, id_doctor number, data_internare date, data_externare date, diagnostic varchar2, id_medicament1 number, id_medicament2 number, id_medicament3 number,
    id_medicament4 number, id_medicament5 number, id_medicament6 number, id_medicament7 number, id_medicament8 number, id_medicament9 number, id_medicament10 number) IS
    BEGIN
         INSERT INTO FISA_PACIENT 
            (id, id_pacient, id_doctor, data_internare, data_externare, diagnostic, id_medicament1, id_medicament2, id_medicament3,
            id_medicament4, id_medicament5, id_medicament6, id_medicament7, id_medicament8, id_medicament9, id_medicament10) VALUES 
            (id, id_pacient, id_doctor, data_internare, data_externare, diagnostic, id_medicament1, id_medicament2, id_medicament3,
            id_medicament4, id_medicament5, id_medicament6, id_medicament7, id_medicament8, id_medicament9, id_medicament10);
    END add_fisa_pacient;
    
    function fisa_tp(id_pac number) return varchar2 IS
        nume_pacient varchar2(256);
        nume_doctor varchar2(256);
        data_internare date;
        diagnostic varchar2(256);
        medicament1 varchar2(256);
        medicament2 varchar2(256);
        medicament3 varchar2(256);
    BEGIN
        SELECT p.nume, s.nume, f.data_internare, f.diagnostic, m1.denumire INTO nume_pacient, nume_doctor, data_internare, diagnostic, medicament1 FROM FISA_PACIENT f
        JOIN PACIENT p ON id_pac = p.id
        JOIN STAFF s ON s.id = f.id_doctor
        JOIN MEDICAMENT m1 ON m1.id = f.id_medicament1
        WhERE f.id_pacient = id_pac AND rownum < 2
        ORDER BY f.DATA_EXTERNARE DESC;
        
        SELECT m.denumire INTO medicament2 FROM FISA_PACIENT p
        JOIN MEDICAMENT m ON m.id = p.id_medicament2
        WHERE p.id_pacient = id_pac AND ROWNUM < 2
        ORDER BY p.data_externare DESC;
        
        SELECT m.denumire INTO medicament3 FROM FISA_PACIENT p
        JOIN MEDICAMENT m ON m.id = p.id_medicament3
        WHERE p.id_pacient = id_pac AND ROWNUM < 2
        ORDER BY p.data_externare DESC;
          
        return nume_pacient || '/' || nume_doctor || '/' || data_internare || '/' || diagnostic || '/' ||  medicament1 || '/' ||  medicament2 || '/' ||  medicament3;      
    END fisa_tp;
    
    procedure adauga_Pacient(id NUMBER, nume VARCHAR2, prenume VARCHAR2,
                              inaltime NUMBER, greutate NUMBER, sex CHAR, telefon NUMBER,
                              data_nastere DATE, categorie VARCHAR2) is
    begin
    INSERT INTO PACIENT( ID, NUME, PRENUME, INALTIME, GREUTATE,SEX, TELEFON, DATA_NASTERE,CATEGORIE) VALUES( id ,nume, prenume, inaltime,greutate,
                         sex,telefon, data_nastere, categorie);
    end adauga_Pacient;
    
    procedure nr_zile_internare(id_pac in FISA_PACIENT.id_pacient%type, id_doc FISA_PACIENT.ID_DOCTOR%TYPE)
     is
     numar NUMBER;
     begin 
         SELECT TO_DATE(f.data_externare)-TO_DATE(f.data_internare) into numar FROM FISA_PACIENT f  
         WHERE f.id_pacient=id_pac and f.ID_DOCTOR=id_doc and ROWNUM=1
         ORDER BY data_externare DESC;
         DBMS_OUTPUT.PUT_LINE(numar);
    end nr_zile_internare;
    
    procedure numar_fisa_pacient(in_id FISA_PACIENT.id_pacient%type)
    is 
      numar NUMBER;
      begin 
          SELECT count(id) into numar FROM fisa_pacient WHERE id_pacient=in_id;
           DBMS_OUTPUT.PUT_LINE(numar);
    end numar_fisa_pacient;
    
    procedure localizare_pacient(id_pac FISA_PACIENT.id_pacient%type)
    is
    camera NUMBER;
    denum VARCHAR2(30);
    begin
     
     SELECT * INTO camera, denum FROM( SELECT c.id, s.denumire  FROM fisa_pacient f JOIN doctor d on d.id=f.id_doctor JOIN sectie s on s.id=d.id_sectie
                JOIN camera c on c.id_sectie=s.id WHERE f.id_pacient=id_pac ORDER BY f.data_internare DESC) WHERE ROWNUM=1;
            DBMS_OUTPUT.PUT_LINE(camera||'  '||denum);
    end;

end pck_fisapacient;

exec pck_fisapacient.adauga_Pacient( 2000321, 'Basescu', 'Ioana', 130 , 70, 'F', '0763028800', '28-DEC-1998', 'adult');
exec pck_fisapacient.numar_fisa_pacient(15);
exec pck_fisapacient.localizare_pacient(34);
    

set serveroutput on;
declare 
   linie pck_fisapacient.linie_tratament;
begin   
   linie := pck_fisapacient.lista_tratamente(5);
    for i in linie.first..linie.last loop
    if linie.exists(i) then 
         DBMS_OUTPUT.PUT_LINE( linie(i).denumire);  
    end if;
    end loop;   
end;

declare
begin
  pck_fisapacient.add_fisa_pacient(1000008, 41, TRUNC(DBMS_RANDOM.VALUE(34, 53)) ,SYSDATE,
                                            NULL, 'Poliomielita acuta neparalitica' , 10, 
                                            1, 2, 3, 4, 5, 6, 7 , 8, 9);
end;

SELECT * FROM FISA_PACIENT ORDER BY ID DESC;
SELECT * FROM PACIENT where id = 41;

set serveroutput on;
declare
    val varchar2(256);
begin
    val:=pck_fisapacient.fisa_tp(41);
    DBMS_OUTPUT.PUT_LINE(val);
end;

------------------------------------------------------------ BOLI FRECVENTE -----------------------------------------------------

create or replace package pck_boli is
    TYPE linie_diagnostic IS TABLE OF FISA_PACIENT%ROWTYPE;
    function lista_boli return linie_diagnostic;
end pck_boli;
/

create or replace package body pck_boli AS

 function lista_boli return linie_diagnostic IS 
 
      list_diag linie_diagnostic;
      BEGIN
      SELECT * BULK COLLECT INTO list_diag FROM FISA_PACIENT
      WHERE ROWNUM < 4
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
   linie pck_boli.linie_diagnostic;
begin   
    linie := pck_boli.lista_boli();
    for i in linie.first..linie.last loop
        if linie.exists(i) then 
             DBMS_OUTPUT.PUT_LINE(linie(i).diagnostic);  
        end if;
    end loop;   
end;

----------------------------------------------------------------------- FACTURI ----------------------------------------------------------------------

create or replace package pck_facturi is
    procedure realizare_factura(id NUMBER, id_fisa_pacient NUMBER, plata NUMBER);
    procedure total_factura(in_id FISA_PACIENT.id_pacient%type);
end pck_facturi;
/
create or replace package body pck_facturi AS 

    procedure realizare_factura(id NUMBER, id_fisa_pacient NUMBER, plata NUMBER) is
    begin 
        INSERT INTO FACTURA(id, id_fisa_pacient, plata) VALUES (id, id_fisa_pacient, plata);
    end;
    
    procedure total_factura(in_id FISA_PACIENT.id_pacient%type)
    is 
    numar number;
    begin
        SELECT * into numar FROM(SELECT plata  FROM FACTURA f JOIN FISA_PACIENT p on f.id_fisa_pacient=p.id 
        WHERE p.id_pacient=in_id
        ORDER BY data_internare DESC)
        WHERE ROWNUM=1;
        DBMS_OUTPUT.PUT_LINE(numar);
    end;
end pck_facturi;

exec pck_facturi.realizare_factura(2000002, 1000, 14560);




